import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:pots_trackr/core/viewmodels/views/login_view_model.dart';
import 'package:pots_trackr/ui/shared/app_colors.dart';
import 'package:pots_trackr/ui/shared/shared_styles.dart';
import 'package:pots_trackr/ui/shared/ui_helpers.dart';
import 'package:pots_trackr/ui/widgets/password_input_field.dart';
import 'package:pots_trackr/ui/widgets/text_link.dart';
import 'package:stacked/stacked.dart';

class LoginCard extends ViewModelWidget<LoginViewModel> {
  final GlobalKey<FormBuilderState> formBuilderStateKey;

  LoginCard({Key key, this.formBuilderStateKey})
      : super(key: key, reactive: true);

  @override
  Widget build(BuildContext context, LoginViewModel model) => SizedBox(
        height: screenHeightFraction(context, dividedBy: 2) - 20,
        width: screenWidth(context) * 0.85,
        child: new Card(
          color: Colors.white,
          elevation: 2.0,
          child: FormBuilder(
            key: formBuilderStateKey,
            autovalidate: true,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: SingleChildScrollView(
                child: new Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text('Login'),
                    FormBuilderTextField(
                      attribute: 'email',
                      decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(color: darkText),
                          icon: Icon(Icons.person_outline, color: darkText)),
                      validators: [
                        FormBuilderValidators.email(
                            errorText: 'A valid email address is required!')
                      ],
                      keyboardType: TextInputType.emailAddress,
                    ),
                    PasswordInputField(),
                    verticalSpaceMedium,
                    FlatButton(
                      child: Text('Login', style: buttonTitleTextStyle),
                      onPressed: () {
                        if (formBuilderStateKey.currentState.saveAndValidate())
                          model.login(
                              email: formBuilderStateKey
                                  .currentState.value['email'],
                              password: formBuilderStateKey
                                  .currentState.value['password']);
                      },
                      color: Color(0xFF4aa0d5),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    ),
                    verticalSpaceMedium,
                    TextLink(
                      'Create an Account if you\'re new.',
                      onPressed: () {
                        model.navigateToSignUp();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
