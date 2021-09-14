import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String id;
  final String name;
  final String profileImageUrl;
  final String email;
  final String bio;
  User({
    required this.id,
    required this.name,
    required this.profileImageUrl,
    required this.email,
    required this.bio,
  });

  factory User.fromDoc(DocumentSnapshot doc) {
    return User(
      id: doc.id,
      name: doc['name'] ?? '',
      profileImageUrl: doc['profileImageUrl'] ?? '',
      email: doc['email'] ?? '',
      bio: doc['bio'] ?? '',
    );
  }
}
