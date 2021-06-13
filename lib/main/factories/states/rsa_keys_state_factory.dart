import 'package:app/modules/rsa_keys/data/repositories/rsa_keys_repository_impl.dart';
import 'package:app/modules/rsa_keys/state/rsa_keys_state.dart';

RSAKeysState makeRSAKeyState() => RSAKeysState(RSAKeysRepositoryImpl());
