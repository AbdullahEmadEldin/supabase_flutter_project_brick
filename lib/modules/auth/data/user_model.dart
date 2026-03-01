import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String? id;
  final String? email;
  final String? password;
  final String? name;
  final String? phoneNumber;
  final DateTime? createdAt;

  const UserModel({
    this.id,
    this.email,
    this.password,
    this.name,
    this.phoneNumber,
    this.createdAt,
   });


  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      password: json['password'],
      name: json['full_name'],
      createdAt: DateTime.tryParse(json['created_at']),
      phoneNumber: json['phone_number'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'full_name': name,
      'created_at': createdAt,
      'phone_number': phoneNumber,
    };
  }

  UserModel copyWith({
    String? id,
    String? email,
    String? password,
    String? name,
    DateTime? createdAt,
    String? phoneNumber,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  @override
  String toString() {
    return 'UserModel(id: $id, email: $email, password: $password, name: $name, createdAt: $createdAt, phoneNumber: $phoneNumber)';
  }

  @override
  List<Object?> get props => [
    id,
    email,
    password,
    name,
    createdAt,
    phoneNumber,
  ];
}
