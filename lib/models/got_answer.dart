import 'dart:convert';
import 'package:gotbet/resources.dart';
import 'package:json_annotation/json_annotation.dart';

//import 'package:siberian_wellness/utils/resources.dart';
//import 'package:http/http.dart' as http;

part 'got_answer.g.dart';

@JsonSerializable()
class GOTAnswer {
  GOTAnswer();

  int id;
  String title;
  String description;
  String question;
  String img;

  @JsonKey(name: 'is_correct')
  bool isCorrect;

  factory GOTAnswer.fromJson(Map<String, dynamic> json) => _$GOTAnswerFromJson(json);

  Map<String, dynamic> toJson() => _$GOTAnswerToJson(this);
}