import 'package:app/modules/rsa_keys/state/rsa_keys_state.dart';
import 'package:app/shared/widgets/custom_button.dart';
import 'package:app/shared/widgets/warning_alert.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GenerateButton extends StatelessWidget {
  GenerateButton({Key? key, required this.text}) : super(key: key);
  final String text;
  generateKeysHandler(RSAKeysState controller, BuildContext context) async {
    if (text.isEmpty) {
      showWarningDialog(context, "Entrada inválida",
          "O valor do tamanho não pode ser vazio", "Ok");
      return;
    }

    await controller.generateKeys(int.parse(text)).then((value) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Chave gerada com sucesso!')));
    }).catchError((err) {
      showWarningDialog(context, "Ocorre um erro", err, "Ok");
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<RSAKeysState>();
    return controller.state == UpdateState.loading
        ? Container(
            margin: EdgeInsets.all(15),
            child: CircularProgressIndicator(color: Colors.blue))
        : CustomButton(
            text: "Gerar chave",
            onPressed: () => generateKeysHandler(controller, context),
          );
  }
}
