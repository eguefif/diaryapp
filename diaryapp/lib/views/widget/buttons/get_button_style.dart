import 'package:flutter/material.dart';

ButtonStyle getButtonStyle() {
    return IconButton.styleFrom(
      elevation: 10,
      backgroundColor: const Color.fromARGB(255, 13, 178, 18),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
        side: const BorderSide(
          color: Color.fromARGB(255, 25, 43, 26),
          width: 4,
        ),
      ),
    );
  }