import 'package:app/shared/usecases/usecases.dart';

import '../entities/entities.dart';
import '../repositories/rsa_key.dart';

class GenerateKeysParams {
  final int size;

  GenerateKeysParams(this.size);
}

class GenerateKeys extends UseCase<RSAKeysEntity, GenerateKeysParams> {
  final RSARepository repository;

  GenerateKeys(this.repository);

  @override
  Future<RSAKeysEntity> call(GenerateKeysParams params) async {
    return repository.generateKeys(params.size);
  }
}
