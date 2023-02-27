

import 'package:mobilemart/extra/exports/exports.dart';

class CustomeDrawer extends StatelessWidget {
  CustomeDrawer({super.key});

  final users = FirebaseFirestore.instance.collection('Users');
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: StreamBuilder(
        stream: users.doc(auth.currentUser!.uid).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final userData = snapshot.data!;
            return ListView(
              padding: EdgeInsets.zero,
              children: [
                UserAccountsDrawerHeader(
                  accountName:  Text( userData['userName'].toString(),),
                  accountEmail:  Text( userData['email'].toString(),),
                  currentAccountPicture: CircleAvatar(
                    child: GestureDetector(
                      onTap: getImage,
                      child: CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.white,
                          child: (userData['profileImage'] == '')
                              ? Text(
                                  // ignore: avoid_dynamic_calls
                                  userData['userName'][0]
                                      .toString()
                                      .toUpperCase(),
                                  style: GoogleFonts.alegreyaSansSc(
                                    fontSize: 40,
                                    color: Colors.blue,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              : ClipOval(
                                  child: Image.network(
                                    userData['profileImage'].toString(),
                                    fit: BoxFit.cover,
                                    width: 90,
                                    height: 120,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  decoration: const BoxDecoration(color: blulight),
                ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('Home'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('Account'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.shopping_basket),
                  title: const Text('Orders'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.category),
                  title: const Text('Catogories'),
                  onTap: () {},
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Setings'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.help),
                  title: const Text('Help'),
                  onTap: () {},
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('Logout'),
                  onTap: () {
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute<dynamic>(
                                    builder: (context) => LoginScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                'Logout',
                                style: GoogleFonts.aldrich(),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
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

   Future<void> getImage() async {
    // ignore: no_leading_underscores_for_local_identifiers
    final _imagePicker = ImagePicker();

    try {
      final image = await _imagePicker.pickImage(source: ImageSource.gallery);
      await updateProfile(image!);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Future<void> updateProfile(XFile image) async {
    final reference =
        FirebaseStorage.instance.ref().child('ProfileImage').child(image.name);
    final file = File(image.path);
    await reference.putFile(file);
    final imageLink = await reference.getDownloadURL();

    await users.doc(auth.currentUser!.uid).update({'profileImage': imageLink});
    // ignore: avoid_print
    print(imageLink);
  }
}
