// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'bookmarks_bloc.dart';

abstract class BookmarksState extends Equatable {
  const BookmarksState();
}

class BookmarksLoading extends BookmarksState {
  @override
  List<Object?> get props => [];
}

class BookmarksLoaded extends BookmarksState {
  final List<int> loadedBookmarks;
  const BookmarksLoaded({
    required this.loadedBookmarks,
  });

  @override
  List<Object?> get props => [loadedBookmarks];
}
