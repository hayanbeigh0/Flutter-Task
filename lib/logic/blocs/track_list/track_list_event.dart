part of 'track_list_bloc.dart';

@immutable
abstract class TrackListEvent extends Equatable {}

class FetchTrackList extends TrackListEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}
