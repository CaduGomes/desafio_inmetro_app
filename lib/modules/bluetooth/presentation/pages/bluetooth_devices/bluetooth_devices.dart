import 'package:app/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'widgets/widgets.dart';

class BluetoothDevicesPage extends StatefulWidget {
  const BluetoothDevicesPage({Key? key}) : super(key: key);

  @override
  _BluetoothDevicesPageState createState() => _BluetoothDevicesPageState();
}

class _BluetoothDevicesPageState extends State<BluetoothDevicesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dispositivos BLE"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              AppLogo(),
              DevicesList(),
              Column(
                children: [
                  UpdateButton(),
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
    );
  }
}
