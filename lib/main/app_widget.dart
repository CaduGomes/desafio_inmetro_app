import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app/main/factories/states/states.dart';

import 'package:app/modules/home/presentation/pages/pages.dart';
import 'package:app/modules/bluetooth/presentation/pages/pages.dart';
import 'package:app/modules/rsa_keys/presentation/pages/pages.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => makeRSAKeyState()),
        ChangeNotifierProvider(create: (_) => makeBLEDevicesState()),
        ChangeNotifierProvider(
          create: (context) => makeSignatureState(context),
        ),
      ],
      child: MaterialApp(
        title: 'Desafio INMETRO',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          "/": (_) => HomePage(),
          "/bluetooth-devices": (_) => BluetoothDevicesPage(),
          "/show-key": (_) => ShowKeyPage(),
          "/generate-key": (_) => GenerateKeyPage(),
          "/sign-devices-list": (_) => SignDevicesListPage(),
          "/verify-signature": (_) => VerifySignaturePage(),
        },
        // generateKey: ,
        // showKey: ,
        // signDevicesList: ,
        // verifySignature: ,
      ),
    );
  }
}
