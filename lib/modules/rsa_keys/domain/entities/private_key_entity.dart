import 'dart:typed_data';

class PrivateKeyEntity {
  final BigInt? p;
  final BigInt? d; // private exponent
  final BigInt? q;
  final BigInt? modulus;
  final String? base64;
  final Uint8List? codeUnits;
  final String? privateKey;

  PrivateKeyEntity(this.p, this.d, this.q, this.base64, this.modulus,
      this.codeUnits, this.privateKey);
}
