import 'package:app/shared/usecases/usecases.dart';

import '../entities/entities.dart';
import '../repositories/ble_repository.dart';

class GetDevices extends NoParamsUseCase<BLEDevicesListEntity> {
  final BLERepository repository;

  GetDevices(this.repository);

  @override
  Future<BLEDevicesListEntity> call() async {
    return await repository.search();
  }
}
