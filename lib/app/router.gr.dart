// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../ui/views/create_journal_entry_view.dart';
import '../ui/views/home_view.dart';
import '../ui/views/login_view.dart';
import '../ui/views/signup_view.dart';
import '../ui/views/startup_view.dart';

class Routes {
  static const String startUpView = '/';
  static const String loginView = '/login-view';
  static const String signUpView = '/sign-up-view';
  static const String homeView = '/home-view';
  static const String createJournalEntryView = '/create-journal-entry-view';
  static const all = <String>{
    startUpView,
    loginView,
    signUpView,
    homeView,
    createJournalEntryView,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startUpView, page: StartUpView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.signUpView, page: SignUpView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.createJournalEntryView, page: CreateJournalEntryView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    StartUpView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => StartUpView(),
        settings: data,
      );
    },
    LoginView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginView(),
        settings: data,
      );
    },
    SignUpView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignUpView(),
        settings: data,
      );
    },
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const HomeView(),
        settings: data,
      );
    },
    CreateJournalEntryView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => CreateJournalEntryView(),
        settings: data,
      );
    },
  };
}
