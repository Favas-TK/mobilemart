
import 'package:mobilemart/extra/exports/exports.dart';

class AddAuxCable extends StatefulWidget {
  const AddAuxCable({super.key});

  @override
  State<AddAuxCable> createState() => _AddAuxCableState();
}

class _AddAuxCableState extends State<AddAuxCable> {
  late final XFile? image;

  final itemAdd = FirebaseFirestore.instance.collection('Aux_cable_Collection');

  final auth = FirebaseAuth.instance;

  final itemDetails = InformationAddBloc();

  TextEditingController auxName = TextEditingController();

  TextEditingController auxPrice = TextEditingController();

  TextEditingController auxDescription = TextEditingController();

  TextEditingController auxCount = TextEditingController();

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
      child: BlocListener<InformationAddBloc, InformationAddState>(
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
                builder: (context) => AuxCablePage(),
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
                      hintText: 'Aux Cable Name',
                      controller: auxName,
                    ),
                    space10,
                    CustomTextFieldWidget(
                      controller: auxDescription,
                      hintText: 'Enter Aux Cable Description',
                    ),
                    space10,
                    CustomTextFieldWidget(
                      controller: auxPrice,
                      hintText: 'Enter Aux Cable Price',
                    ),
                    space10,
                    CustomTextFieldWidget(
                      controller: auxCount,
                      hintText: 'Enter Aux Cable count',
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
                                AuxAddDetailEvent(
                                  image: imagefiles,
                                  name: auxName.text,
                                  description: auxDescription.text,
                                  price: auxPrice.text,
                                  count: auxCount.text,
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
