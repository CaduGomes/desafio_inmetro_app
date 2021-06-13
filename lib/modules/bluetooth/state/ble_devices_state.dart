import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../domain/entities/entities.dart';
import '../domain/usecases/usecases.dart';

enum UpdateState { idle, loading, success, error }

class BLEDevicesState with ChangeNotifier {
  BLEDevicesListEntity devices = BLEDevicesListEntity([]);
  DateTime? _updatedAt;

  var state = UpdateState.idle;

  final GetDevices _getDevices;
  final IsAvailable _isAvailable;

  BLEDevicesState(this._getDevices, this._isAvailable);

  Future searchDevices() async {
    state = UpdateState.loading;
    notifyListeners();

    final isAvailable = await this._isAvailable();

    isAvailable.fold((err) {
      state = UpdateState.error;
      notifyListeners();
      throw err.message;
    }, (val) async {
      final data = await this._getDevices();

      data.fold((err) {
        print(err.message);
        state = UpdateState.error;
        notifyListeners();
        throw err.message;
      }, (data) {
        state = UpdateState.success;
        devices = data;
        _updatedAt = DateTime.now();
        notifyListeners();
      });
    });
  }

  String getUpdatedAt() {
    if (_updatedAt == null) {
      return "Nunca atualizado";
    } else {
      return DateFormat('dd-MM-yyyy – kk:mm').format(_updatedAt!);
    }
  }

  String getDevicesIds() {
    if (this.devices.devices.isEmpty) {
      return "";
    }

    var finalString = "";

    this.devices.devices.forEach((device) {
      finalString += device.id + "|";
    });

    return finalString;
  }
}
