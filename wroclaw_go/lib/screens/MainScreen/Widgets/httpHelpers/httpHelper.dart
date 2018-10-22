import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Post {

  int index;
  String startDate;
  String shortTitle;
  String Adress;

  Post({this.index, this.startDate, this.shortTitle, this.Adress});

  factory Post.fromJson(int index ,Map<String, dynamic> json) {
    return Post(
      index: index - 1,
      startDate: json['items'][index]['startDate'],
      shortTitle: json['items'][index]['offer']['shortTitle'],
      Adress: "This is not working as of now"
    );
  }
}

class httpHelper {

  Future<Post> fetchEvent(int index) async {
    final response =
    await http.get("http://go.wroclaw.pl/api/v1.0/events/?page=1"
        "&key=462560023139240280374120334056608985352");

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON
      return Post.fromJson(index, json.decode(response.body));
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }
}