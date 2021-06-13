import 'package:app/modules/rsa_keys/domain/errors/erros.dart';
import 'package:app/shared/usecases/usecases.dart';
import 'package:dartz/dartz.dart';

import '../entities/entities.dart';
import '../repositories/rsa_key.dart';

class GenerateKeysParams {
  final int size;

  GenerateKeysParams(this.size);
}

class GenerateKeys
    extends UseCase<Either<RSAKeysError, RSAKeysEntity>, GenerateKeysParams> {
  final RSARepository repository;

  GenerateKeys(this.repository);

  @override
  Future<Either<RSAKeysError, RSAKeysEntity>> call(
      GenerateKeysParams params) async {
    return repository.generateKeys(params.size);
  }
}
