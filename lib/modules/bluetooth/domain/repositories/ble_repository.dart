import '../entities/entities.dart';

abstract class BLERepository {
  Future<BLEDevicesListEntity> search();
  Future<bool> isOn();
}
