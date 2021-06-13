import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app/shared/widgets/widgets.dart';

import '../../../state/signature_state.dart';

class VerifySignaturePage extends StatelessWidget {
  const VerifySignaturePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<SignatureState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verificar assinatura"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
                child: controller.isValid
                    ? Text("Assinatura: Válida")
                    : Text("Assinatura: Inválida")),
            CustomButton(
              text: "Verificar Novamente",
              onPressed: () {
                controller
                    .verifySignature()
                    .then((value) => null)
                    .catchError((err) {
                  showWarningDialog(
                      context, "Ocorreu um problema", err.toString(), "Ok");
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
