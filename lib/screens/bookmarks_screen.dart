import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/logic/blocs/bookmarks/bookmarks_bloc.dart';
import 'package:music_app/repositories/bookmarks_repository.dart';
import 'package:music_app/screens/track_detail_screen.dart';

class BookmarksScreen extends StatefulWidget {
  const BookmarksScreen({super.key});

  @override
  State<BookmarksScreen> createState() => _BookmarksScreenState();
}

class _BookmarksScreenState extends State<BookmarksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bookmarks')),
      body: SafeArea(
        child: BlocBuilder<BookmarksBloc, BookmarksState>(
          builder: (context, state) {
            if (state is BookmarksLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is BookmarksLoaded) {
              var list = state.loadedBookmarks;
              // var list = state.trackLists.message.body.trackList
              //     .where((element) => element.track.bookmarked == true)
              //     .toList();
              if (list.isEmpty) {
                return const Center(
                  child: Text('No bookmarks yet❗️'),
                );
              }
              return ListView.builder(
                padding: const EdgeInsets.all(10.0),
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () async {
                      await Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => TrackDetailScreen(
                            fromBookmarkList: true,
                            trackId: state.loadedBookmarks[index].track.trackId
                                .toString(),
                            state: state,
                            index: index,
                          ),
                        ),
                      );
                      BlocProvider.of<BookmarksBloc>(context)
                          .add(LoadBookmarks(BookmarksRepository().bookmarks));
                      setState(() {});
                      print(state.loadedBookmarks.length);
                    },
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: ListTile(
                        title: Text(
                          state.loadedBookmarks[index].track.trackName,
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
