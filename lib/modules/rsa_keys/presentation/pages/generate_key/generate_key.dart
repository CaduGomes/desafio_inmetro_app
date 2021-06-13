import 'package:app/modules/rsa_keys/state/rsa_keys_state.dart';
import 'package:app/shared/widgets/custom_button.dart';
import 'package:app/shared/widgets/warning_alert.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GenerateKeyPage extends StatefulWidget {
  const GenerateKeyPage({Key? key}) : super(key: key);

  @override
  _GenerateKeyPageState createState() => _GenerateKeyPageState();
}

class _GenerateKeyPageState extends State<GenerateKeyPage> {
  generateKeysHandler() async {
    if (text.isEmpty) {
      showWarningDialog(context, "Entrada inválida",
          "O valor do tamanho não pode ser vazio", "Ok");
      return;
    }

    await Provider.of<RSAKeysState>(context, listen: false)
        .generateKeys(int.parse(text))
        .then((value) {
      print("ok");
    }).catchError((err) {
      print("Teste");
      showWarningDialog(context, "Ocorre um erro", err, "Ok");
    });
  }

  String text = "";

  @override
  // void initState() {
  //   super.initState();
  //   _controller = TextEditingController();
  // }

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

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
                    onChanged: (val) {
                      text = val;
                    },
                  ),
                ),
              ],
            ),
            CustomButton(
              text: "Gerar chave",
              onPressed: generateKeysHandler,
            )
          ],
        ),
      ),
    );
  }
}
