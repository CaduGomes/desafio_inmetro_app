import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:pointycastle/export.dart';

import '../../domain/entities/entities.dart';
import '../../domain/repositories/rsa_key.dart';
import '../../utils/convert_keys_to_base64.dart';

class RSAKeysRepositoryImpl implements RSARepository {
  @override
  RSAKeysEntity generateKeys(int size) {
    final keyGen = KeyGenerator('RSA');

    // Gerando Secure Random
    final secureRandom = FortunaRandom();
    final seedSource = Random.secure();
    final seeds = <int>[];
    for (int i = 0; i < 32; i++) {
      seeds.add(seedSource.nextInt(255));
    }
    secureRandom.seed(KeyParameter(Uint8List.fromList(seeds)));

    final rsaParams =
        RSAKeyGeneratorParameters(BigInt.parse('65537'), size, 64);
    final paramsWithRnd = ParametersWithRandom(rsaParams, secureRandom);

    keyGen.init(paramsWithRnd);

    final pair = keyGen.generateKeyPair();

    final myPublic = pair.publicKey as RSAPublicKey;
    final myPrivate = pair.privateKey as RSAPrivateKey;

    final private = PrivateKeyEntity(myPrivate.p!, myPrivate.privateExponent!,
        myPrivate.q!, encodePrivateKeyToPem(myPrivate), myPrivate.modulus!);

    final public = PublicKeyEntity(myPublic.n!, myPublic.publicExponent!,
        encodePublicKeyToPem(myPublic), myPublic.modulus!);

    final result = RSAKeysEntity(private, public);

    return result;
  }

  @override
  SignatureEntity signData(PrivateKeyEntity privatekey, String data) {
    final signer = RSASigner(SHA256Digest(), '0609608648016503040201');
    RSAPrivateKey key = RSAPrivateKey(
        privatekey.modulus, privatekey.d, privatekey.p, privatekey.q);

    signer.init(true, PrivateKeyParameter<RSAPrivateKey>(key));

    final sig = signer.generateSignature(Uint8List.fromList(data.codeUnits));

    SignatureEntity response =
        SignatureEntity(sig.bytes, base64Encode(sig.bytes));

    return response;
  }

  @override
  VerifySignatureEntity verifySignature(
      PublicKeyEntity publickey, String data, SignatureEntity signature) {
    final sig = RSASignature(signature.signature!);

    final verifier = RSASigner(SHA256Digest(), '0609608648016503040201');

    RSAPublicKey rsaPublicKey = RSAPublicKey(publickey.modulus, publickey.e);

    verifier.init(false, PublicKeyParameter<RSAPublicKey>(rsaPublicKey));

    final result =
        verifier.verifySignature(Uint8List.fromList(data.codeUnits), sig);

    return VerifySignatureEntity(publickey, signature, data, result);
  }
}
