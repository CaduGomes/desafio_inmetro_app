import 'package:app/modules/rsa_keys/state/rsa_keys_state.dart';

import '../usecases/rsa_keys/rsa_keys.dart';

RSAKeysState makeRSAKeyState() => RSAKeysState(makeGenerateKeys());
