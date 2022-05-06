import 'package:easacc_task/view/screens/setting_screen.dart';
import 'package:easacc_task/view_model/login_view_model/login_states.dart';
import 'package:easacc_task/view_model/login_view_model/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/assets_manager.dart';
import '../../core/services/alerts.dart';
import '../../core/values_manager.dart';
import '../widgets/auth_button.dart';
import '../widgets/status_bar.dart';
import '../widgets/terms_agreement.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LightStatusBar(
      child: Scaffold(
        body: DecoratedBox(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(AppImages.authBG),
            ),
          ),
          child: Container(
            height: deviceHeight,
            width: deviceWidth,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.7)),
            child: Column(
              children: [
                Expanded(
                  child: Image.asset(
                    AppImages.easaccLogo,
                    width: deviceWidth * 0.7,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AuthButton(
                        btnColor: Colors.blueAccent,
                        loginMethodLogo: AppImages.facebook,
                        text: "Login with facebook",
                        onPressed: () =>
                            BlocProvider.of<LoginViewModel>(context)
                                .facebookLogin(context),
                      ),
                      SizedBox(height: deviceHeight * 0.02),
                      AuthButton(
                        btnColor: Colors.redAccent,
                        loginMethodLogo: AppImages.google,
                        text: "Login with google",
                        onPressed: () =>
                            BlocProvider.of<LoginViewModel>(context)
                                .googleLogin(context),
                      ),
                      SizedBox(height: deviceHeight * 0.02),
                      const TermsAgreement(),
                    ],
                  ),
                ),
                BlocConsumer<LoginViewModel, LoginStates>(
                  listener: (context, state) {
                    if (state is LoginSuccessState) {
                      Alerts.showToast("You logged in successfully");
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => SettingScreen()),
                      );
                    }
                    if (state is LoginFailureState) {
                      Alerts.showSnackBar(context, state.errorMessage);
                    }
                  },
                  builder: (context, state) {
                    if (state is LoginLoadingState) {
                      return const CircularProgressIndicator.adaptive();
                    }
                    return Container();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
