import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobilemart/extra/extentions/extentions.dart';
import 'package:mobilemart/extra/res/colors.dart';
import 'package:mobilemart/extra/res/const_widget.dart';
import 'package:mobilemart/view/screen_home/homscreen.dart';
import 'package:mobilemart/view/screen_login/bloc/authentication_bloc.dart';
import 'package:mobilemart/view/screen_login/widgets/custom_text_field_widget.dart';
import 'package:mobilemart/view/screen_login/widgets/top_stack_welcome_widget.dart';
import 'package:mobilemart/view/screen_signup/signup_page.dart';
import '../screen_get_started/widgets/custom_elevated_btn_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final _authbloc = AuthenticationBloc();
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _authbloc,
      child: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          } else if (state is loginFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        child: Scaffold(
          body: ListView(
            shrinkWrap: true,
            children: <Widget>[
              const TopStackWelcomeWidget(),
              Padding(
                padding: EdgeInsets.all(
                  context.getSize().width * 0.1,
                ),
                child: Column(
                  children: <Widget>[
                    CustomTextFieldWidget(
                      controller: mailController,
                      hintText: 'Enter Username',
                    ),
                    space10,
                    CustomTextFieldWidget(
                      controller: passwordController,
                      hintText: 'Enter Password',
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: CustomElevatedBtnWidget(
                    btnText: 'Login',
                    onpressed: () => _authbloc.add(
                      LoginEvent(
                        mail: mailController.text,
                        password: passwordController.text,
                      ),
                    ),
                    btnColor: blulight,
                    btnTextColor: white,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Dont have an account?'),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignupPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'SignUp',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


















 // connectionStatus.hasConnection.then(
              //   (bool value) => value == true
              //       ? LoginController.login(
              //           LoginState.userNameController.text,
              //           LoginState.passWordController.text,
              //         ).then(
              //           (LoginModel? data) =>
              //               (data != null && data.status == true)
              //                   ? {
              //                       LoginController.saveToken(
              //                               logData: data, isLog: true)
              //                           .then(
              //                         (value) => Get.offAll(
              //                           const HomeLayout(),
              //                         ),
              //                       ),
              //                     }
              //                   : Fluttertoast.showToast(
              //                       msg: "Login Failed",
              //                       toastLength: Toast.LENGTH_LONG,
              //                       gravity: ToastGravity.BOTTOM_RIGHT,
              //                       timeInSecForIosWeb: 1,
              //                       backgroundColor: black,
              //                       textColor: white,
              //                       fontSize: 16.0,
              //                     ),
              //         )
              //       : Fluttertoast.showToast(
              //           msg: "Please check your Internet Connection",
              //           toastLength: Toast.LENGTH_LONG,
              //           gravity: ToastGravity.BOTTOM_RIGHT,
              //           timeInSecForIosWeb: 1,
              //           backgroundColor: black,
              //           textColor: white,
              //           fontSize: 16.0,
              //         ),
              // );