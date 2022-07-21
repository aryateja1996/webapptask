import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../model.dart';
part 'user_names_event.dart';
part 'user_names_state.dart';

class UserNamesBloc extends Bloc<UserNamesEvent, UserNamesState> {
  UserNamesBloc() : super(UserNamesInitial());
  @override
  Stream<UserNamesState> mapEventToState(UserNamesEvent event) async* {
    if (event is Get) {
      yield Loading();
      try {
        var responce =
            await http.get(Uri.parse("https://gorest.co.in/public/v2/users"));
        var responceJson = jsonDecode(responce.body);
        var users = userFromJson(responce.body.toString());
        print(users);
        yield Loaded(user: users);
      } catch (e) {
        print("Error is $e");
        yield Error(error: e.toString());
      }
    } else {
      debugPrint("No event called");
    }
  }
}
