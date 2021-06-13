import 'package:app/modules/bluetooth/data/repositories/ble_repository_impl.dart';
import 'package:app/modules/bluetooth/state/ble_devices_state.dart';

BLEDevicesState makeBLEDevicesState() => BLEDevicesState(BLERepositoryImpl());
