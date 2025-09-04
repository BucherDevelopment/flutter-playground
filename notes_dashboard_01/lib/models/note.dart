import 'package:flutter/material.dart';

class Note {
  String title;
  String description;
  Offset position;

  Note({
    required this.title,
    required this.description,
    required this.position,
  });
}
