import 'dart:core';

import 'package:flutter/material.dart';

class Nutrients {
  double potassium;
  double nitrogen;
  double phosphorus;
  double oc;

  Nutrients(
      {required this.phosphorus,
      required this.potassium,
      required this.oc,
      required this.nitrogen});

  factory Nutrients.fromJSON(Map<String, dynamic> json){
    return Nutrients(
        phosphorus: json["P"],
        potassium: json["K"],
        oc: json["OC"],
        nitrogen: json["N"]);
  }

}
