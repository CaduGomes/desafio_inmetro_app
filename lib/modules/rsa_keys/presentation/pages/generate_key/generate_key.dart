import 'package:flutter/material.dart';
import 'package:app/shared/widgets/widgets.dart';

import 'widgets/widgets.dart';

class GenerateKeyPage extends StatefulWidget {
  const GenerateKeyPage({Key? key}) : super(key: key);

  @override
  _GenerateKeyPageState createState() => _GenerateKeyPageState();
}

class _GenerateKeyPageState extends State<GenerateKeyPage> {
  String text = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gerar nova chave"),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.7,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppLogo(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Tamanho da chave: "),
                  SizedBox(
                    width: 100,
                    height: 40,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Tamanho',
                      ),
                      onChanged: (val) {
                        setState(() {
                          text = val;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  GenerateButton(
                    text: text,
                  ),
                  CustomButton(
                    text: "Voltar",
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
