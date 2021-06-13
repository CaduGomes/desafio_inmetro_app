import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../domain/entities/ble_devices_list_entity.dart';
import '../domain/repositories/ble_repository.dart';

enum UpdateState { idle, loading, success, error }

class BLEDevicesState with ChangeNotifier {
  BLEDevicesListEntity devices = BLEDevicesListEntity([]);
  DateTime? _updatedAt;

  var state = UpdateState.idle;

  final BLERepository _bleRepository;

  BLEDevicesState(this._bleRepository);

  void searchDevices() async {
    state = UpdateState.loading;
    notifyListeners();

    try {
      bool isOn = await this._bleRepository.isOn();

      if (!isOn) {
        state = UpdateState.error;
        notifyListeners();
        throw Exception("Bluetooth desativado!");
      }

      final data = await this._bleRepository.search();
      state = UpdateState.success;
      devices = data;
      _updatedAt = DateTime.now();

      notifyListeners();
    } catch (e) {
      print(e);
      state = UpdateState.error;
      notifyListeners();
    }
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
