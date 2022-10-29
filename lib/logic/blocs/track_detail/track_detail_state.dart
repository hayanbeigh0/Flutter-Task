part of 'track_detail_bloc.dart';

abstract class TrackDetailState extends Equatable {
  const TrackDetailState();
}

class TrackDetailInitial extends TrackDetailState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class TrackDetailLoading extends TrackDetailState {
  @override
  List<Object?> get props => [];
}

class TrackDetailLoaded extends TrackDetailState {
  final TrackDetails trackDetails;

  const TrackDetailLoaded(this.trackDetails);
  @override
  List<Object?> get props => [trackDetails];
}

class TrackDetailLoadingError extends TrackDetailState {
  final String errorMessage;

  const TrackDetailLoadingError(this.errorMessage);
  @override
  List<Object?> get props => [];
}
