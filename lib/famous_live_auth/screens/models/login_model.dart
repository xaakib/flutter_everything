

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    LoginModel({
        this.status,
        this.message,
        this.data,
    });

    String status;
    String message;
    Data data;

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    Data({
        this.token,
        this.statusCode,
    });

    String token;
    int statusCode;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        statusCode: json["status_code"],
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "status_code": statusCode,
    };
}

