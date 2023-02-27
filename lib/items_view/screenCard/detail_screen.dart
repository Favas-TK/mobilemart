import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobilemart/extra/Divider/divider.dart';
import 'package:mobilemart/extra/extentions/extentions.dart';
import 'package:mobilemart/extra/res/colors.dart';
import 'package:mobilemart/extra/res/const_widget.dart';

class ScreenCardDetailScreen extends StatefulWidget {
  ScreenCardDetailScreen({
    super.key,
    required this.itemAxis,
  });

  QueryDocumentSnapshot<Object?> itemAxis;

  @override
  State<ScreenCardDetailScreen> createState() => _ScreenCardDetailScreenState();
}

class _ScreenCardDetailScreenState extends State<ScreenCardDetailScreen> {
  final mobileAdd =
      FirebaseFirestore.instance.collection('ScreenCard_Collection');

  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final images = widget.itemAxis['image'] as List;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: context.getSize().width * 0.86,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
      body: Center(
        child: Card(
          elevation: 50,
          shadowColor: Colors.black,
          color: blulight,
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    context.getSize().width * 0.2,
                  ),
                  topRight: Radius.circular(
                    context.getSize().width * 0.2,
                  ),
                  bottomLeft: Radius.circular(
                    context.getSize().width * 0.2,
                  ),
                  bottomRight: Radius.circular(
                    context.getSize().width * 0.2,
                  ),
                ),
                color: white,
              ),
              child: Column(
                children: [
                  space10,
                  emptybx,
                  Center(
                    child: CarouselSlider.builder(
                      itemCount: images.length,
                      options: CarouselOptions(),
                      itemBuilder: (
                        BuildContext context,
                        int itemIndex,
                        int pageViewIndex,
                      ) =>
                          SizedBox(
                        height: 600,
                        width: 200,
                        child: Image.network(
                          images[itemIndex].toString(),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  space10,
                  space10,
                  CustomPaint(
                    painter: DrawDottedhorizontalline(),
                  ),
                  Padding(
                    padding: MediaQuery.of(context).viewInsets,
                    child: Column(
                      children: [
                        space10,
                        Padding(
                          padding: EdgeInsets.only(
                              right: context.getSize().width * 0.1),
                          child: Text(
                            widget.itemAxis['Name'].toString(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        space10,
                        Padding(
                          padding: EdgeInsets.only(
                              right: context.getSize().width * 0.1),
                          child: Text(
                            widget.itemAxis['Description'].toString(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 15),
                          ),
                        ),
                        space10,
                        Padding(
                          padding: EdgeInsets.only(
                              right: context.getSize().width * .1),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('\u{20B9} '),
                              Text(
                                widget.itemAxis['Price'].toString(),
                                style: const TextStyle(
                                    color: Colors.black45, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        space10,
                        Padding(
                          padding: EdgeInsets.only(
                              right: context.getSize().width * .1),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Balance item: ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                widget.itemAxis['Count'].toString(),
                                style: const TextStyle(
                                    color: Colors.black45, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        space10,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
