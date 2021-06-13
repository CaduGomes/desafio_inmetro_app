import 'package:app/shared/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:app/modules/bluetooth/state/ble_devices_state.dart';

class UpdateButton extends StatelessWidget {
  const UpdateButton({Key? key}) : super(key: key);

  searchDevicesHandler(BLEDevicesState controller, BuildContext context) async {
    await controller.searchDevices().then((val) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Dispositivos atualizados com sucesso!')));
    }).catchError((e) {
      showWarningDialog(context, "Ocorreu um erro", e.toString(), "Ok");
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<BLEDevicesState>();
    return Container(
      height: 90,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text("Última Atualização: " + controller.getUpdatedAt()),
        controller.state == UpdateState.loading
            ? Container(
                margin: EdgeInsets.all(15),
                child: CircularProgressIndicator(color: Colors.blue))
            : CustomButton(
                text: "Atualizar Lista",
                onPressed: () => searchDevicesHandler(controller, context),
              )
      ]),
    );
  }
}
