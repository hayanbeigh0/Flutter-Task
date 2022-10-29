// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'track_lyrics_bloc.dart';

abstract class TrackLyricsState extends Equatable {
  const TrackLyricsState();
}

class TrackLyricsInitial extends TrackLyricsState {
  @override
  List<Object?> get props => [];
}

class TrackLyricsLoadingError extends TrackLyricsState {
  final String errorMessage;

  const TrackLyricsLoadingError(this.errorMessage);
  @override
  List<Object?> get props => [];
}

class TrackLyricsLoading extends TrackLyricsState {
  @override
  List<Object?> get props => [];
}

class TrackLyricsLoaded extends TrackLyricsState {
  final TrackLyrics trackLyrics;
  const TrackLyricsLoaded({
    required this.trackLyrics,
  });
  @override
  List<Object?> get props => [trackLyrics];
}
