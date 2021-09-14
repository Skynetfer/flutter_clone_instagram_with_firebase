import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Colos that use in app
const kSecondaryColor = Color(0xFFFE6D8E);
const kTextColor = Color(0xFF12153D);
const kTextLightColor = Color(0xFF9A9BB2);
const kFillStarColor = Color(0xFFFCC419);
const primaryColor = Color(0xFF255E6);
const textColor = Color(0xFF35364F);
const kLightColor = Color(0xFFF5F5F5);
const kDarkLightColor = Color(0xFF27272A);
const kDarkColor = Color(0xFF403B58);
const kLightDarkColor = Color(0xFFC084FC);

//Size that use in app
const kHeadline = 50.0;
const kHeadlineHome = 40.0;
const kDefaultPadding = 20.0;
const kDefaultShadow = BoxShadow(
  offset: Offset(0, 4),
  blurRadius: 4,
  color: Colors.black26,
);

final _firestore = FirebaseFirestore.instance;
final usersRef = _firestore.collection("users");
