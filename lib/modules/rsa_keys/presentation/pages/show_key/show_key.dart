import 'package:app/modules/rsa_keys/presentation/pages/show_key/widgets/widgets.dart';
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
      body: Column(
        children: [
          const AppLogo(),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20.0),
            padding:
                const EdgeInsets.only(left: 5, bottom: 20, right: 20, top: 20),
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PrivateKeyView(),
                PublicKeyView(),
              ],
            ),
          ),
          Column(
            children: [
              CustomButton(
                  text: "Gerar nova chave",
                  onPressed: () =>
                      Navigator.pushNamed(context, "/generate-key")),
              CustomButton(
                text: "Voltar",
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
