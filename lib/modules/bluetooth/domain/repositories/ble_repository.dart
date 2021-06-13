import 'package:dartz/dartz.dart';

import '../entities/entities.dart';
import '../errors/errors.dart';

abstract class BLERepository {
  Future<Either<BLESearchError, BLEDevicesListEntity>> search();
  Future<Either<BLEDisableError, bool>> isAvailable();
}
