import 'package:flutter/material.dart';
import 'package:warqkm/features/auth/presentation/pages/code_activation_screen.dart';
import 'package:warqkm/features/auth/presentation/pages/forget_password_screen.dart';
import 'package:warqkm/features/auth/presentation/pages/login_screen.dart';
import 'package:warqkm/features/auth/presentation/pages/register_screen.dart';
import 'package:warqkm/features/auth/presentation/pages/reset_password_screen.dart';

class RouterHelper {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoginScreen.routeName:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case RegisterScreen.routeName:
        return MaterialPageRoute(builder: (context) => const RegisterScreen());
      case ForgotPasswordScreen.routeName:
        return MaterialPageRoute(builder: (context) => const ForgotPasswordScreen());
      case ActivationCodeScreen.routeName:
        return MaterialPageRoute(builder: (context) => const ActivationCodeScreen());
      case ResetPasswordScreen.routeName:
        return MaterialPageRoute(builder: (context) => const ResetPasswordScreen());
      default:
        return MaterialPageRoute(builder: (context) => _errorBuilder());
    }
  }
}

Widget _errorBuilder() => const Scaffold(
      body: Center(
        child: Text('Wrong Route'),
      ),
    );
