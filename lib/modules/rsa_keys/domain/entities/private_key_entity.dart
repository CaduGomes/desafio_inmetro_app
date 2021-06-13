class PrivateKeyEntity {
  final BigInt p;
  final BigInt d; // private exponent
  final BigInt q;
  final BigInt modulus;
  final String base64;

  PrivateKeyEntity(this.p, this.d, this.q, this.base64, this.modulus);
}
