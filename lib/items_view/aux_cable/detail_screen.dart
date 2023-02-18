import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/information_add_bloc.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({
    super.key,
    required this.itemAxis,
  });

  QueryDocumentSnapshot<Object?> itemAxis;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final parkingadd =
      FirebaseFirestore.instance.collection('MobilePhone_Collection');

  final auth = FirebaseAuth.instance;
  final parkingDetailsUpdate = InformationAddBloc();

  @override
  Widget build(BuildContext context) {
    final images = widget.itemAxis['Spot_image'] as List;
    return BlocProvider(
      create: (context) => parkingDetailsUpdate,
      child: BlocListener<InformationAddBloc, InformationAddState>(
        listener: (context, state) {
      //    if (state is DetailsAddUpdate) {}
        },
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                height: 635,
                width: 375,
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(10),
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            backgroundImage: AssetImage(
                                'assets/images/pngimg.com - parking_PNG91.png'),
                          ),
                        ),
                        Text(
                          widget.itemAxis['Area_Name'].toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Center(
                      child: CarouselSlider.builder(
                        itemCount: images.length,
                        options: CarouselOptions(),
                        itemBuilder: (
                          BuildContext context,
                          int itemIndex,
                          int pageViewIndex,
                        ) =>
                            Container(
                          height: 600,
                          width: 200,
                          child: Image.network(
                            images[itemIndex].toString(),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        widget.itemAxis['Area_Name'].toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Row(
                        children: [
                          const Icon(Icons.location_on_outlined, size: 18),
                          Text(
                            widget.itemAxis['Location_Name'].toString(),
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      trailing: const Text('30 slots'),
                    ),
                    const Divider(),
                    Padding(
                      padding: EdgeInsets.only(right: 230.h),
                      child: const Text(
                        'Information',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50.h,
                      width: 300.h,
                      // child: Text(
                      //   parkdetail['Information'].toString(),
                      // ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 160.h),
                      child: const Text(
                        'Facilitities We Provide',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                   
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: SizedBox(
                            //   height: 50,
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              highlightElevation: 0,
                              textColor: Colors.white,
                              color: const Color.fromARGB(255, 235, 219, 174),
                              child: const Text(
                                'Edit Page',
                                style: TextStyle(color: Colors.black),
                              ),
                              onPressed: () {
                                // parkingDetailsUpdate.add(
                                //   UpdateDetailEvent(
                                //     image:imagefiles,
                                //     name: parkingAreaName.text,
                                //     description: parkingInformation.text,
                                //     locationName: parkingLocation.text,
                                //     facilities: parkingFacilities.text,
                                //     slots: parkingSlots.text,
                                //   ),
                                // );
                              },
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: SizedBox(
                            //   height: 50,
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              highlightElevation: 0,
                              textColor: Colors.white,
                              color: const Color.fromARGB(255, 235, 219, 174),
                              child: const Text(
                                'Delete Page',
                                style: TextStyle(color: Colors.black),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
