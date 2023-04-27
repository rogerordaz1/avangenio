import 'package:avangenio/features/auth/presentation/blocs/authentication/autentication_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../blocs/authentication/authentication_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Builder(
          builder: (context) {
            final state = context.watch<AutheticationProvider>().state;

            if (state is AuthenticationAuthenticated) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.user.fullName!),
                  Text(state.user.email),
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
