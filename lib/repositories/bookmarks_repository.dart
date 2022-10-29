import 'package:music_app/models/track_list.dart';

class BookmarksRepository {
  final List<int> _bookmarkedList = [];
  addToBookmarks(int bookmark) {
    _bookmarkedList.add(bookmark);
  }

  removeFromBookmark(int bookmark) {
    _bookmarkedList.remove(bookmark);
  }

  List<int> get bookmarks => _bookmarkedList;
}
