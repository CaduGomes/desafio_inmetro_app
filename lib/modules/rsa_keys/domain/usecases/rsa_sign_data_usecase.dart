import 'package:app/modules/rsa_keys/domain/errors/erros.dart';
import 'package:app/shared/usecases/usecases.dart';
import 'package:dartz/dartz.dart';

import '../entities/entities.dart';
import '../repositories/rsa_key.dart';

class SignDataParams {
  final PrivateKeyEntity privatekey;
  final String data;

  SignDataParams(this.privatekey, this.data);
}

class SignData
    extends UseCase<Either<RSAKeysError, SignatureEntity>, SignDataParams> {
  final RSARepository repository;

  SignData(this.repository);

  @override
  Future<Either<RSAKeysError, SignatureEntity>> call(
      SignDataParams params) async {
    return repository.signData(params.privatekey, params.data);
  }
}
