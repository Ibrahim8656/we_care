import 'package:flutter/material.dart';
import 'package:we_care/core/utils/colors.dart';

class custom_contaier extends StatelessWidget {
  const custom_contaier({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * .45,
      decoration: BoxDecoration(
        color: const Color.fromARGB(128, 235, 235, 235),
        borderRadius: BorderRadius.circular(15),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage("assets/images/vv.png"),
              height: MediaQuery.sizeOf(context).height * .06,
              width: MediaQuery.sizeOf(context).width * .15,
              fit: BoxFit.cover,
            ),
            Text("Make appointment",style: TextStyle(
              color:  const Color.fromARGB(221, 3, 40, 83),
            ),)
          ],
        ),
      ),
    );
  }
}
