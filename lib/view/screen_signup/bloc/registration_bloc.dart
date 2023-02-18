import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(RegistrationInitial()) {
    on<RegistrationEvent>((event, emit) async {
      if (event is RegisterEvent) {
        final auth = FirebaseAuth.instance;
        final userRef = FirebaseFirestore.instance.collection('Users');
        try {
          await auth.createUserWithEmailAndPassword(
            email: event.mail,
            password: event.passwrd,
          );
          await userRef.doc(auth.currentUser!.uid).set({
            'userid': auth.currentUser!.uid,
            'userName': event.name,
            'email': event.mail,
            'password': event.passwrd,
            'profileImage' : '',
          });
          emit(SignUpSuccess());
        }on FirebaseAuthException catch (e) {
          emit(SignUpFailed(message: e.code));
        }
      }
    });
  }
}
