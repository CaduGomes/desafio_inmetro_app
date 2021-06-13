import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:fast_rsa/model/bridge.pb.dart';
import 'package:fast_rsa/rsa.dart';

import '../../domain/errors/erros.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repositories/rsa_key.dart';

class FastRSARepositoryImpl implements RSARepository {
  @override
  Future<Either<RSAKeysError, RSAKeysEntity>> generateKeys(int size) async {
    try {
      var result = await RSA.generate(size);

      print(result);
      PrivateKeyEntity privateKey = PrivateKeyEntity(
          null,
          null,
          null,
          result.privateKey,
          null,
          Uint8List.fromList(result.privateKey.codeUnits),
          result.privateKey);
      PublicKeyEntity publicKey = PublicKeyEntity(
          null,
          null,
          result.publicKey,
          null,
          Uint8List.fromList(result.publicKey.codeUnits),
          result.publicKey);

      RSAKeysEntity keys = RSAKeysEntity(privateKey, publicKey);
      return Right(keys);
    } catch (e) {
      print(e);
      return Left(RSAKeysError("Utilize valores maiores que 512"));
    }
  }

  @override
  Future<Either<RSAKeysError, SignatureEntity>> signData(
      PrivateKeyEntity privatekey, String data) async {
    try {
      final result = await RSA.signPKCS1v15(
          data, Hash.HASH_SHA256, privatekey.privateKey!);
      SignatureEntity signature =
          SignatureEntity(Uint8List.fromList(result.codeUnits), result);
      return Right(signature);
    } catch (e) {
      return Left(RSAKeysError(
          "Provavelmente sua chave não é válida, use tamanhos maiores que 512"));
    }
  }

  @override
  Future<Either<RSAKeysError, VerifySignatureEntity>> verifySignature(
      PublicKeyEntity publickey, String data, SignatureEntity signature) async {
    try {
      final result = await RSA.verifyPKCS1v15(signature.signatureInbase64!,
          data, Hash.HASH_SHA256, publickey.publicKey!);
      if (!result) {
        throw Exception("Assinatura inválida");
      }
      VerifySignatureEntity verify =
          VerifySignatureEntity(publickey, signature, data, result);

      return Right(verify);
    } catch (e) {
      return Left(RSAKeysError("Assinatura é inválida"));
    }
  }
}
