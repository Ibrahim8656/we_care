
import 'package:flutter/material.dart';
import 'package:we_care/core/utils/colors.dart';

class custoum_textformfild extends StatelessWidget {
  const custoum_textformfild({
    super.key,
    required this.Controller, required this.labelText,
  });

  final TextEditingController Controller;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        validator: (value){
          if (value!.isEmpty) {
            return "Please enter your $labelText";
          }
          return null;
        },
        autofocus: false, 
       controller: Controller,
           decoration: InputDecoration(
             labelText: labelText,
             focusedBorder: OutlineInputBorder(
               borderRadius: BorderRadius.circular(15),
               borderSide: BorderSide(
                 color: primaryColor,
                 width: 2.0,
               ),
             ),
             enabledBorder: OutlineInputBorder(
               borderRadius: BorderRadius.circular(15),
               borderSide: BorderSide(
                 color: const Color.fromARGB(255, 133, 133, 133),
                 width: 2.0,
               ),
             ),
             disabledBorder: OutlineInputBorder(
               borderRadius: BorderRadius.circular(15),
               borderSide: BorderSide(
                 color: primaryColor,
                 width: 2.0,
               ),
             ),
             border: OutlineInputBorder(
               borderRadius: BorderRadius.circular(15),
               borderSide: BorderSide(color: primaryColor),
             ),
           ),
         ),
    );
  }
}
