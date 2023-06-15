import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/localization.dart';
import 'package:enquantum/src/feature/auth/common/decoration/auth_background_decoration.dart';
import 'package:enquantum/src/feature/auth/common/decoration/auth_input_decoration.dart';
import 'package:enquantum/src/feature/auth/common/widget/auth_page_header.dart';
import 'package:enquantum/src/feature/auth/presentation/viewmodel/register/cubit/register_cubit.dart';
import 'package:enquantum/src/feature/auth/presentation/viewmodel/register/state/register_state.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => 
  Scaffold(
    resizeToAvoidBottomInset: false,
    body: BlocProvider(
      create: (context) => RegisterCubit(),
      child: Center(
        child: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: 5.0,
                minWidth: 5.0,
                maxHeight: MediaQuery.of(context).size.height,
                maxWidth: 30.0,
              ),
              //decoration: authBackgroundDecoration(),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 40.0, 8.0, 60.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(child: AuthPageHeader(subTitle: 'register_create_account'.i18n())),
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 20.0, 10, 20.0),
                          child: Column(
                            children: [
                              BlocBuilder<RegisterCubit, RegisterState>(
                                builder: (context, state) =>
                                  TextFormField(
                                  cursorColor: Colors.black,
                                  style: const TextStyle(color: Colors.black),
                                  decoration: authInputDecoration('register_user'.i18n(), false),
                                  onChanged: (username) => context.read<RegisterCubit>().usernameChanges(username),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 20.0, 10, 20.0),
                          child: Column(
                            children: [
                              BlocBuilder<RegisterCubit, RegisterState>(
                                builder: (context, state) =>
                                  TextFormField(
                                  cursorColor: Colors.black,
                                  style: const TextStyle(color: Colors.black),
                                  decoration: authInputDecoration('register_email'.i18n(), false),
                                  onChanged: (email) => context.read<RegisterCubit>().emailChanges(email),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 20.0, 10, 20.0),
                          child: Column(
                            children: [
                              BlocBuilder<RegisterCubit, RegisterState>(
                                builder: (context, state) =>
                                  TextFormField(
                                  cursorColor: Colors.black,
                                  style: const TextStyle(color: Colors.black),
                                  obscureText: true,
                                  decoration: authInputDecoration('register_password'.i18n(), false),
                                  onChanged: (password) => context.read<RegisterCubit>().passwordChanges(password),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    BlocBuilder<RegisterCubit, RegisterState>(
                      builder: (context, state) => ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(42),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                      onPressed: () => context.read<RegisterCubit>().register(),
                      child: Text(
                        'register_sign_up'.i18n(),
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                      )),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
