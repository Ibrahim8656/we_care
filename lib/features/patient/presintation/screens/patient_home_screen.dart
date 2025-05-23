import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_care/core/utils/app_styles.dart';
import 'package:we_care/core/utils/colors.dart';
import 'package:we_care/core/widgets/custom_bottom.dart';
import 'package:we_care/features/auth/domain/entity/patient_entitiy.dart';
import 'package:we_care/features/patient/presintation/cubit/patient_cubit.dart';
import 'package:we_care/features/patient/presintation/screens/appointmentscreen.dart';
import 'package:we_care/features/patient/widgets/custom_article.dart';
import 'package:we_care/features/patient/widgets/custom_container.dart';

class PatientHomeScreen extends StatelessWidget {
  const PatientHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PatientCubit, PatientState>(
      listener: (context, state) {
        if (state is PatientLoaded) {}
      },
      builder: (context, state) {
        return BlocConsumer<PatientCubit, PatientState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is PatientLoaded) {}
            return Scaffold(
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.sizeOf(context).width * .03,
                    ),
                    child: Text(
                      " Need a doctor? ",
                      style: AppStyles.styleblold40.copyWith(
                        fontSize: 25,
                        color: primaryColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.sizeOf(context).width * .03,
                    ),
                    child: Text(
                      " Book online or call us to help you ",
                      style: AppStyles.stylesmall.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * .02),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(onTap: (){
                           Navigator.pushNamed(context, '/appointment_screen',arguments: PatientCubit.get(context).patientDataa[0]);
                        },
                          child: custom_contaier(
                            text: "Make appointment",
                            image: "assets/images/appointment.png",
                            index: 1,
                          ),
                        ),
                        SizedBox(width: 10),
                        custom_contaier(
                          text: 'Callcenter',
                          image: 'assets/images/callcenter.png',
                          index: 2, 
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(onTap: (){
                          Navigator.pushNamed(context, '/homevisit_screen',arguments: PatientCubit.get(context).patientDataa[0]);
                        },
                          child: custom_contaier(
                            text: 'Home visti',
                            image: 'assets/images/home.png',
                            index: 3, 
                          ),
                        ),
                        SizedBox(width: 10),
                        custom_contaier(
                          text: 'lab test from home',
                          image: 'assets/images/latb.png',
                          index: 4, 
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * .02),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.sizeOf(context).width * .04,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: primaryColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 20,
                        ),
                        child: Row(
                          children: [
                            Text(
                              "have a medical questions?",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize:
                                    MediaQuery.sizeOf(context).width * .043,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * .04,
                            ),
                            custom_bottom(
                              color: primaryColor,
                              text: "Ask now",
                              fontSize: MediaQuery.sizeOf(context).width * .032,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * .02),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.sizeOf(context).width * .04,
                            right: MediaQuery.sizeOf(context).width * .02,
                          ),
                          child: Row(
                            children: [
                              Text(
                                "Latest articles ",
                                style: AppStyles.styleblold40.copyWith(
                                  color: const Color.fromARGB(221, 3, 40, 83),
                                  fontSize:
                                      MediaQuery.sizeOf(context).width * .08,
                                ),
                              ),
                              Spacer(),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  "More",
                                  style: AppStyles.stylesmall.copyWith(
                                    fontSize:
                                        MediaQuery.sizeOf(context).width * .05,
                                    color: primaryColor,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: MediaQuery.sizeOf(context).width * .05,
                                color: primaryColor,
                              ),
                            ],
                          ),
                        ),
                        Expanded(child: custom_article()),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
