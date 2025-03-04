import 'dart:async';
import 'dart:developer';

import 'package:shop_app/shared/cores/utils/parallel_tool.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<ShowPasswordEvent>(
      (event, emit) => _onShowPassword(event, emit),
    );
    on<CheckTermsEvent>(
      (event, emit) => _onCheckTerms(event, emit),
    );
    on<RegisterEvent>(
      (event, emit) => _onRegisterEvent(event, emit),
    );
    on<LoginEvent>(
      (event, emit) => _onLoginEvent(event, emit),
    );
  }

  bool showPassword = true;
  bool checkTerms = false;
  var formKey = GlobalKey<FormState>();
  late UserCredential userCredential;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  late User? user;

  FutureOr<void> _onShowPassword(
      ShowPasswordEvent event, Emitter<AuthState> emit) {
    emit(ShowPasswordLoading());
    showPassword = !showPassword;
    emit(ShowPasswordSuccessfully());
  }

  FutureOr<void> _onCheckTerms(CheckTermsEvent event, Emitter<AuthState> emit) {
    emit(CheckTermsLoading());
    checkTerms = !checkTerms;
    emit(CheckTermsSuccessfully());
  }

  FutureOr<void> _onRegisterEvent(
      RegisterEvent event, Emitter<AuthState> emit) async {
    emit(RegisterLoading());
    try {
      userCredential = await firebaseAuth.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      user = userCredential.user;
      if (user != null) {
        emit(SaveDataLoading());
        await fireStore.collection('users').doc(user!.uid).set({
          'id': user!.uid,
          // Unique ID of the user
          'email': emailController.text,
          'fullName': nameController.text,
          'phoneNumber': phoneNumberController.text,
          'createdAt': FieldValue.serverTimestamp(),
          // Timestamp of registration
        });
      }
      emit(RegisterSuccessfully());
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'An error occurred';
      if (e.code == 'weak-password') {
        errorMessage = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'The account already exists for that email.';
      } else {
        errorMessage = e.message!;
      }
      log('Register by -------${userCredential.user!.email}------- was Fail because $errorMessage ');
      emit(RegisterFail());
    }
  }

  FutureOr<void> _onLoginEvent(
      LoginEvent event, Emitter<AuthState> emit) async {
    emit(LoginLoading());
    try {
      userCredential = await firebaseAuth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      emit(LoginSuccessfully());
    } on FirebaseAuthException catch (e) {
      // Handle errors
      String? errorMessage = 'An error occurred. Please try again.';
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided for that user.';
      } else {
        errorMessage = e.message;
      }
      log('Login by -------${userCredential.user!.email}------- was Fail because $errorMessage ');
      emit(LoginFail());
    }
  }
}
