import 'package:auto_route/auto_route_annotations.dart';
import 'package:pots_trackr/ui/views/home_view.dart';
import 'package:pots_trackr/ui/views/login_view.dart';
import 'package:pots_trackr/ui/views/signup_view.dart';
import 'package:pots_trackr/ui/views/startup_view.dart';

@MaterialAutoRouter()
class $Router {
  @initial
  StartUpView startupViewRoute;
  LoginView loginViewRoute;
  SignUpView signUpViewRoute;
  HomeView homeViewRoute;
}
