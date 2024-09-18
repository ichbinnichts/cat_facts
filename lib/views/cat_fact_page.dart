import 'package:cat_facts/components/app_bar_component.dart';
import 'package:cat_facts/components/main_button_component.dart';
import 'package:cat_facts/controllers/cat_fact_controller.dart';
import 'package:flutter/material.dart';

class CatFactPage extends StatefulWidget {
  const CatFactPage({super.key});

  @override
  State<CatFactPage> createState() => _CatFactPageState();
}

class _CatFactPageState extends State<CatFactPage> {
  String _fact = "";

  Future<void> getFact() async {
    String fact = await CatFactController.instance.getFact();
    setState(() {
      if (fact != "") {
        _fact = fact;
      } else {
        _fact = "No fact available";
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFact();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.1),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Test cat fact',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 40,
                ),
                _fact.isNotEmpty
                    ? Text(
                        _fact,
                        textAlign: TextAlign.center, // Center the fact text
                        softWrap: true, // Enable wrapping for long text
                        overflow: TextOverflow.visible, // Handle overflow text
                        style: const TextStyle(fontSize: 16),
                      )
                    : const Text("Carregando..."),
                const SizedBox(
                  height: 40,
                ),
                mainButton(buttonText: 'Outro fato', buttonFunction: getFact)
              ],
            ),
          ),
        ));
  }
}
