import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobilemart/extra/res/colors.dart';
import 'package:mobilemart/extra/res/const_widget.dart';
import 'package:mobilemart/items_view/HeadPhone/bloc/headphone_bloc.dart';
import 'package:mobilemart/items_view/HeadPhone/head_phone.dart';
import 'package:mobilemart/view/screen_get_started/widgets/custom_elevated_btn_widget.dart';
import 'package:mobilemart/view/screen_login/widgets/custom_text_field_widget.dart';

class AddHeadPhones extends StatefulWidget {
  const AddHeadPhones({super.key});

  @override
  State<AddHeadPhones> createState() => _AddHeadPhonesState();
}

class _AddHeadPhonesState extends State<AddHeadPhones> {
  late final XFile? image;

  final headphoneAdd =
      FirebaseFirestore.instance.collection('HeadPhone_Collection');

  final auth = FirebaseAuth.instance;

  final itemDetails = HeadphoneBloc();

  TextEditingController headPhoneName = TextEditingController();

  TextEditingController headPhonePrice = TextEditingController();

  TextEditingController headPhoneDescription = TextEditingController();

  TextEditingController headPhoneCount = TextEditingController();

  List<XFile?>? imagefiles;

  final imgpicker = ImagePicker();

  Future<List<XFile>>? pickedfiles;

  Future<void> openImages() async {
    try {
      pickedfiles = imgpicker.pickMultiImage();
      if (pickedfiles != null) {
        imagefiles = await pickedfiles;
        setState(() {});
      } else {}
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => itemDetails,
      child: BlocListener<HeadphoneBloc, HeadphoneState>(
        listener: (context, state) {
          if (state is DetailsAddSucess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Sucessfully added'),
              ),
            );
            Navigator.pushReplacement(
              context,
              MaterialPageRoute<dynamic>(
                builder: (context) => HeadPhonePage(),
              ),
            );
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text('Add Details'),
            backgroundColor: blulight,
          ),
          body: SafeArea(
            child: Container(
              padding: const EdgeInsets.only(left: 40, right: 40),
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    space10,
                    space10,
                    TextButton(
                      child: Text('Upload Images'),
                      onPressed: openImages,
                    ),
                    FutureBuilder<List<XFile>>(
                      future: pickedfiles,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final images = snapshot.data;
                          return Container(
                            height: 100,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: images!.length,
                              itemBuilder: (context, index) {
                                return Image.file(
                                  File(images[index].path),
                                  fit: BoxFit.cover,
                                  width: 200,
                                  height: 500,
                                );
                              },
                            ),
                          );
                        } else {
                          return const Text('');
                        }
                      },
                    ),
                    space10,
                    CustomTextFieldWidget(
                      hintText: 'HeadPhone Name',
                      controller: headPhoneName,
                    ),
                    space10,
                    CustomTextFieldWidget(
                      controller: headPhoneDescription,
                      hintText: 'Enter headPhone Description',
                    ),
                    space10,
                    CustomTextFieldWidget(
                      controller: headPhonePrice,
                      hintText: 'Enter headPhone Price',
                    ),
                    space10,
                    CustomTextFieldWidget(
                      controller: headPhoneCount,
                      hintText: 'Enter headPhone count',
                    ),
                    space10,
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(
                        height: 50,
                        child: SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: CustomElevatedBtnWidget(
                              btnText: 'Submit',
                              onpressed: () => itemDetails.add(
                                AddDetailsEvent(
                                  image: imagefiles,
                                  name: headPhoneName.text,
                                  description: headPhoneDescription.text,
                                  price: headPhonePrice.text,
                                  count: headPhoneCount.text,
                                ),
                              ),
                              btnColor: blulight,
                              btnTextColor: white,
                            ),
                          ),
                        ),
                      ),
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
