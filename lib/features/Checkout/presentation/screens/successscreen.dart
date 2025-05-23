
import 'package:flutter/material.dart';
import 'package:we_care/features/Checkout/widgets/thank_you_view_body.dart';
import 'package:we_care/features/patient/presintation/screens/home_layout.dart';

class successscreen extends StatelessWidget {
  const successscreen({super.key, required this.Total});
 final double  Total;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(leading: IconButton(onPressed: (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeLayout()));
      }, icon: Icon(Icons.arrow_back)),),
      body: Center(child:ThankYouViewBody(Total: Total,)),
    );
  }
}