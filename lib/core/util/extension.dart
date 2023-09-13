import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension Space on int {
  Widget get verticalSpace => SizedBox(height: toDouble());

  Widget get horizontalSpace => SizedBox(width: toDouble());
}

