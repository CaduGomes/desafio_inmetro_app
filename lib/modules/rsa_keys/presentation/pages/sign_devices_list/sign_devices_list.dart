import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/shared/widgets/widgets.dart';
import '../../../state/signature_state.dart';

class SignDevicesListPage extends StatelessWidget {
  const SignDevicesListPage({Key? key}) : super(key: key);

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
              child: controller.signature.signatureInbase64 == null
                  ? const Text("Nenhuma assinatura feita")
                  : Text(
                      "Assinatura: ${controller.signature.signatureInbase64}"),
            ),
            CustomButton(
              text: "Assinar Novamente",
              onPressed: () {
                try {
                  controller.signData();
                } catch (e) {
                  showWarningDialog(
                      context, "Não foi possivel assinar", e.toString(), "Ok");
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
