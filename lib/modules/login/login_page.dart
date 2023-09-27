import 'package:fleet_manager/shared/routes/app_routes.dart';
import 'package:fleet_manager/widgets/app_buttons.dart';
import 'package:fleet_manager/widgets/app_form_field.dart';
import 'package:fleet_manager/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:go_router_flow/go_router_flow.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    String _email = '';
    String _password = '';

    return AppScaffold(
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: AppTextFormField(
                  onChanged: (value) => _email = value,
                  hintText: 'Digite seu email',
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: AppTextFormField(
                  onChanged: (value) => _password = value,
                  hintText: 'Senha',
                  isPassword: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: AppButton(
                  onPressed: () {
                    GoRouter.of(context).push(AppRoutes.scan);
                  },
                  label: 'Entrar',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
