import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DouBanAppBar {
  final String title;
  final bool canBack;

  DouBanAppBar(this.title, this.canBack);

  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(title),
      automaticallyImplyLeading: canBack,
    );
  }
}
