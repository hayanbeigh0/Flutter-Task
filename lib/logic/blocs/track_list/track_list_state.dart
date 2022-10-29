part of 'track_list_bloc.dart';

@immutable
abstract class TrackListState extends Equatable {}

class TrackListInitial extends TrackListState {
  @override
  List<Object?> get props => [];
}

class TrackListLoading extends TrackListState {
  @override
  List<Object?> get props => [];
}

class TrackListLoadingError extends TrackListState {
  final String errorMessage;

  TrackListLoadingError(this.errorMessage);
  @override
  List<Object?> get props => [];
}

class TrackListLoaded extends TrackListState {
  final TrackLists trackLists;

  TrackListLoaded(this.trackLists);
  @override
  List<Object?> get props => [trackLists];
}
