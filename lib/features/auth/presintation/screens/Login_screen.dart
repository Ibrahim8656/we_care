import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_care/core/utils/app_styles.dart';
import 'package:we_care/core/utils/colors.dart';
import 'package:we_care/core/widgets/custom_bottom.dart';
import 'package:we_care/core/widgets/custoum_textformfild.dart';
import 'package:we_care/features/auth/data/repository.dart';
import 'package:we_care/features/auth/domain/usecase/add_patient_usecase.dart';
import 'package:we_care/features/auth/domain/usecase/login_usecase.dart';
import 'package:we_care/features/auth/domain/usecase/register_usecase.dart';
import 'package:we_care/features/auth/presintation/cubit/auth_cubit.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(RegisterUsecase(AuthRepositoryImpl()),AddPatientUsecase(AuthRepositoryImpl()),LoginUsecase(AuthRepositoryImpl())),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is LoginError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error), backgroundColor: Colors.red),
            );
          } else if (state is LoginSuccess) {
            Navigator.pushReplacementNamed(context, '/PatientHomeScreen');
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Container(
                              width: double.infinity,
                              child: Image.asset(
                                'assets/images/vv.png',
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height * 0.6,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 27,
                                bottom:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              child: Text(
                                "Login",
                                style: AppStyles.styleblold40.copyWith(
                                  fontFamily: "Rubik",
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015,
                        ),
                        custoum_textformfild(
                          Controller: emailController,
                          labelText: "email",
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        custoum_textformfild(
                          Controller: passwordController,
                          labelText: "email",
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  AuthCubit.get(context).Login(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                }
                              },
                              child: custom_bottom(
                                color: primaryColor,
                                text: "Login",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05,
                            ),
                            Text("Create New Account"),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                  context,
                                  '/Register',
                                );
                              },
                              child: Text("Click Here"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
