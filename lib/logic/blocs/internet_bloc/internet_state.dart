// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'internet_bloc.dart';

abstract class InternetState extends Equatable {
  const InternetState();

  @override
  List<Object> get props => [];
}

class InternetInitial extends InternetState {}

class InternetConnected extends InternetState {
  final String msg;
  const InternetConnected({
    required this.msg,
  });
}

class InternetDisconnected extends InternetState {
  final String msg;
  const InternetDisconnected({
    required this.msg,
  });
}
