import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/common/widgets/button/basic_app_button.dart';
import 'package:spotify/presentation/auth/pages/signup.dart';
import '../../../common/widgets/appbar/app_bar.dart';
import '../../../core/config/assets/app_vectors.dart';
import '../../../core/config/theme/app_colors.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _signupText(context),
      appBar: BasicAppbar(
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _registerText(),
            const SizedBox(
              height: 50,
            ),
            _emailField(context),
            const SizedBox(
              height: 20,
            ),
            _passwordField(context),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Recovery Password",
                    style: TextStyle(color: Color(0xff383838), fontWeight: FontWeight.w700),
                  )),
            ),
            const SizedBox(
              height: 30,
            ),
            BasicAppButton(
                onPressed: () async {
                  // var result = await sl<SigninUseCase>().call(
                  //     params: SigninUserReq(
                  //         email: _email.text.toString(), password: _password.text.toString()));
                  // result.fold((l) {
                  //   var snackbar = SnackBar(
                  //     content: Text(l),
                  //     behavior: SnackBarBehavior.floating,
                  //   );
                  //   ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  // }, (r) {
                  //   Navigator.pushAndRemoveUntil(
                  //       context,
                  //       MaterialPageRoute(builder: (BuildContext context) => const HomePage()),
                  //       (route) => false);
                  // });
                },
                title: 'Sign In'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    height: 1,
                    color: AppColors.grey,
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 12),
                  child: Text(
                    "OR",
                    style: TextStyle(color: AppColors.darkBackground, fontWeight: FontWeight.w700),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 1,
                    color: AppColors.grey,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppVectors.appleSingIn,
                    height: 45,
                    width: 45,
                  ),
                  const SizedBox(
                    width: 60,
                  ),
                  SvgPicture.asset(
                    AppVectors.googleSingIn,
                    height: 45,
                    width: 45,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _registerText() {
    return const Text(
      'Sign In',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      textAlign: TextAlign.center,
    );
  }

  Widget _emailField(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(25)),
      child: TextField(
        controller: _email,
        decoration: const InputDecoration(
                hintText: 'Enter Email',
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none)
            .applyDefaults(Theme.of(context).inputDecorationTheme),
      ),
    );
  }

  Widget _passwordField(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(25)),
      child: TextField(
        controller: _password,
        decoration: const InputDecoration(
                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none)
            .applyDefaults(Theme.of(context).inputDecorationTheme),
      ),
    );
  }

  Widget _signupText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Not A Member? ',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (BuildContext context) => SignupPage()));
              },
              child: const Text(
                'Register Now',
                style: TextStyle(color: AppColors.blue, fontWeight: FontWeight.w700),
              ))
        ],
      ),
    );
  }
}
