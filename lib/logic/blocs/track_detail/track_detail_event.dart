part of 'track_detail_bloc.dart';

abstract class TrackDetailEvent extends Equatable {
  const TrackDetailEvent();
}

class FetchTrackDetail extends TrackDetailEvent {
  final String trackId;

  const FetchTrackDetail(this.trackId);
  @override
  List<Object?> get props => [];
}
