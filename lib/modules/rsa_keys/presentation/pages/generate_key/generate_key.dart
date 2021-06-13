import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app/shared/widgets/widgets.dart';

import '../../../state/rsa_keys_state.dart';

class GenerateKeyPage extends StatefulWidget {
  const GenerateKeyPage({Key? key}) : super(key: key);

  @override
  _GenerateKeyPageState createState() => _GenerateKeyPageState();
}

class _GenerateKeyPageState extends State<GenerateKeyPage> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gerar nova chave"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
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
                    controller: _controller,
                  ),
                ),
              ],
            ),
            Consumer<RSAKeysState>(
              builder: (context, instance, child) {
                return instance.state == UpdateState.loading
                    ? CircularProgressIndicator(
                        color: Colors.blue,
                      )
                    : CustomButton(
                        text: "Gerar",
                        onPressed: () {
                          if (_controller.text.isNotEmpty &&
                              (int.parse(_controller.text) is int)) {
                            try {
                              instance
                                  .generateKeys(int.parse(_controller.text));
                            } catch (e) {
                              showWarningDialog(context, "Valor inválido",
                                  e.toString(), "Ok");
                            }
                          } else {
                            showWarningDialog(context, "Valor inválido",
                                "O valor não pode ser vazio", "Ok");
                          }
                        },
                      );
              },
            )
          ],
        ),
      ),
    );
  }
}
