import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app/shared/widgets/widgets.dart';

import '../../../../state/rsa_keys_state.dart';

class GenerateButton extends StatelessWidget {
  const GenerateButton({Key? key, required this.size}) : super(key: key);

  final String size;
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<RSAKeysState>();
    return Container(
        child: controller.state == UpdateState.loading
            ? CircularProgressIndicator(
                color: Colors.blue,
              )
            : CustomButton(
                text: "Gerar",
                onPressed: () {
                  print(size);
                  controller.generateKeys(int.parse(size));
                },
              ));
  }
}
