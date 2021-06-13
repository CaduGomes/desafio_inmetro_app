import 'package:app/modules/bluetooth/state/ble_devices_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DevicesList extends StatelessWidget {
  DevicesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Dispositivos:",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 5.0),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: Container(
                height: 400,
                width: 200,
                padding: const EdgeInsets.only(right: 5),
                margin: const EdgeInsets.only(top: 3, bottom: 3),
                child: const BuildList(),
              )),
        ],
      ),
    );
  }
}

class BuildList extends StatelessWidget {
  const BuildList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<BLEDevicesState>();

    if (controller.devices.devices.isEmpty) {
      return NotFound();
    } else {
      return Scrollbar(
        radius: Radius.circular(2),
        child: ListView.builder(
          itemCount: controller.devices.devices.length,
          itemBuilder: (context, int index) {
            return Container(
              padding: const EdgeInsets.only(bottom: 25, top: 5, left: 10),
              child: Text(
                controller.devices.devices[index].id,
                style: TextStyle(fontSize: 15),
              ),
            );
          },
        ),
      );
    }
  }
}

class NotFound extends StatelessWidget {
  const NotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Text(
        "Nenhum dispositivo encontrado!",
        textAlign: TextAlign.center,
      ),
    );
  }
}
