import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/util/keyboard_util.dart';

class BaseView extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget? bottomNavigationBar;
  final List<Widget>? actions;

  const BaseView({
    super.key,
    required this.title,
    required this.body,
    this.actions,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => hideKeyboard(),
      child: Scaffold(
        backgroundColor: const Color(0XFFeddcd9),
        bottomNavigationBar: bottomNavigationBar,
        appBar: AppBar(
          title: Text(title),
          centerTitle: false,
          actions: actions,
        ),
        body: body,
      ),
    );
  }
}
