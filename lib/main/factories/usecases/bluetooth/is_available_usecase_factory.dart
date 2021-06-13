import 'package:app/modules/bluetooth/data/repositories/ble_repository_impl.dart';
import 'package:app/modules/bluetooth/domain/usecases/usecases.dart';

IsAvailable makeIsAvailable() => IsAvailable(BLERepositoryImpl());
