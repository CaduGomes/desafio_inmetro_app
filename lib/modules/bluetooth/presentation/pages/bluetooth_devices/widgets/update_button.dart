import 'package:app/shared/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:app/modules/bluetooth/state/ble_devices_state.dart';

class UpdateButton extends StatelessWidget {
  const UpdateButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<BLEDevicesState>();
    return Column(children: [
      Text("Última Atualização: " + controller.getUpdatedAt()),
      controller.state == UpdateState.loading
          ? Container(
              margin: EdgeInsets.all(15),
              child: CircularProgressIndicator(color: Colors.blue))
          : CustomButton(
              text: "Atualizar Lista",
              onPressed: controller.searchDevices,
            )
    ]);
  }
}