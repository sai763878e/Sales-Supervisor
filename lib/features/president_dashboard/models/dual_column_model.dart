import 'package:flutter/material.dart';

class DualColumnModel {
  DualColumnModel(this.barLabel, this.barOneValue, this.barTwoValue,
      this.barOneTitle, this.barTwoTitle,
      {this.barOneColor, this.barTwoColor, this.growth});

  final String barLabel;
  final dynamic barOneValue;
  final dynamic barTwoValue;
  String barOneTitle = "";
  String barTwoTitle = "";
  final dynamic growth;
  final Color? barOneColor;
  final Color? barTwoColor;
}
