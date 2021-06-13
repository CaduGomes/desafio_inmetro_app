import 'dart:typed_data';

class SignatureEntity {
  final Uint8List? signature;
  final String? signatureInbase64;

  SignatureEntity(this.signature, this.signatureInbase64);
}
