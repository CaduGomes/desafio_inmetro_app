import 'package:app/modules/bluetooth/domain/errors/errors.dart';
import 'package:app/shared/usecases/usecases.dart';
import 'package:dartz/dartz.dart';

import '../entities/entities.dart';
import '../repositories/ble_repository.dart';

class GetDevices
    extends NoParamsUseCase<Either<BLESearchError, BLEDevicesListEntity>> {
  final BLERepository repository;

  GetDevices(this.repository);

  @override
  Future<Either<BLESearchError, BLEDevicesListEntity>> call() async {
    final data = await repository.search();
    return data;
  }
}
