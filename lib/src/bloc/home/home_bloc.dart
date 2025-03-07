import 'dart:async';
import 'dart:developer';

import 'package:shop_app/shared/cores/utils/parallel_tool.dart';
import 'package:shop_app/shared/models/user_model.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<GetDataEvent>(
      (event, emit) => _onGetData(event, emit),
    );
  }

  UserModel? userModel;
  String?uid;

  FutureOr<void> _onGetData(GetDataEvent event, Emitter<HomeState> emit) async {
    emit(GeTDataLoading());
    try {
      uid=event.uid;
      // Step 3: Fetch the user's data from Firestore
      DocumentSnapshot<Map<String, dynamic>> userDoc =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(event.uid) // Use the UID as the document ID
              .get();

      if (userDoc.exists) {
        // Step 4: Access the data
        Map<String, dynamic> userData = userDoc.data()!;
        userModel = UserModel.fromFireStore(userData);
      }
      emit(GeTDataSuccessfully());
    } catch (e) {
      log('Error fetching FireStore data: $e');
      emit(GeTDataFail());
    }
  }
}
