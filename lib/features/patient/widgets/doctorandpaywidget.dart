import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:we_care/core/utils/app_styles.dart';
import 'package:we_care/core/widgets/custom_bottom.dart';
import 'package:we_care/features/Checkout/methods/showPaymentoptions.dart';
import 'package:we_care/features/auth/domain/entity/patient_entitiy.dart';

class doctorandpay extends StatelessWidget {
  const doctorandpay({
    super.key,
    required this.patientEntitiy,
  });

  final  PatientEntitiy patientEntitiy;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(width: 25),
            CircleAvatar(
              radius: MediaQuery.sizeOf(context).width * .08,
              backgroundImage: AssetImage('assets/images/person.jpg'),
            ),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Dr.Mohamed effat", style: AppStyles.regular),
                Text(
                  "professor of Alergy and lmmunology",
                  style: AppStyles.regularblck,
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 25,
              child: Image.asset(
                "assets/images/timer.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                Text("Wating time", style: AppStyles.regularblck),
                Text("10:00 AM"),
              ],
            ),
            SizedBox(width: 20),
            CircleAvatar(
              radius: 20,
              child: Image.asset(
                "assets/images/dolar.png",
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                Text("fees", style: AppStyles.regularblck),
                Text(" 500 EGP"),
              ],
            ),
          ],
        ),
    
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Divider(),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("pateint name", style: AppStyles.smallgray),
              SizedBox(height: 10),
              Text("${patientEntitiy.name}", style: AppStyles.regularblck),
              SizedBox(height: 10),
              Text("phone number", style: AppStyles.smallgray),
              SizedBox(height: 10),
              Text("${patientEntitiy.name}", style: AppStyles.regularblck),
              SizedBox(height: 10),
              Text("Boojing date", style: AppStyles.smallgray),
              SizedBox(height: 10),
              Text(
                "(12/82025)(08:00 PM _ 10:00 PM) ",
                style: AppStyles.regularblck,
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
        Divider(),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
               
            showPaymentOptions(context,patientEntitiy );
              },
              child: custom_bottom(
                text: "     Pay to confirm    ",
                color: Colors.green,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
