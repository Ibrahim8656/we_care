import 'package:flutter/material.dart';
import 'package:we_care/core/utils/app_styles.dart';
import 'package:we_care/core/widgets/custoum_textformfild.dart';
import 'package:we_care/features/auth/domain/entity/patient_entitiy.dart';
import 'package:we_care/features/patient/widgets/doctorandpaywidget.dart';

class Homevisitscreen extends StatelessWidget {
  const Homevisitscreen({super.key, required this.patientEntitiy,required this.address});
final PatientEntitiy patientEntitiy;
final String address;
  @override
  Widget build(BuildContext context) {
    TextEditingController LocationController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text("Home visitt"),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Need the doctor at home?",style: AppStyles.regular,),
            SizedBox(height: 12,),
              Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text("Address",style: AppStyles.regularblck  ,),
            ),
            SizedBox(height: 5,),
            custoum_textformfild(Controller: LocationController, labelText: "enter your Address",),
            SizedBox(height: 12,),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text("Location",style: AppStyles.regularblck  ,),
            ),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: InkWell(onTap: (){
                Navigator.pushNamed(context, "/location",arguments: patientEntitiy);
              },
                child: Container(
                  
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15)
                    ,color: const Color.fromARGB(255, 194, 194, 194)
                  ),
                  child: Center(child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 15),
                  child: Text(address,style: AppStyles.regularblck,maxLines: 1,overflow: TextOverflow.ellipsis,),
                )),),
              ),
            ),
             SizedBox(height: 12,),
              Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text("Doctor info",style: AppStyles.regularblck  ,),
            ),
            SizedBox(height: 5,),
            doctorandpay(patientEntitiy: patientEntitiy)
          ],
        ),
      ));
  }
}