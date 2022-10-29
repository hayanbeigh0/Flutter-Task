import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/logic/blocs/bookmarks/bookmarks_bloc.dart';
import 'package:music_app/models/track_list.dart';
import 'package:music_app/screens/track_detail_screen.dart';

import '../logic/blocs/track_list/track_list_bloc.dart';
import '../widgets/list_item.dart';

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
        child: BlocBuilder<TrackListBloc, TrackListState>(
          builder: (context, state) {
            if (state is TrackListLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is TrackListLoaded) {
              var list = BlocProvider.of<BookmarksBloc>(context)
                  .bookmarksRepository
                  .bookmarks;
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
                            trackId: state.trackLists.message.body.trackList
                                .firstWhere((element) =>
                                    element.track.trackId ==
                                    list[index].track.trackId)
                                .track
                                .trackId
                                .toString(),
                            state: state,
                            index: state.trackLists.message.body.trackList
                                .indexWhere((element) =>
                                    element.track.trackId ==
                                    list[index].track.trackId),
                          ),
                        ),
                      );
                      setState(() {});
                    },
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: ListTile(
                        title: Text(
                          state.trackLists.message.body.trackList[index].track
                              .trackName,
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
