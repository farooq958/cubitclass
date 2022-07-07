// To parse this JSON data, do
//
//     final userClass = userClassFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class UserClass {
    UserClass({
        required this.id,
        required this.token,
    });

    final int id;
    final String token;

    factory UserClass.fromRawJson(String str) => UserClass.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UserClass.fromJson(Map<String, dynamic> json) => UserClass(
        id: json["id"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "token": token,
    };
}
