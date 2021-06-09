import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: [
          ElevatedButton(child: Text("Dispositivos LBE"), onPressed: () {}),
          ElevatedButton(child: Text("Gerar chave RSA"), onPressed: () {}),
          ElevatedButton(child: Text("Assinar lista"), onPressed: () {}),
          ElevatedButton(child: Text("Verificar assinatura"), onPressed: () {}),
        ],
      ),
    );
  }
}
