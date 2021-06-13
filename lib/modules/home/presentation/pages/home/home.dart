import 'package:flutter/material.dart';

import 'package:app/shared/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Desafio APP"),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppLogo(),
              Padding(
                padding: EdgeInsets.only(top: 60),
                child: Column(
                  children: [
                    CustomButton(
                        text: "Dispositivos BLE",
                        onPressed: () {
                          Navigator.pushNamed(context, '/bluetooth-devices');
                        }),
                    CustomButton(
                        text: "Gerar chave RSA",
                        onPressed: () {
                          Navigator.pushNamed(context, '/show-key');
                        }),
                    CustomButton(
                        text: "Assinar lista",
                        onPressed: () {
                          Navigator.pushNamed(context, '/sign-devices-list');
                        }),
                    CustomButton(
                        text: "Verificar assinatura",
                        onPressed: () {
                          Navigator.pushNamed(context, '/verify-signature');
                        }),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
