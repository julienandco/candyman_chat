import 'package:flutter/material.dart';

const kMaxWidth = 800.0;
bool isWidthOverLimit(BuildContext context) =>
    MediaQuery.of(context).size.width > kMaxWidth;
