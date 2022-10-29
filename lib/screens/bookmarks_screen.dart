import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/logic/blocs/bookmarks/bookmarks_bloc.dart';
import 'package:music_app/repositories/bookmarks_repository.dart';
import 'package:music_app/screens/track_detail_screen.dart';

import '../logic/blocs/internet_bloc/internet_bloc.dart';

class BookmarksScreen extends StatefulWidget {
  const BookmarksScreen({super.key});

  @override
  State<BookmarksScreen> createState() => _BookmarksScreenState();
}

class _BookmarksScreenState extends State<BookmarksScreen> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<InternetBloc>(context).add(CheckInternetEvent());
    return Scaffold(
      appBar: AppBar(title: const Text('Bookmarks')),
      body: SafeArea(
        child: BlocConsumer<InternetBloc, InternetState>(
          listener: (context, state) {
            if (state is InternetDisconnected) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('No Internet Connection!')));
            }
            // if (state is InternetConnected) {
            //   ScaffoldMessenger.of(context).showSnackBar(
            //       const SnackBar(content: Text('Internet Connected!')));
            // }
          },
          builder: (context, state) {
            if (state is InternetDisconnected) {
              return const Center(
                child: Text('No Internet Connection!'),
              );
            }
            if (state is InternetConnected) {
              return BlocBuilder<BookmarksBloc, BookmarksState>(
                builder: (context, state) {
                  if (state is BookmarksLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is BookmarksLoaded) {
                    var list = state.loadedBookmarks;
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
                                  trackId: state
                                      .loadedBookmarks[index].track.trackId
                                      .toString(),
                                  state: state,
                                  index: index,
                                ),
                              ),
                            );
                            BlocProvider.of<BookmarksBloc>(context).add(
                                LoadBookmarks(BookmarksRepository().bookmarks));
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
              );
            }
            return const Center(
              child: Text('No Inernet Connection!'),
            );
          },
        ),
      ),
    );
  }
}
