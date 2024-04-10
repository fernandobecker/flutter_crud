import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String avatarUrl;

  const User({
    this.id = '',
    required this.name,
    required this.email,
    required this.avatarUrl,
  });
}
