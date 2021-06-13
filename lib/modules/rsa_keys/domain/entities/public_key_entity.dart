import 'dart:typed_data';

class PublicKeyEntity {
  final BigInt? n;
  final BigInt? e; // públic exponent
  final BigInt? modulus;
  final String? base64;
  final Uint8List? codeUnits;
  final String? publicKey;

  PublicKeyEntity(this.n, this.e, this.base64, this.modulus, this.codeUnits,
      this.publicKey);
}
