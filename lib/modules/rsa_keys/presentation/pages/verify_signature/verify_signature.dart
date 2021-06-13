import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app/shared/widgets/widgets.dart';

import '../../../state/signature_state.dart';

class VerifySignaturePage extends StatelessWidget {
  VerifySignaturePage({Key? key}) : super(key: key);

  verifySignatureHandler(SignatureState controller, BuildContext context) {
    controller.verifySignature().then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Assinatura verificada com sucesso!')));
    }).catchError((err) {
      showWarningDialog(context, "Ocorreu um problema", err, "Ok");
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<SignatureState>();
    print(controller.isValid);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Verificar assinatura"),
        ),
        body: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.7,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AppLogo(),
                  Column(
                    children: [
                      const Text(
                        "Assinatura:",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Container(
                          child: controller.isValid
                              ? const Text("Válida")
                              : const Text("Inválida")),
                    ],
                  ),
                  Column(
                    children: [
                      CustomButton(
                        text: "Verificar Novamente",
                        onPressed: () =>
                            verifySignatureHandler(controller, context),
                      ),
                      CustomButton(
                          text: "Voltar",
                          onPressed: () => Navigator.pop(context)),
                    ],
                  )
                ],
              ),
            )));
  }
}
