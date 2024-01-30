import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class userData{
  final String id;
  final String email;
  final String name;
  final String hobby;
  final int balance;

  userData(
      {required this.id, required this.email, required this.name, required this.hobby, this.balance = 0});

}