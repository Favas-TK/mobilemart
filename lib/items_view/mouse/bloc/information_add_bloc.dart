import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

part 'information_add_event.dart';
part 'information_add_state.dart';

class InformationAddBloc
    extends Bloc<InformationAddEvent, InformationAddState> {
  InformationAddBloc() : super(InformationAddInitial()) {
    on<InformationAddEvent>((event, emit) async {
      if (event is MouseAddDetailEvent) {
        try {
          final auth = FirebaseAuth.instance;
          final mouseAdd =
              FirebaseFirestore.instance.collection('Mouse_Collection');

          final userId = auth.currentUser!.uid;

          const uuid = Uuid();
          final mouseId = uuid.v4();
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

          await mouseAdd.doc(mouseId).set({
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
