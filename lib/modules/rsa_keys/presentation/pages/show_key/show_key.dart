import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/shared/widgets/widgets.dart';

import '../../../state/rsa_keys_state.dart';

class ShowKeyPage extends StatelessWidget {
  const ShowKeyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gerar chave RSA"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20.0),
                padding:
                    EdgeInsets.only(left: 5, bottom: 20, right: 20, top: 20),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: Column(
                  children: [
                    Consumer<RSAKeysState>(
                      builder: (context, instance, child) {
                        if (instance.keys.private == null) {
                          return Text("Nenhuma chave gerada");
                        }

                        return Column(
                          children: [
                            Text(
                                "Chave Pública: ${instance.keys.public!.base64}"),
                            Text(
                                "Chave Privada: ${instance.keys.private!.base64}"),
                          ],
                        );
                      },
                    ),

                    // Text("Chave Privada: " +
                    //     (RSAKeysState.instance.keys.private == null
                    //         ? "Nenhuma chave gerada!"
                    //         : RSAKeysState.instance.keys.private!.base64)),
                    // Text("Chave Pública: " +
                    //     (RSAKeysState.instance.keys.public == null
                    //         ? "Nenhuma chave gerada!"
                    //         : RSAKeysState.instance.keys.public!.base64))
                  ],
                ),
              ),
              CustomButton(
                text: "Gerar nova chave",
                onPressed: () {
                  Navigator.pushNamed(context, "/generate-key");
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
