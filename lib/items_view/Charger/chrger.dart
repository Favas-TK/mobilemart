import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobilemart/extra/res/colors.dart';
import 'package:mobilemart/extra/res/const_widget.dart';
import 'package:mobilemart/items_view/Charger/add_charger.dart';
import 'package:mobilemart/items_view/Charger/detail_screen.dart';
import 'package:mobilemart/items_view/cable/add_cable.dart';
import 'package:mobilemart/items_view/mobilePhone/addmobile.dart';


class ChargerPage extends StatelessWidget {
  ChargerPage({super.key});

  final itemadd =
      FirebaseFirestore.instance.collection('Charger_Collection');
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chargers'),
        backgroundColor: blulight,
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: blulight,
        foregroundColor: black,
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const AddCharger(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot<Object?>>(
        stream: itemadd
            .where('user_id', isEqualTo: auth.currentUser!.uid)
            .snapshots(),
        builder: (
          BuildContext context,
          AsyncSnapshot<QuerySnapshot<Object?>> snapshot,
        ) {
          if (snapshot.hasData) {
            final itemhome = snapshot.data!.docs;
            return SingleChildScrollView(
              child: GridView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  mainAxisExtent: 330,
                  childAspectRatio: 0.75,
                ),
                itemCount: itemhome.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<dynamic>(
                          builder: (context) =>
                              ChargerDetailScreen(itemAxis: itemhome[index]),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        margin: const EdgeInsets.only(top: 18, bottom: 30),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 5,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            space10,
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Image.network(
                                itemhome[index]['image'][0].toString(),
                                height: 100,
                                width: 200,
                              ),
                            ),
                            space10,
                            Text(
                              itemhome[index]['Name'].toString(),
                              style: GoogleFonts.actor(fontSize: 17),
                            ),
                            space10,
                            Text(
                              itemhome[index]['Description'].toString(),
                              style: GoogleFonts.andadaPro(),
                            ),
                            space10,
                             Text(
                              itemhome[index]['Price'].toString(),
                              style: GoogleFonts.andadaPro(),
                            ),
                             Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.edit),
                                ),
                                IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text(
                                            'Alert!!',
                                            style: GoogleFonts.acme(),
                                          ),
                                          content: Text(
                                            'Are you sure!!!!!',
                                            style: GoogleFonts.abhayaLibre(
                                              fontSize: 19,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                'Cancel',
                                                style: GoogleFonts.aldrich(),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                deleteData(itemhome[index]
                                                        ['user_id']
                                                    .toString());
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                'Delete',
                                                style: GoogleFonts.aldrich(),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  icon: const Icon(Icons.delete),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
   Future<void> deleteData(String id) async {
    final itemadd =
        FirebaseFirestore.instance.collection('Charger_Collection');
    try {
      await itemadd.doc(id).delete();
    } catch (e) {}
  }
}
