import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../state/signature_state.dart';

class SignatureView extends StatelessWidget {
  SignatureView({Key? key}) : super(key: key);
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<SignatureState>();
    return Center(
      child: Column(children: [
        Text(
          "Assinatura:",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Container(
          padding: EdgeInsets.only(top: 10),
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.18,
          child: Scrollbar(
              controller: _scrollController,
              isAlwaysShown: true,
              child: SingleChildScrollView(
                controller: _scrollController,
                scrollDirection: Axis.vertical,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: controller.signature.signatureInbase64 == null
                      ? const Text(
                          "Nenhuma assinatura gerada",
                          textAlign: TextAlign.center,
                        )
                      : Text(
                          controller.signature.signatureInbase64!,
                          textAlign: TextAlign.center,
                        ),
                ),
              )),
        )
      ]),
    );
  }
}
