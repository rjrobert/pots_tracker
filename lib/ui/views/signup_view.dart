import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:pots_trackr/core/viewmodels/views/signup_view_model.dart';
import 'package:pots_trackr/ui/shared/ui_helpers.dart';
import 'package:pots_trackr/ui/widgets/busy_button.dart';
import 'package:pots_trackr/ui/widgets/password_input_field.dart';
import 'package:stacked/stacked.dart';

class SignUpView extends StatelessWidget {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) =>
      ViewModelBuilder<SignUpViewModel>.reactive(
          viewModelBuilder: () => SignUpViewModel(),
          builder: (context, model, child) => Scaffold(
                body: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Sign Up', style: TextStyle(fontSize: 38)),
                        verticalSpaceLarge,
                        FormBuilder(
                          key: _fbKey,
                          autovalidate: true,
                          child: Column(
                            children: <Widget>[
                              FormBuilderTextField(
                                attribute: 'fullName',
                                decoration: InputDecoration(
                                    labelText: 'Full Name',
                                    icon: Icon(Icons.person_outline)),
                                textCapitalization: TextCapitalization.words,
                              ),
                              FormBuilderTextField(
                                attribute: 'email',
                                decoration: InputDecoration(
                                    labelText: 'Email',
                                    icon: Icon(Icons.alternate_email,
                                        color: Colors.grey)),
                                validators: [
                                  FormBuilderValidators.email(
                                      errorText:
                                          'A valid email address is required!')
                                ],
                                keyboardType: TextInputType.emailAddress,
                              ),
                              PasswordInputField(),
                            ],
                          ),
                        ),
                        verticalSpaceMedium,
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            BusyButton(
                              title: 'Sign Up',
                              busy: model.isBusy,
                              onPressed: () {
                                if (_fbKey.currentState.saveAndValidate())
                                  model.signUp(
                                      email: _fbKey.currentState.value['email'],
                                      password:
                                          _fbKey.currentState.value['password'],
                                      fullName: _fbKey
                                          .currentState.value['fullName']);
                              },
                            )
                          ],
                        )
                      ],
                    )),
              ));
}
