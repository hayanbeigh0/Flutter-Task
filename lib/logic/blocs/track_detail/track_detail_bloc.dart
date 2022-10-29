import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:music_app/repositories/track_repository.dart';

import '../../../models/track_details.dart';

part 'track_detail_event.dart';
part 'track_detail_state.dart';

class TrackDetailBloc extends Bloc<TrackDetailEvent, TrackDetailState> {
  // String trackId;
  TrackRepository trackRepository;
  TrackDetailBloc({
    required this.trackRepository,
  }) : super(TrackDetailInitial()) {
    on<FetchTrackDetail>((event, emit) async {
      try {
        emit(TrackDetailLoading());
        final trackDetails =
            await trackRepository.getTrackDetail(event.trackId);
        emit(TrackDetailLoaded(trackDetails));
      } catch (e) {
        emit(TrackDetailLoadingError(e.toString()));
      }
    });
  }
}
