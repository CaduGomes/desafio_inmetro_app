import '../entities/entities.dart';

class RSAKeysEntity {
  final PrivateKeyEntity? private;
  final PublicKeyEntity? public;

  RSAKeysEntity(this.private, this.public);
}
