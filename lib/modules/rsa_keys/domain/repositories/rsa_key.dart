import '../entities/entities.dart';

abstract class RSARepository {
  RSAKeysEntity generateKeys(int size);
  SignatureEntity signData(PrivateKeyEntity privatekey, String data);
  VerifySignatureEntity verifySignature(
    PublicKeyEntity publickey,
    String data,
    SignatureEntity signature,
  );
}
