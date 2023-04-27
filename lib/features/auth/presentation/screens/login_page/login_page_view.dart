import 'package:avangenio/features/auth/presentation/blocs/login/login_provider.dart';
import 'package:flutter/material.dart';

import '../../cubit/login_text_fields_helper_cubit.dart';
import '../../widgets/login_button.dart';
import '../../widgets/text_signup_or_singin.dart';
import '../register_page/register_page_view.dart';
import 'widgets/forgot_password.dart';
import 'widgets/logo.dart';
import 'widgets/text_field.dart';
import 'package:provider/provider.dart';

class LoginPageView extends StatelessWidget {
  const LoginPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: _LoginPageBody(),
    );
  }
}

class _LoginPageBody extends StatefulWidget {
  const _LoginPageBody({
    Key? key,
  }) : super(key: key);

  @override
  State<_LoginPageBody> createState() => _LoginPageBodyState();
}

class _LoginPageBodyState extends State<_LoginPageBody> {
  @override
  Widget build(BuildContext context) {
    final logicProvider = context.read<LoginProvider>();

    final formKey = GlobalKey<FormState>();
    return Consumer<LoginProvider>(
      builder: (context, state, _) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return SingleChildScrollView(
          child: Column(
            children: [
              const LogoImage(),
              Form(
                key: formKey,
                child: const LoginTextField(),
              ),
              const ForgotPassword(),
              Builder(
                builder: (context) {
                  final state =
                      context.watch<LoginTextFieldsHelperCubit>().state;

                  return AuthButonColor(
                    buttonText: 'Iniciar Sessión',
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        await logicProvider.logInWithEmailAndPassword(
                          email: state.email,
                          password: state.password,
                        );
                      }
                    },
                  );
                },
              ),
              TextSignUpOrSingIn(
                phrase: "¿No tienes una cuenta? ",
                singInOrSingUpText: 'Registrar',
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterPageView(),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}


// BlocListener<LoginBloc, LoginState>(
          //   listener: (context, state) {
          //     if (state is LoginSussess) {
          //       BlocProvider.of<AuthenticationBloc>(context)
          //           .add(LoggedIn(user: state.user, token: state.token));
          //       Navigator.pushReplacement(context,
          //           MaterialPageRoute(builder: (context) => const HomePage()));
          //     }
          //     if (state is LoginLoading) {
          //       showDialog(
          //           context: context,
          //           builder: ((context) {
          //             return const Center(
          //               child: CircularProgressIndicator(),
          //             );
          //           }));
          //     }
          //     if (state is LoginError) {
          //       Navigator.pop(context);
          //       SnackBar snackBar = SnackBar(content: Text(state.message!));
          //       ScaffoldMessenger.of(context).showSnackBar(snackBar);
          //     }
          //   },
          //   child:
          // ),