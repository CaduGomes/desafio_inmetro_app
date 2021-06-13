import 'package:flutter/material.dart';

import '../domain/repositories/rsa_key.dart';
import '../domain/entities/entities.dart';

enum UpdateState { idle, loading, error, success }

class RSAKeysState with ChangeNotifier {
  RSAKeysEntity keys = RSAKeysEntity(null, null);

  var state = UpdateState.idle;

  final RSARepository rsaRepository;

  RSAKeysState(this.rsaRepository);

  void generateKeys(int size) {
    print("Gerando chaves");
    state = UpdateState.loading;
    notifyListeners();
    try {
      final data = this.rsaRepository.generateKeys(size);
      keys = data;

      state = UpdateState.success;
      notifyListeners();
    } catch (e) {
      print(e);
      state = UpdateState.error;
      notifyListeners();
      throw Exception(e);
    }
  }
}
