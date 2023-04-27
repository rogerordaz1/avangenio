import 'package:avangenio/features/auth/presentation/blocs/authentication/authentication_provider.dart';
import 'package:avangenio/features/auth/presentation/blocs/login/login_provider.dart';
import 'package:avangenio/features/auth/presentation/blocs/register/register_provider.dart';
import 'package:avangenio/features/auth/presentation/screens/login_page/login_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'core/injection/dependency_Injection.dart' as sl;
import 'core/injection/dependency_Injection.dart';
import 'features/auth/presentation/cubit/login_text_fields_helper_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sl.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AutheticationProvider>(
          create: (_) => AutheticationProvider(getIt())..onAppStart(),
          lazy: false,
        ),
        ChangeNotifierProvider<LoginProvider>(
          create: (_) => LoginProvider(
            usecase: getIt(),
            autheticationProvider: getIt(),
            sharedPreferences: getIt(),
          ),
        ),
        ChangeNotifierProvider<RegisterProvider>(
          create: (_) => RegisterProvider(
            usecase: getIt(),
            autheticationProvider: getIt(),
            sharedPreferences: getIt(),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LoginTextFieldsHelperCubit()),
      ],
      child: MaterialApp(
        theme: ThemeData(),
        title: 'Avangenio',
        home: const LoginPageView(),
      ),
    );
  }
}
