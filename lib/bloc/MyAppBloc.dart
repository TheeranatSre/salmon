import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:salmon/models/CounterModel.dart';
import 'package:salmon/models/MenuResponse.dart';

part 'MyAppEvent.dart';
part 'MyAppState.dart';

class MyAppBloc extends Bloc<MyAppEvent, MyAppState> {
  MyAppBloc() : super(MyAppInitial()) {
    on<MyAppEvent>(_onGetMenus);
  }

  void _onGetMenus(MyAppEvent event, Emitter<MyAppState> emit) async {
    emit(StateLoading());
    List<MenuResponse> menus = [];
    try {
      await FirebaseFirestore.instance
          .collection("menu")
          .get()
          .then((QuerySnapshot querySnapshot) {
        for (var doc in querySnapshot.docs) {
          final menu = MenuResponse(
            name: doc["name"],
            detail: doc["detail"],
            image: doc["image"],
          );
          menus.add(menu);
        }
      });
      emit(StateGetMenuStateSuccess(menus: menus));
    } catch (e) {
      emit(StateError(message: e.toString()));
    }
  }
}
