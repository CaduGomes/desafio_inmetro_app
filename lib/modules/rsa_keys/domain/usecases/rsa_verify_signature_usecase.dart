import 'package:app/modules/rsa_keys/domain/errors/erros.dart';
import 'package:app/shared/usecases/usecases.dart';
import 'package:dartz/dartz.dart';

import '../entities/entities.dart';
import '../repositories/rsa_key.dart';

class VerifySignatureParams {
  final PublicKeyEntity publickey;
  final String data;
  final SignatureEntity signature;

  VerifySignatureParams(this.publickey, this.data, this.signature);
}

class VerifySignature extends UseCase<
    Either<RSAKeysError, VerifySignatureEntity>, VerifySignatureParams> {
  final RSARepository repository;

  VerifySignature(this.repository);

  @override
  Future<Either<RSAKeysError, VerifySignatureEntity>> call(
      VerifySignatureParams params) async {
    return repository.verifySignature(
        params.publickey, params.data, params.signature);
  }
}
