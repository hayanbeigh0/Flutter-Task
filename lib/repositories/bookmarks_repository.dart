import 'package:music_app/models/track_list.dart';

class BookmarksRepository {
  final List<TrackList> _bookmarkedList = [];
  addToBookmarks(TrackList bookmark) {
    _bookmarkedList.add(bookmark);
  }

  removeFromBookmark(TrackList bookmark) {
    _bookmarkedList.remove(bookmark);
  }

  List<TrackList> get bookmarks => _bookmarkedList;
}
