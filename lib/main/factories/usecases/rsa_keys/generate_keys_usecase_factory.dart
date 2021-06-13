import 'package:app/modules/rsa_keys/data/repositories/rsa_keys_repository_impl.dart';
import 'package:app/modules/rsa_keys/domain/usecases/usecases.dart';

GenerateKeys makeGenerateKeys() => GenerateKeys(RSAKeysRepositoryImpl());
