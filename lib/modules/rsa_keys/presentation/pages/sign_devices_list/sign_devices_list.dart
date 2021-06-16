import 'package:app/modules/rsa_keys/presentation/pages/sign_devices_list/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/shared/widgets/widgets.dart';

import '../../../state/signature_state.dart';

class SignDevicesListPage extends StatelessWidget {
  const SignDevicesListPage({Key? key}) : super(key: key);

  signDevicesList(SignatureState controller, BuildContext context) {
    controller.signData().then((value) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Lista assinada com sucesso!')));
    }).catchError((err) {
      showWarningDialog(context, "Não foi possivel assinar", err, "Ok");
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<SignatureState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Assinar lista de dispositivos"),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.7,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppLogo(),
                SignatureView(),
                Column(
                  children: [
                    CustomButton(
                      text: "Assinar Novamente",
                      onPressed: () => signDevicesList(controller, context),
                    ),
                    CustomButton(
                      text: "Voltar",
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
