part of 'internet_bloc.dart';

abstract class InternetEvent extends Equatable {
  const InternetEvent();

  @override
  List<Object> get props => [];
}

class InternetConnectedEvent extends InternetEvent {}

class InternetDisconnectedEvent extends InternetEvent {}

class CheckInternetEvent extends InternetEvent {}
