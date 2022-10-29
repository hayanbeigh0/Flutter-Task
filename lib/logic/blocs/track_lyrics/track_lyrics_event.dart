part of 'track_lyrics_bloc.dart';

abstract class TrackLyricsEvent extends Equatable {
  const TrackLyricsEvent();
}

class FetchTrackLyrics extends TrackLyricsEvent {
  final String trackId;

  const FetchTrackLyrics(this.trackId);
  @override
  List<Object?> get props => [];
}
