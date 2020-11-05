import 'package:flutter/material.dart';
import 'package:nuphonic_front_end/extracted_widgets/custom_button.dart';
import 'package:nuphonic_front_end/extracted_widgets/custom_textfield.dart';
import 'package:nuphonic_front_end/extracted_widgets/error_indicator.dart';
import 'package:nuphonic_front_end/extracted_widgets/eye_indicator.dart';
import 'package:nuphonic_front_end/extracted_widgets/sliding_panel_appBar.dart';
import 'package:nuphonic_front_end/screens/authentication/confirm_code.dart';
import 'package:nuphonic_front_end/screens/authentication/sign_up.dart';
import 'package:nuphonic_front_end/shared/shared.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  PanelController _controller = PanelController();

  bool isOn = true;

  //0 means error, 1 means success and null means default
  int isErrorE; //for email
  int isErrorP; //for password


  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
        controller: _controller,
        backdropEnabled: true,
        color: darkGreyColor,
        minHeight: 83,
        maxHeight: 470,
        borderRadius: bottomPanelBorderRadius,
        collapsed: SlidingPanelAppBar(
          height: 83,
          text: 'SIGN IN TO CONTINUE',
          controller: _controller,
        ),
        panel: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SlidingPanelAppBar(
              height: 83,
              text: 'SIGN IN WITH EMAIL',
              controller: _controller,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                        labelName: 'Email:',
                        hint: 'example@example.com',
                        icons: ErrorIndicator(isError: isErrorE),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        labelName: 'Password:',
                        obsecureText: isOn,
                        hint: '6+ character password',
                        icons: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(()=>isOn=!isOn);
                              },
                              child: EyeIndicator(isOn: isOn),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            ErrorIndicator(isError: isErrorP),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ConfirmCode()));
                          },
                          child: Text(
                            'Forgot Password?',
                            style: texFieldLabelStyle,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      CustomButton(
                        labelName: 'SIGN IN',
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUp()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'New to ',
                              style: signUpLabelStyle,
                            ),
                            Text(
                              'NUPHONIC',
                              style: appNameFontStyle,
                            ),
                            Text(
                              '? Sign Up Now',
                              style: signUpLabelStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
