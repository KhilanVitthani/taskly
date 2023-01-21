import 'package:flutter/material.dart';

extension SpaceWidget on double {
  addHSpace() {
    return SizedBox(
      height: this,
    );
  }

  addWSpace() {
    return SizedBox(
      width: this,
    );
  }

  addDivider() {
    return Divider(
      height: this,
      thickness: 2,
    );
  }
}