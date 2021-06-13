import 'package:app/modules/rsa_keys/state/rsa_keys_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PublicKeyView extends StatelessWidget {
  PublicKeyView({Key? key}) : super(key: key);
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<RSAKeysState>();
    return Center(
      child: Column(children: [
        Text(
          "Chave pública:",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Container(
          padding: EdgeInsets.only(top: 10),
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.18,
          child: Scrollbar(
              controller: _scrollController,
              isAlwaysShown: true,
              child: SingleChildScrollView(
                controller: _scrollController,
                scrollDirection: Axis.vertical,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: controller.keys.public == null
                      ? const Text(
                          "Chave não gerada",
                          textAlign: TextAlign.center,
                        )
                      : Text(
                          controller.keys.public!.base64!,
                          textAlign: TextAlign.center,
                        ),
                ),
              )),
        )
      ]),
    );
  }
}
