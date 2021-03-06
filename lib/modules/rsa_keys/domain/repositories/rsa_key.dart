import 'package:app/modules/rsa_keys/domain/errors/erros.dart';
import 'package:dartz/dartz.dart';

import '../entities/entities.dart';

abstract class RSARepository {
  Future<Either<RSAKeysError, RSAKeysEntity>> generateKeys(int size);
  Future<Either<RSAKeysError, SignatureEntity>> signData(
      PrivateKeyEntity privatekey, String data);
  Future<Either<RSAKeysError, VerifySignatureEntity>> verifySignature(
    PublicKeyEntity publickey,
    String data,
    SignatureEntity signature,
  );
}
