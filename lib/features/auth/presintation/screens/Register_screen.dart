import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_care/core/utils/app_styles.dart';
import 'package:we_care/core/utils/colors.dart';
import 'package:we_care/core/widgets/custom_bottom.dart';
import 'package:we_care/core/widgets/custoum_textformfild.dart';
import 'package:we_care/features/auth/presintation/cubit/auth_cubit.dart';

class Registerscreen extends StatelessWidget {
  const Registerscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController genderController = TextEditingController();
    TextEditingController jobController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController ageController = TextEditingController();

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthError || state is AddpatientError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("some thing is wrong try again"),
              backgroundColor: Colors.red,
            ),
          );
        } else {
          state is AddpatientSuccess
              ? Navigator.popAndPushNamed(context, "/Login")
              : null;
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          Container(
                            width: double.infinity,
                            child: Image.asset(
                              'assets/images/Register.png',
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.25,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 27,
                              bottom: MediaQuery.of(context).size.height * 0.02,
                            ),
                            child: Text(
                              "Register",
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
                        Controller: nameController,
                        labelText: "name",
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
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
                        labelText: "password",
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      custoum_textformfild(
                        Controller: ageController,
                        labelText: "age",
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      custoum_textformfild(
                        Controller: addressController,
                        labelText: "address",
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      custoum_textformfild(
                        Controller: jobController,
                        labelText: "job",
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      custoum_textformfild(
                        Controller: phoneController,
                        labelText: "phone",
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      custoum_textformfild(
                        Controller: genderController,
                        labelText: "gender",
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                AuthCubit.get(context).Register(
                                  email: emailController.text,
                                  password: passwordController.text,
                                ).then( (value) {
                                   AuthCubit.get(context).AddPatient(
                                  name: nameController.text,
                                  phone: phoneController.text,
                                  address: addressController.text,
                                  job: jobController.text,
                                  age: ageController.text,
                                  gender: genderController.text,
                                );
                                });
                               
                              }
                            },
                            child: custom_bottom(
                              color: primaryColor,
                              text: "Register",
                            ),
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
    );
  }
}
