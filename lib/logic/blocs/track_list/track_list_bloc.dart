// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:music_app/repositories/track_repository.dart';

import '../../../models/track_list.dart';

part 'track_list_event.dart';
part 'track_list_state.dart';

class TrackListBloc extends Bloc<TrackListEvent, TrackListState> {
  TrackRepository trackRepository;
  TrackListBloc(
    this.trackRepository,
  ) : super(TrackListInitial()) {
    on<FetchTrackList>((event, emit) async {
      try {
        emit(TrackListLoading());
        final trackList = await trackRepository.getTracks();
        emit(TrackListLoaded(trackList));
      } catch (e) {
        emit(TrackListLoadingError(e.toString()));
      }
    });
  }
}
