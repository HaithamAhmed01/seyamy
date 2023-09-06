part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeAddNum extends HomeState {}

class HomeLoadNum extends HomeState {}

class HomeDecreaseNum extends HomeState {}

class HomeSelectNum extends HomeState {}

class HomeDisabledNotification extends HomeState {}

class HomeEnabledNotification extends HomeState {}
