

import 'package:mobilemart/extra/exports/exports.dart';


class SignupPage extends StatelessWidget {
  SignupPage({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cpasswordController = TextEditingController();
  final _regbloc = RegistrationBloc();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _regbloc,
      child: BlocListener<RegistrationBloc, RegistrationState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
            );
          } else if (state is SignUpFailed) {
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
              Padding(
                padding: EdgeInsets.all(
                  context.getSize().width * 0.1,
                ),
                child: Column(
                  children: <Widget>[
                    emptybx,
                    CustomTextFieldWidget(
                      controller: nameController,
                      hintText: 'Enter Username',
                    ),
                    space10,
                    CustomTextFieldWidget(
                      controller: mailController,
                      hintText: 'Enter your Mail',
                    ),
                    space10,
                    CustomTextFieldWidget(
                      controller: passwordController,
                      hintText: 'Enter Password',
                    ),
                    space10,
                    const CustomTextFieldWidget(
                      hintText: 'Confirm Password',
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: CustomElevatedBtnWidget(
                    btnText: 'SignUp',
                    onpressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Processing Data'),
                        ),
                      );
                      _regbloc.add(
                        RegisterEvent(
                          name: nameController.text,
                          mail: mailController.text,
                          passwrd: passwordController.text,
                        ),
                      );
                    },
                    btnColor: blulight,
                    btnTextColor: white,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already Have  an account?'),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
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
