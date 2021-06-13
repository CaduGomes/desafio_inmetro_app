import '../entities/entities.dart';

class VerifySignatureEntity {
  final PublicKeyEntity publicKey;
  final SignatureEntity signature;
  final String data;
  final bool isValid;

  VerifySignatureEntity(
      this.publicKey, this.signature, this.data, this.isValid);
}
