import 'package:flutter/material.dart';
import 'package:app/shared/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  final String logoURI = 'lib/presentation/assets/images/labsec-logo.png';

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
              SizedBox(width: 200, height: 200, child: Image.asset(logoURI)),
              Padding(
                padding: EdgeInsets.only(top: 60),
                child: Column(
                  children: [
                    CustomButton(
                        text: "Dispositivos LBE",
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
