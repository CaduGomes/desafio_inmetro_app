import 'package:app/shared/usecases/usecases.dart';

import '../entities/entities.dart';
import '../repositories/rsa_key.dart';

class SignDataParams {
  final PrivateKeyEntity privatekey;
  final String data;

  SignDataParams(this.privatekey, this.data);
}

class SignData extends UseCase<SignatureEntity, SignDataParams> {
  final RSARepository repository;

  SignData(this.repository);

  @override
  Future<SignatureEntity> call(SignDataParams params) async {
    return repository.signData(params.privatekey, params.data);
  }
}
