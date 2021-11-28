library data_access;

import 'dart:convert';
import 'dart:io';

import 'package:bumper_demo/core/app_exception.dart';
import 'package:bumper_demo/model/models.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data_access.g.dart';
part 'repositories/abstract_repository.dart';
part 'repositories/concrete_repository.dart';
part 'repositories/mock_repository.dart';
part 'miscs/request_worker.dart';
part 'miscs/interceptor.dart';
part 'miscs/session_data.dart';
part 'miscs/session.dart';
