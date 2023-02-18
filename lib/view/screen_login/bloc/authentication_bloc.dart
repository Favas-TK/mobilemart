import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';


part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<AuthenticationEvent>((event, emit) async {
      if (event is LoginEvent) {
        final auth = FirebaseAuth.instance;
        try {
          await auth.signInWithEmailAndPassword(
            email: event.mail,
            password: event.password,
          );
          //   await SharedPref().setUserData(
          //   event.mail,
          //   auth.currentUser!.uid,
          // );

          emit(LoginSuccess());
        } on FirebaseAuthException catch (e) {
          emit(loginFailed(message: e.code));
        }
      }
    });
  }
}
