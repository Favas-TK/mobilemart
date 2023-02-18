

import 'package:flutter/material.dart';

extension ExtMediaQuery on BuildContext {
  Size getSize() => MediaQuery.of(this).size;
}
