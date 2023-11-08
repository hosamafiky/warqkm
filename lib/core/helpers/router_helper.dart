import 'package:flutter/material.dart';
import 'package:warqkm/features/auth/presentation/pages/code_activation_screen.dart';
import 'package:warqkm/features/auth/presentation/pages/forget_password_screen.dart';
import 'package:warqkm/features/auth/presentation/pages/login_screen.dart';
import 'package:warqkm/features/auth/presentation/pages/register_screen.dart';
import 'package:warqkm/features/auth/presentation/pages/reset_password_screen.dart';
import 'package:warqkm/features/layout/presentation/pages/layout_screen.dart';

import '../../features/auth/presentation/pages/edit_profile_screen.dart';

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
      case LayoutScreen.routeName:
        return MaterialPageRoute(builder: (context) => const LayoutScreen());
      case EditProfileScreen.routeName:
        return MaterialPageRoute(builder: (context) => const EditProfileScreen());
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
