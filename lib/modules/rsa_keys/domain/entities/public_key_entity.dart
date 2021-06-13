class PublicKeyEntity {
  final BigInt n;
  final BigInt e; // públic exponent
  final BigInt modulus;
  final String base64;

  PublicKeyEntity(this.n, this.e, this.base64, this.modulus);
}
