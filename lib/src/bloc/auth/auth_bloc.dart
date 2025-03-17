import 'dart:async';
import 'dart:developer';

import 'package:shop_app/shared/cores/utils/parallel_tool.dart';
import 'package:shop_app/src/bloc/home/home_bloc.dart';

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
    on<LogOutEvent>(
      (event, emit) => _onLogOut(event, emit),
    );
    on<VerificationEvent>(
      (event, emit) => _onVerificationEvent(event, emit, user!),
    );
  }

  bool showPassword = true;
  bool checkTerms = false;
  var formKey = GlobalKey<FormState>();
   UserCredential ?userCredential;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController workController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  late User? user;
  HomeBloc? homeBloc;

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
      user = userCredential!.user;
      if (user != null) {
        emit(SaveDataLoading());
        await fireStore.collection('User').doc(user!.uid).set({
          'id': user!.uid,
          // Unique ID of the user
          'email': emailController.text,
          'name': nameController.text,
          'phoneNumber': phoneNumberController.text,
          'createdAt': FieldValue.serverTimestamp(),
          'work':workController.text
          // Timestamp of registration
        });
      }
      emit(RegisterSuccessfully());
      _onVerificationEvent(VerificationEvent(), emit, user!);
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'An error occurred';
      if (e.code == 'weak-password') {
        errorMessage = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'The account already exists for that email.';
      } else {
        errorMessage = e.message!;
      }
      emit(RegisterFail(message: errorMessage.toString()));
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
      emit(LoginFail(message: errorMessage.toString()));
    }
  }

  FutureOr<void> _onLogOut(LogOutEvent event, Emitter<AuthState> emit) async {
    emit(LogOutLoading());
    try {
      await firebaseAuth.signOut();

      emit(LogOutSuccessfully());
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
      emit(LogOutFail(message: errorMessage.toString()));
    }
  }

  FutureOr<void> _onVerificationEvent(
      VerificationEvent event, Emitter<AuthState> emit, User user) async {
    emit(EmailVerificationLoading());
    try {
      user = FirebaseAuth.instance.currentUser!;

      if (!user.emailVerified) {
        await user.sendEmailVerification();
        log("Email verification link sent to ${user.email}");
      } else {
        log("User is already verified or no user is logged in.");
      }
      emit(EmailVerificationSuccessfully());
    } catch (e) {
      log("Error sending email verification: $e");
      emit(EmailVerificationFail(message: e.toString()));
    }
  }
}
