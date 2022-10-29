part of 'bookmarks_bloc.dart';

abstract class BookmarksEvent extends Equatable {}

class AddToBookmarks extends BookmarksEvent {
  final TrackList bookmark;

  AddToBookmarks(this.bookmark);

  @override
  List<Object?> get props => [bookmark];
}

class RemoveFromBookmarksUsingIndex extends BookmarksEvent {
  final int bookmark;

  RemoveFromBookmarksUsingIndex(this.bookmark);

  @override
  List<Object?> get props => [bookmark];
}

class RemoveFromBookmarksUsingTrackId extends BookmarksEvent {
  final TrackList bookmark;

  RemoveFromBookmarksUsingTrackId(this.bookmark);

  @override
  List<Object?> get props => [bookmark];
}

class LoadBookmarks extends BookmarksEvent {
  final List<TrackList> bookmarkList;

  LoadBookmarks(this.bookmarkList);

  @override
  List<Object?> get props => [bookmarkList];
}
