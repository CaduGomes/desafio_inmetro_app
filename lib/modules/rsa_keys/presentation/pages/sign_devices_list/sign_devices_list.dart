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
        title: const Text("Assinar lista de dispositivos"),
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
                controller.signData().then((value) => null).catchError((err) {
                  showWarningDialog(
                      context, "Não foi possivel assinar", err, "Ok");
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
