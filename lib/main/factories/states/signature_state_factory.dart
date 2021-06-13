import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../usecases/rsa_keys/rsa_keys.dart';

import 'package:app/modules/rsa_keys/state/signature_state.dart';

SignatureState makeSignatureState(BuildContext context) => SignatureState(
    context.read(), context.read(), makeSignData(), makeVerifySignature());
