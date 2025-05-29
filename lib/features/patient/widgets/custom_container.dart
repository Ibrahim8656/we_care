import 'package:flutter/material.dart';

class custom_contaier extends StatelessWidget {
  const custom_contaier({super.key, required this.text, required this.image, required this.index});
  final String text ,image;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      
      width: MediaQuery.sizeOf(context).width * .45,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(image),
              height: MediaQuery.sizeOf(context).height * .06,
              width: MediaQuery.sizeOf(context).width * .20,
              fit: BoxFit.cover,
            ),
            Text(text,style: TextStyle(
              fontSize: MediaQuery.sizeOf(context).width * .04,
              color:  const Color.fromARGB(221, 3, 40, 83),
            ),)
          ],
        ),
      ),
    );
  }
}
