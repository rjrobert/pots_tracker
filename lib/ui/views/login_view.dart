import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'package:pots_trackr/core/viewmodels/views/login_view_model.dart';
import 'package:pots_trackr/ui/views/base_widget.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) => BaseWidget<LoginViewModel>(
        model: LoginViewModel(authenticationService: Provider.of(context)),
        child: Text('TODO'),
        builder: (context, model, child) => Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                child,
                model.busy
                    ? CircularProgressIndicator()
                    : FlatButton(
                        color: Colors.blue,
                        child: Text('Login'),
                        onPressed: () async {
                          var loginSuccess = await model.login();
                        },
                      )
              ],
            )),
      );
}
