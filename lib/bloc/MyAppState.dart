part of 'MyAppBloc.dart';

@immutable
abstract class MyAppState {}

class MyAppInitial extends MyAppState {}

class StateLoading extends MyAppState {}

class StateError extends MyAppState {
  final String message;
  StateError({required this.message});

  @override
  String toString() => message;
}

class StateGetMenuStateSuccess extends MyAppState {
  List<MenuResponse> menus = [];
  StateGetMenuStateSuccess({required this.menus});
}
