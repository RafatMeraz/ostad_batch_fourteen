import 'package:crafty_bay/features/shared/presentation/utils/validators.dart';
import 'package:flutter/material.dart';

import '../../../../app/extensions/localization_extension.dart';
import '../widgets/app_logo.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String name = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final TextEditingController _phoneTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const .all(24),
            child: Form(
              key: _formKey,
              autovalidateMode: .onUserInteraction,
              onChanged: () {},
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  AppLogo(width: 80),
                  const SizedBox(height: 16),
                  Text('Create an Account', style: textTheme.titleLarge),
                  const SizedBox(height: 6),
                  Text(
                    'Sign up with your email and password',
                    style: textTheme.labelLarge,
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: _emailTEController,
                    textInputAction: .next,
                    keyboardType: .emailAddress,
                    decoration: InputDecoration(
                      labelText: context.localization.email,
                      hintText: context.localization.email,
                    ),
                    validator: (String? value) =>
                        Validators.validateEmail(value),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _firstNameTEController,
                    textInputAction: .next,
                    decoration: InputDecoration(
                      labelText: 'First name',
                      hintText: 'First name',
                    ),
                    validator: (String? value) =>
                        Validators.validateInput(value, 'Enter your first name'),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _lastNameTEController,
                    textInputAction: .next,
                    decoration: InputDecoration(
                      labelText: 'Last name',
                      hintText: 'LAst name',
                    ),
                    validator: (String? value) =>
                        Validators.validateInput(value, 'Enter your last name'),
                  ),
                  const SizedBox(height: 8),TextFormField(
                    controller: _cityTEController,
                    textInputAction: .next,
                    decoration: InputDecoration(
                      labelText: 'City',
                      hintText: 'City',
                    ),
                    validator: (String? value) =>
                        Validators.validateInput(value, 'Enter your city name'),
                  ),
                  const SizedBox(height: 8),
                  const SizedBox(height: 8),TextFormField(
                    controller: _phoneTEController,
                    textInputAction: .next,
                    keyboardType: .phone,
                    decoration: InputDecoration(
                      labelText: 'Phone',
                      hintText: 'Phone',
                    ),
                    validator: (String? value) =>
                        Validators.validateInput(value, 'Enter your phone number'),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _passwordTEController,
                    obscureText: true,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                      labelText: context.localization.password,
                      hintText: context.localization.password,
                    ),
                    validator: (input) => Validators.validatePassword(input),
                  ),
                  const SizedBox(height: 16),
                  FilledButton(
                    onPressed: _onTapSignUpButton,
                    child: Text('Sign Up'),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: _onTapSignInButton,
                    child: Text("Have an account? Sign In"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignInButton() {
    Navigator.pop(context);
  }

  void _onTapSignUpButton() {
    if (_formKey.currentState!.validate()) {
      // TODO: Call sign in api
    }
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _cityTEController.dispose();
    _phoneTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
