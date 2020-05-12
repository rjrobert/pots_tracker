import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:pots_trackr/ui/shared/app_colors.dart';

class PasswordInputField extends StatefulWidget {
  @override
  _PasswordInputFieldState createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool _hidePassword;

  @override
  void initState() {
    super.initState();
    _hidePassword = true;
  }

  @override
  Widget build(BuildContext context) => Row(
        children: <Widget>[
          Expanded(
            child: FormBuilderTextField(
              attribute: 'password',
              decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: darkText),
                  icon: Icon(Icons.lock_open, color: darkText),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _hidePassword = !_hidePassword;
                      });
                    },
                    child: Icon(
                        _hidePassword ? Icons.visibility : Icons.visibility_off,
                        color: darkText),
                  )),
              validators: [FormBuilderValidators.minLength(6)],
              keyboardType: TextInputType.visiblePassword,
              obscureText: _hidePassword,
              maxLines: 1,
            ),
          ),
        ],
      );
}
