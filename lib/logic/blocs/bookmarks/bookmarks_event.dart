part of 'bookmarks_bloc.dart';

abstract class BookmarksEvent extends Equatable {}

class AddToBookmarks extends BookmarksEvent {
  final TrackList bookmark;

  AddToBookmarks(this.bookmark);

  @override
  List<Object?> get props => [bookmark];
}

class RemoveFromBookmarks extends BookmarksEvent {
  final TrackList bookmark;

  RemoveFromBookmarks(this.bookmark);

  @override
  List<Object?> get props => [bookmark];
}

class LoadBookmarks extends BookmarksEvent {
  final List<TrackList> bookmarkList;

  LoadBookmarks(this.bookmarkList);

  @override
  List<Object?> get props => [bookmarkList];
}
