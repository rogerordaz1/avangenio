import 'package:avangenio/core/constantes/colors.dart';
import 'package:avangenio/features/auth/presentation/blocs/authentication/autentication_state.dart';
import 'package:avangenio/features/auth/presentation/blocs/login/login_provider.dart';
import 'package:avangenio/features/auth/presentation/screens/login_page/login_page_view.dart';
import 'package:avangenio/features/home/presentation/widgets/top_custom_shape.dart';
import 'package:avangenio/features/home/presentation/widgets/user_sections.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../auth/presentation/blocs/authentication/authentication_provider.dart';

class ProfilePageView extends StatelessWidget {
  const ProfilePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Scaffold(
              backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
              appBar: AppBar(
                backgroundColor: buttonColor,
                centerTitle: true,
                elevation: 0,
                title: const Text(
                  "Pagina Principal",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              body: Consumer<AutheticationProvider>(
                  builder: (context, provider, _) {
                final state = provider.state;
                if (state is AuthenticationAuthenticated) {
                  return ListView(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TopCustomShape(),
                          SizedBox(
                            height: constraints.biggest.height * 0.05,
                          ),
                          UserSection(
                              iconName: Icons.email,
                              sectionText: state.user.email),
                          UserSection(
                              iconName: Icons.people,
                              sectionText: state.user.fullName!),
                          UserSection(
                            iconName: Icons.login_rounded,
                            sectionText: "Log Out",
                            onTap: () {
                              final authProv =
                                  context.read<AutheticationProvider>();
                              final logProv = context.read<LoginProvider>();

                              authProv.loggedOutUser();
                              logProv.changeToINitialState();
                              var route = MaterialPageRoute(
                                builder: (context) {
                                  return const LoginPageView();
                                },
                              );
                              Navigator.of(context).pushReplacement(route);
                            },
                          ),
                        ],
                      ),
                    ],
                  );
                } else {
                  return const SizedBox();
                }
              }),
            );
          },
        ),
      ),
    );
  }
}
