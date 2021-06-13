import 'package:app/modules/bluetooth/domain/errors/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_blue/flutter_blue.dart';

import '../../domain/entities/entities.dart';
import '../../domain/repositories/ble_repository.dart';

class BLERepositoryImpl implements BLERepository {
  static final FlutterBlue flutterBlue = FlutterBlue.instance;

  @override
  Future<Either<BLESearchError, BLEDevicesListEntity>> search() async {
    try {
      final List<ScanResult> data =
          await flutterBlue.startScan(timeout: Duration(seconds: 5));

      BLEDevicesListEntity devices = BLEDevicesListEntity([]);

      data.forEach((e) {
        devices.devices
            .add(BLEDeviceEntity(e.device.name, e.device.id.toString()));
      });

      return Right(devices);
    } catch (e) {
      return Left(BLESearchError("Não foi possivel buscar dispositivos"));
    }
  }

  @override
  Future<Either<BLEDisableError, bool>> isAvailable() async {
    bool isOn = await flutterBlue.isOn;

    if (isOn) {
      return Right(isOn);
    }

    return Left(BLEDisableError("Bluetooth desativado"));
  }
}
