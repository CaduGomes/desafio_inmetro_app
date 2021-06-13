import 'package:app/modules/bluetooth/domain/errors/errors.dart';
import 'package:app/shared/usecases/usecases.dart';
import 'package:dartz/dartz.dart';

import '../repositories/ble_repository.dart';

class IsAvailable extends NoParamsUseCase<Either<BLEDisableError, bool>> {
  final BLERepository repository;

  IsAvailable(this.repository);

  @override
  Future<Either<BLEDisableError, bool>> call() async {
    return await repository.isAvailable();
  }
}
