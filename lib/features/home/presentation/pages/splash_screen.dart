import 'package:avangenio/features/auth/presentation/blocs/authentication/autentication_state.dart';
import 'package:avangenio/features/auth/presentation/blocs/authentication/authentication_provider.dart';
import 'package:avangenio/features/auth/presentation/screens/login_page/login_page_view.dart';
import 'package:avangenio/features/home/presentation/pages/profile_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/size_config.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final authProvider = context.watch<AutheticationProvider>();

    () async {
      await Future.delayed(const Duration(seconds: 2));
      if (authProvider.state is AuthenticationAuthenticated) {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          var route = MaterialPageRoute(
            builder: (context) {
              return const ProfilePageView();
            },
          );
          Navigator.of(context).pushReplacement(route);
        });
      }

      if (authProvider.state is AuthenticationUnauthenticated) {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          var route = MaterialPageRoute(
            builder: (context) {
              return const LoginPageView();
            },
          );
          Navigator.of(context).pushReplacement(route);
        });
      }
    }();

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/main/splashscreen.gif"),
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
