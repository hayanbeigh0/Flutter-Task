import 'package:music_app/models/track_list.dart';

class BookmarksRepository {
  final List<TrackList> _bookmarkedList = [];
  addToBookmarks(TrackList bookmark) {
    _bookmarkedList.add(bookmark);
  }

  removeFromBookmarkUsingTrackId(TrackList bookmark) {
    _bookmarkedList.removeWhere(
        (element) => element.track.trackId == bookmark.track.trackId);
  }

  removeFromBookmarkUsingIndex(int index) {
    _bookmarkedList.removeAt(index);
  }

  List<TrackList> get bookmarks => _bookmarkedList;
}
