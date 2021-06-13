import 'package:flutter/material.dart';

import '../domain/usecases/usecases.dart';
import '../domain/entities/entities.dart';

enum UpdateState { idle, loading, error, success }

class RSAKeysState with ChangeNotifier {
  RSAKeysEntity keys = RSAKeysEntity(null, null);

  var state = UpdateState.idle;

  final GenerateKeys _generateKeys;

  RSAKeysState(this._generateKeys);

  Future generateKeys(int size) async {
    print("Gerando chaves");
    state = UpdateState.loading;
    notifyListeners();
    final result = await this._generateKeys(GenerateKeysParams(size));

    result.fold((err) {
      state = UpdateState.error;
      notifyListeners();
      throw err.message;
    }, (data) {
      keys = data;
      state = UpdateState.success;
      notifyListeners();
    });
  }
}
