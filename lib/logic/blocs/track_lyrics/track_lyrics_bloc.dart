import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:music_app/models/track_lyrics.dart';
import 'package:music_app/repositories/track_repository.dart';

part 'track_lyrics_event.dart';
part 'track_lyrics_state.dart';

class TrackLyricsBloc extends Bloc<TrackLyricsEvent, TrackLyricsState> {
  TrackRepository trackRepository;
  TrackLyricsBloc({required this.trackRepository})
      : super(TrackLyricsInitial()) {
    on<FetchTrackLyrics>((event, emit) async {
      try {
        emit(TrackLyricsLoading());
        final trackLyrics = await trackRepository.getTrackLyrics(event.trackId);
        emit(TrackLyricsLoaded(trackLyrics: trackLyrics));
      } catch (e) {
        emit(TrackLyricsLoadingError(e.toString()));
      }
    });
  }
}
