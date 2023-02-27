import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

part 'headphone_event.dart';
part 'headphone_state.dart';

class HeadphoneBloc extends Bloc<HeadphoneEvent, HeadphoneState> {
  HeadphoneBloc() : super(HeadphoneInitial()) {
    on<HeadphoneEvent>((event, emit) async {
      if (event is AddDetailsEvent) {
        try {
          final auth = FirebaseAuth.instance;
          final headphoneAdd =
              FirebaseFirestore.instance.collection('HeadPhone_Collection');

          final userId = auth.currentUser!.uid;

          const uuid = Uuid();
          final headphoneID = uuid.v4();
          final images = event.image;
          final imageList = [];
          for (final image in images!) {
            final reference = FirebaseStorage.instance
                .ref()
                .child('image')
                .child(image!.path);
            final file = File(image.path);
            await reference.putFile(file);
            final imagelink = await reference.getDownloadURL();
            imageList.add(imagelink);
          }

          await headphoneAdd.doc(auth.currentUser!.uid).set({
            'Name': event.name,
            'Description': event.description,
            'Price': event.price,
            'Count': event.count,
            'image': imageList,
            'user_id': userId,
          });
          emit(DetailsAddSucess());
        } catch (e) {
          emit(DetailsAddFiled());
        }
      }
    });
  }
}
