import 'package:flutter/material.dart';

class custom_article extends StatelessWidget {
  const custom_article({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
               boxShadow: [BoxShadow(
                offset:Offset(3, 4),
                blurRadius: 5,
                color: const Color.fromARGB(255, 199, 199, 199)
               )
                
               ],
                borderRadius: BorderRadius.circular(15),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              height: 240,
              width: 250,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/images/box.png",
                    height: MediaQuery.sizeOf(context).height*.23,
                    width: 250,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 8,),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text("25 feb 2025",style: TextStyle(color: const Color.fromARGB(255, 190, 190, 190,),fontWeight: FontWeight.w700),),
                  ),
             
                  Container(
                    padding: EdgeInsets.only(top: 5,left: 15,right: 15,bottom: 15),
                    child: Text("information about this articles giveme an informations",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),overflow: TextOverflow.ellipsis,maxLines: 2,)),
                ],
              ),
            ),
          );
        },
        itemCount: 10,
        separatorBuilder: (
          BuildContext context,
          int index,
        ) {
          return SizedBox(width: 16);
        },
      ),
    );
  }
}
