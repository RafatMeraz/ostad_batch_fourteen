import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import '../../../../app/app_colors.dart';
import '../providers/otp_timer_provider.dart';
import '../widgets/app_logo.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  static const String name = '/verify-otp';

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final PinInputController _otpTEController = PinInputController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final OtpTimerProvider _otpTimerProvider = OtpTimerProvider(60);

  @override
  void initState() {
    super.initState();
    _otpTimerProvider.startTimer();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);

    return ChangeNotifierProvider.value(
      value: _otpTimerProvider,
      child: Scaffold(
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
                    const SizedBox(height: 60),
                    AppLogo(width: 100),
                    const SizedBox(height: 16),
                    Text('Verify your OTP', style: textTheme.titleLarge),
                    const SizedBox(height: 6),
                    Text(
                      'Enter your otp that has been sent to your email address',
                      style: textTheme.labelLarge,
                    ),
                    const SizedBox(height: 24),
                    MaterialPinField(
                      length: 4,
                      pinController: _otpTEController,
                      keyboardType: .number,
                      theme: MaterialPinTheme(
                        fillColor: Colors.transparent,
                        focusedFillColor: Colors.transparent,
                        focusedBorderColor: AppColors.themeColor,
                      ),
                    ),
                    const SizedBox(height: 16),
                    FilledButton(
                      onPressed: _onTapSignInButton,
                      child: Text('Verify'),
                    ),
                    const SizedBox(height: 16),
                    Consumer<OtpTimerProvider>(
                      builder: (context, _, _) {
                        if (_otpTimerProvider.secondsLeft == 0) {
                          return TextButton(
                            onPressed: _onTapResendOTP,
                            child: Text("Resend OTP"),
                          );
                        } else {
                          return RichText(
                            text: TextSpan(
                              style: TextStyle(color: Colors.black),
                              children: [
                                TextSpan(text: 'Resend OTP after '),
                                TextSpan(
                                  text: '${_otpTimerProvider.secondsLeft}s',
                                  style: TextStyle(color: AppColors.themeColor),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignInButton() {
    if (_formKey.currentState!.validate()) {
      // TODO: Call sign in api
    }
  }

  void _onTapResendOTP() {
    _otpTimerProvider.startTimer();
  }

  @override
  void dispose() {
    _otpTEController.dispose();
    super.dispose();
  }
}
