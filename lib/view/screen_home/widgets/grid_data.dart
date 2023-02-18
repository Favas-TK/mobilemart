import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobilemart/extra/extentions/extentions.dart';

class GridData extends StatelessWidget {
  const GridData({
    Key? key,
    required this.image,
    required this.text,
    required this.ontap
  }) : super(key: key);
  final String image;
  final String text;
  final Function ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          margin: const EdgeInsets.only(top: 18, bottom: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Image.asset(
                 image,
                  height:context.getSize().height * 0.2,
                  width: context.getSize().width * 8,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
               text,
                style: GoogleFonts.actor(fontSize: 15),
              ),
            ],
          ),
        ),
      ),
      onTap:() {
        ontap();
      },
    );
  }
}
