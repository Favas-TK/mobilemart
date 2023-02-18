import 'package:flutter/material.dart';
import 'package:mobilemart/extra/res/colors.dart';
import 'package:mobilemart/items_view/BT_dongle/BT_Dongle.dart';
import 'package:mobilemart/items_view/BT_speaker/BT_Speaker.dart';
import 'package:mobilemart/items_view/Charger/chrger.dart';
import 'package:mobilemart/items_view/HeadPhone/head_phone.dart';
import 'package:mobilemart/items_view/OTG/otg.dart';
import 'package:mobilemart/items_view/Sim_ejecter/sim_ejecter.dart';
import 'package:mobilemart/items_view/USB/usb.dart';
import 'package:mobilemart/items_view/aux_cable/aux_cable.dart';
import 'package:mobilemart/items_view/memory/memory_card.dart';
import 'package:mobilemart/items_view/mobilePhone/mobile_phone.dart';
import 'package:mobilemart/items_view/mouse/mouses.dart';
import 'package:mobilemart/items_view/pouch/pouch.dart';
import 'package:mobilemart/items_view/reader/reader.dart';
import 'package:mobilemart/items_view/remote/remotes.dart';
import 'package:mobilemart/items_view/screenCard/screen_card.dart';
import 'package:mobilemart/view/screen_get_started/widgets/custom_text_widget.dart';
import 'package:mobilemart/view/screen_home/drawer.dart';
import 'package:mobilemart/view/screen_home/widgets/grid_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: blulight,
          title: const CustomTextWidget(
            text: 'HOME',
            color: white,
          ),
        ),
        drawer:  CustomeDrawer(),
        body: GridView(
          scrollDirection: Axis.vertical,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            mainAxisExtent: 330,
            childAspectRatio: 0.75,
          ),
          children: [
            GridData(
              image:
                  'assets/images/phone-removebg-preview.png',
              text: 'Mobile Phones',
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MobilePhonePage(),
                  ),
                );
              },
            ),
            GridData(
              image:
                  'assets/images/—Pngtree—black and red wireless headset_5645014.png',
              text: 'HeadPhones',
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HeadPhonePage(),
                  ),
                );
              },
            ),
            GridData(
              image:
                  'assets/images/pngtree-charger-plug-solid-white-png-image_3976265-removebg-preview.png',
              text: 'Charger',
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChargerPage(),
                  ),
                );
              },
            ),
            GridData(
              image:
                  'assets/images/USBp-removebg-preview.png',
              text: 'USB',
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => USBPage(),
                  ),
                );
              },
            ),
            GridData(
              image:
                  'assets/images/OIP-removebg-preview.png',
              text: 'Memory Card',
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MemoryCardPage(),
                  ),
                );
              },
            ),
            GridData(
              image:
                  'assets/images/baccover-removebg-preview.png',
              text: 'Back Cover',
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PouchPage(),
                  ),
                );
              },
            ),
            GridData(
              image:
                  'assets/images/screencard-removebg-preview.png',
              text: 'Screen Card',
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ScreenCardPage(),
                  ),
                );
              },
            ),
            GridData(
              image:
                  'assets/images/OIP__2_-removebg-preview.png',
              text: 'Reader',
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReaderPage(),
                  ),
                );
              },
            ),
            GridData(
              image:
                  'assets/images/OIP__3_-removebg-preview.png',
              text: 'BT Speaker',
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BTSpeakerPage(),
                  ),
                );
              },
            ),
            GridData(
              image:
                  'assets/images/OIP__4_-removebg-preview.png',
              text: 'BT Dongle',
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BTDonglePage(),
                  ),
                );
              },
            ),
            GridData(
              image:
                  'assets/images/Mouse-removebg-preview.png',
              text: 'Mouse',
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MousePage(),
                  ),
                );
              },
            ),
            GridData(
              image:
                  'assets/images/AUXcable-removebg-preview.png',
              text: 'AUX Cable',
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AuxCablePage(),
                  ),
                );
              },
            ),
            GridData(
              image:
                  'assets/images/simejecter-removebg-preview.png',
              text: 'Sim  Ejecter',
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SimEjecterPage(),
                  ),
                );
              },
            ),
            GridData(
              image:
                  'assets/images/Remote-removebg-preview.png',
              text: 'Remote',
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RemotePage(),
                  ),
                );
              },
            ),
            GridData(
              image:
                  'assets/images/otg-removebg-preview.png',
              text: 'OTG',
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OTGPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
