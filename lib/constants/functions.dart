import 'package:flutter/material.dart';

MaterialStateProperty<T> msp<T>(T value) => MaterialStateProperty.all(value);

String capitalize(String str) => '${str[0].toUpperCase()}${str.substring(1)}';

String capitalizeAllWords(String str) =>
    str.split(' ').map((word) => capitalize(word)).join(' ');
