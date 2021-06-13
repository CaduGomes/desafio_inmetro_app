import 'package:flutter/material.dart';

import 'package:app/modules/bluetooth/state/ble_devices_state.dart';

import '../domain/entities/entities.dart';
import './rsa_keys_state.dart';

enum UpdateState { idle, loading, error, success }

class SignatureState extends ChangeNotifier {
  final BLEDevicesState _bleState;
  final RSAKeysState _rsaState;

  SignatureEntity signature = SignatureEntity(null, null);
  bool isValid = false;

  var state = UpdateState.idle;

  void signData() {
    print("Criando assinatura");
    state = UpdateState.loading;
    notifyListeners();
    try {
      if (_rsaState.keys.private == null) {
        throw Exception("Nenhuma chave foi criada");
      }

      if (_bleState.devices.devices.isEmpty) {
        throw Exception("Nenhuma dispositivo foi encontrado");
      }

      final sign = _rsaState.rsaRepository
          .signData(_rsaState.keys.private!, _bleState.getDevicesIds());

      this.signature = sign;
      this.isValid = true;
      print("Assinatura criada");
      state = UpdateState.success;
      notifyListeners();
    } catch (e) {
      state = UpdateState.error;
      print("Assinatura não foi criada: " + e.toString());
      notifyListeners();
      throw Exception(e);
    }
  }

  void verifySignature() {
    state = UpdateState.loading;
    notifyListeners();
    print("Verificando assinatura");
    if (_rsaState.keys.private == null) {
      throw Exception("Nenhuma chave foi gerada");
    }

    if (this.signature.signature == null) {
      throw Exception("Nenhuma assinatura foi gerada");
    }

    final verify = _rsaState.rsaRepository.verifySignature(
        this._rsaState.keys.public!,
        this._bleState.getDevicesIds(),
        this.signature);

    print("Assinatura é valida");
    this.isValid = verify.isValid;

    state = UpdateState.success;
    notifyListeners();
  }

  SignatureState(this._bleState, this._rsaState);
}
