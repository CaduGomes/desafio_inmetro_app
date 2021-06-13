import 'package:app/modules/rsa_keys/domain/usecases/usecases.dart';
import 'package:flutter/material.dart';

import 'package:app/modules/bluetooth/state/ble_devices_state.dart';

import '../domain/entities/entities.dart';
import './rsa_keys_state.dart';

enum UpdateState { idle, loading, error, success }

class SignatureState extends ChangeNotifier {
  final BLEDevicesState _bleState;
  final RSAKeysState _rsaState;
  final SignData _signData;
  final VerifySignature _verifySignature;

  bool isValid = false;
  SignatureEntity signature = SignatureEntity(null, null);

  var state = UpdateState.idle;

  Future signData() async {
    print("Criando assinatura");
    state = UpdateState.loading;
    notifyListeners();
    if (_rsaState.keys.private == null) {
      throw "Nenhuma chave foi gerada";
    }

    if (_bleState.devices.devices.isEmpty) {
      throw "A lista de dispositivos está vazia";
    }

    final result = await _signData(
        SignDataParams(_rsaState.keys.private!, _bleState.getDevicesIds()));

    result.fold((err) {
      state = UpdateState.error;
      notifyListeners();
      throw err.message;
    }, (data) {
      this.signature = data;
      this.isValid = true;
      print("Assinatura criada");
      state = UpdateState.success;
      notifyListeners();
    });
  }

  Future verifySignature() async {
    state = UpdateState.loading;
    notifyListeners();
    print("Verificando assinatura");
    if (_rsaState.keys.private == null) {
      throw "Nenhuma chave foi gerada";
    }

    if (this.signature.signature == null) {
      throw "Nenhuma assinatura foi gerada";
    }

    final result = await _verifySignature(VerifySignatureParams(
        this._rsaState.keys.public!,
        this._bleState.getDevicesIds(),
        this.signature));

    result.fold((err) {
      this.isValid = false;

      state = UpdateState.error;
      notifyListeners();
    }, (data) {
      this.isValid = true;

      state = UpdateState.success;
      notifyListeners();
    });
  }

  SignatureState(
      this._bleState, this._rsaState, this._signData, this._verifySignature);
}
