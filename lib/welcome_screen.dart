import 'package:flutter/material.dart';
import 'package:we_care/core/utils/app_styles.dart';
import 'package:we_care/core/utils/colors.dart';
import 'package:we_care/core/widgets/custom_bottom.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,

                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Image.asset(
                      'assets/images/vv.png',
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text(
                        "Welcome",
                        style: AppStyles.styleblold40.copyWith(
                          fontFamily: "Rubik",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.only(top: 7, left: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ًWith you from pain to recovery",
                      style: AppStyles.stylesmall.copyWith(
                        color: const Color.fromARGB(255, 107, 107, 107),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                    Text(
                      "ًContinue as",
                      style: AppStyles.stylesmall.copyWith(
                        color: const Color.fromARGB(255, 19, 19, 19),
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.03,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.pushReplacementNamed(context, '/Login');
                            },
                            child: custom_bottom(color: primaryColor, text: '  Clint  ')),
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * .23,
                          ),
                          custom_bottom(color: primaryColor, text: ' Doctor'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
