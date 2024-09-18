import 'package:flutter/material.dart';

AppBar appBar({bool leading = true, String title = '', List<Widget>? actions}){
  return AppBar(
    leading: leading ? const Icon(Icons.catching_pokemon) : null,
    foregroundColor: Colors.white,
    backgroundColor: Colors.blue,
    title: Text(title),
    actions: actions,
  );
}