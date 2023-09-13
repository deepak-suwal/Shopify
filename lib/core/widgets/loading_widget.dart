import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:styled_widget/styled_widget.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'assets/searching_animation.json',
    ).center();
  }
}
