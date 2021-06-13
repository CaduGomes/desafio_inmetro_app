import 'package:app/modules/rsa_keys/data/repositories/fast_rsa_repository_impl.dart';
import 'package:app/modules/rsa_keys/domain/usecases/usecases.dart';

VerifySignature makeVerifySignature() =>
    VerifySignature(FastRSARepositoryImpl());
