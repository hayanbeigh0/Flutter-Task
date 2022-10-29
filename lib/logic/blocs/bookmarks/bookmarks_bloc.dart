// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:music_app/models/track_list.dart';

import 'package:music_app/repositories/bookmarks_repository.dart';

part 'bookmarks_event.dart';
part 'bookmarks_state.dart';

class BookmarksBloc extends Bloc<BookmarksEvent, BookmarksState> {
  BookmarksRepository bookmarksRepository;
  BookmarksBloc(
    this.bookmarksRepository,
  ) : super(BookmarksLoading()) {
    on<AddToBookmarks>((event, emit) {
      bookmarksRepository.addToBookmarks(event.bookmark);
    });
    on<RemoveFromBookmarksUsingIndex>((event, emit) {
      bookmarksRepository.removeFromBookmarkUsingIndex(event.bookmark);
    });
    on<RemoveFromBookmarksUsingTrackId>((event, emit) {
      bookmarksRepository.removeFromBookmarkUsingTrackId(event.bookmark);
    });
    on<LoadBookmarks>(
      (event, emit) {
        emit(BookmarksLoaded(loadedBookmarks: bookmarksRepository.bookmarks));
      },
    );
  }
}
