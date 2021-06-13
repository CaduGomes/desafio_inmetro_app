import 'package:app/modules/bluetooth/state/ble_devices_state.dart';

import '../usecases/bluetooth/bluetooth.dart';

BLEDevicesState makeBLEDevicesState() =>
    BLEDevicesState(makeGetDevices(), makeIsAvailable());
