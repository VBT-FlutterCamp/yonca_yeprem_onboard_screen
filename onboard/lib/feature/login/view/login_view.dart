import 'package:flutter/material.dart';
import 'package:onboard/core/constants/app_strings.dart';
import 'package:kartal/kartal.dart';
import 'package:onboard/feature/login/view/widget/custom_text_form_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        physics: _emailNode.hasFocus || _passwordNode.hasFocus
            ? const ScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: context.paddingLow,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Spacer(),
                Expanded(
                  flex: 1,
                  child: _buildWelcomeText(context),
                ),
                Expanded(flex: 3, child: _buildForm(context)),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: context.verticalPaddingLow,
                    child: _buildButtonLogin(context),
                  ),
                ),
                Spacer(),
                Expanded(
                  child: _buildBottomText(),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }

  Text _buildBottomText() {
    return const Text(
      "Don't you have an account ? Create one.",
      textAlign: TextAlign.center,
    );
  }

  Column _buildWelcomeText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.welcome,
          style: Theme.of(context).textTheme.headline5,
        ),
        Text(
          AppStrings.login,
          style: Theme.of(context)
              .textTheme
              .headline3
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  ElevatedButton _buildButtonLogin(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: Colors.pink),
      child: Text(
        "LOGIN",
        textAlign: TextAlign.center,
        style: context.textTheme.headline5?.copyWith(
          color: Colors.white,
        ),
      ),
      onPressed: () {},
    );
  }

  Form _buildForm(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextFormField(
                controller: _mailController,
                textInputType: TextInputType.emailAddress,
                focusNode: _emailNode,
                labelText: 'Email Adress'),
            CustomTextFormField(
              controller: _passwordController,
              textInputType: TextInputType.text,
              focusNode: _passwordNode,
              labelText: 'Password',
              isPassword: true,
            ),
            Padding(
              padding: context.verticalPaddingLow,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: context.paddingLow,
                    child: Text(
                      "Forgot Password?",
                      style: context.textTheme.bodyText1,
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
