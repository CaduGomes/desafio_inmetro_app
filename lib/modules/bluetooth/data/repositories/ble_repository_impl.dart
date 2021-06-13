import 'package:flutter_blue/flutter_blue.dart';

import '../../domain/entities/entities.dart';
import '../../domain/repositories/ble_repository.dart';

class BLERepositoryImpl implements BLERepository {
  static final FlutterBlue flutterBlue = FlutterBlue.instance;

  @override
  Future<bool> isOn() async {
    bool isOn = await flutterBlue.isOn;

    return isOn;
  }

  @override
  Future<BLEDevicesListEntity> search() async {
    try {
      final List<ScanResult> data =
          await flutterBlue.startScan(timeout: Duration(seconds: 5));

      BLEDevicesListEntity devices = BLEDevicesListEntity([]);

      data.forEach((e) {
        devices.devices
            .add(BLEDeviceEntity(e.device.name, e.device.id.toString()));
      });

      return devices;
    } catch (err) {
      print(err);
      throw Exception(err);
    }
  }
}
