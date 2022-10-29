import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/logic/blocs/bookmarks/bookmarks_bloc.dart';
import 'package:music_app/models/track_list.dart';
import 'package:music_app/repositories/bookmarks_repository.dart';

import '../logic/blocs/track_detail/track_detail_bloc.dart';
import '../logic/blocs/track_list/track_list_bloc.dart';
import '../logic/blocs/track_lyrics/track_lyrics_bloc.dart';

class TrackDetailScreen extends StatefulWidget {
  const TrackDetailScreen({
    super.key,
    required this.trackId,
    required this.state,
    required this.index,
  });
  final String trackId;
  final TrackListState state;
  final int index;

  @override
  State<TrackDetailScreen> createState() => _TrackDetailScreenState();
}

class _TrackDetailScreenState extends State<TrackDetailScreen> {
  List<TrackList> bookmarkedList = [];
  @override
  Widget build(BuildContext context) {
    var bookmarkBloc = BlocProvider.of<BookmarksBloc>(context);
    BlocProvider.of<TrackDetailBloc>(context)
        .add(FetchTrackDetail(widget.trackId));
    return Scaffold(
      body: BlocBuilder<TrackDetailBloc, TrackDetailState>(
        builder: (context, state) {
          if (state is TrackDetailLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is TrackDetailLoadingError) {
            return Center(
              child: Text(
                state.errorMessage.toString(),
              ),
            );
          }
          if (state is TrackDetailLoaded) {
            bool bookmarked = false;
            BlocProvider.of<TrackLyricsBloc>(context)
                .add(FetchTrackLyrics(widget.trackId));
            return SafeArea(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Card(
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(state.trackDetails.message.body.track
                                      .trackName),
                                  Text(state.trackDetails.message.body.track
                                      .artistName),
                                ],
                              ),
                            ),
                            BlocConsumer<BookmarksBloc, BookmarksState>(
                              listener: (context, bookmarkState) {
                                if (bookmarkState is BookmarksLoaded) {
                                  if (bookmarkState.loadedBookmarks.every((e) =>
                                      e ==
                                      state.trackDetails.message.body.track
                                          .trackId)) {
                                    bookmarked = true;
                                  } else {
                                    bookmarked = false;
                                  }
                                }
                              },
                              builder: (context, bookmarkState) {
                                return IconButton(
                                  icon: Icon(
                                    bookmarked
                                        ? Icons.star
                                        : Icons.star_outline,
                                    color:
                                        bookmarked ? Colors.red : Colors.grey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      if (bookmarkState is BookmarksLoaded) {
                                        if (bookmarkState.loadedBookmarks.every(
                                            (e) =>
                                                e ==
                                                state.trackDetails.message.body
                                                    .track.trackId)) {
                                          bookmarkBloc.add(RemoveFromBookmarks(
                                              state.trackDetails.message.body
                                                  .track.trackId));
                                        } else {
                                          bookmarkBloc.add(AddToBookmarks(state
                                              .trackDetails
                                              .message
                                              .body
                                              .track
                                              .trackId));
                                        }
                                      }
                                    });
                                  },
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    BlocBuilder<TrackLyricsBloc, TrackLyricsState>(
                      builder: (context, state) {
                        if (state is TrackLyricsLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (state is TrackLyricsLoadingError) {
                          return Center(
                            child: Text(
                              state.errorMessage.toString(),
                            ),
                          );
                        }
                        if (state is TrackLyricsLoaded) {
                          return SizedBox(
                            width: double.infinity,
                            child: Card(
                              child: Text(
                                state
                                    .trackLyrics.message.body.lyrics.lyricsBody,
                              ),
                            ),
                          );
                        }
                        return const SizedBox();
                      },
                    )
                  ],
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
// BlocBuilder<TrackListBloc, TrackListState>(
//                               builder: (context, state) {
//                                 if (state is TrackListLoaded) {
//                                   bool bookmarked = false;
//                                   return IconButton(
//                                     icon: Icon(
//                                       state
//                                               .trackLists
//                                               .message
//                                               .body
//                                               .trackList[widget.index]
//                                               .track
//                                               .bookmarked
//                                           ? Icons.star
//                                           : Icons.star_outline,
//                                       color: state
//                                               .trackLists
//                                               .message
//                                               .body
//                                               .trackList[widget.index]
//                                               .track
//                                               .bookmarked
//                                           ? Colors.red
//                                           : Colors.grey,
//                                     ),
//                                     onPressed: () {
//                                       setState(
//                                         () {
//                                           state
//                                                   .trackLists
//                                                   .message
//                                                   .body
//                                                   .trackList[widget.index]
//                                                   .track
//                                                   .bookmarked =
//                                               !state
//                                                   .trackLists
//                                                   .message
//                                                   .body
//                                                   .trackList[widget.index]
//                                                   .track
//                                                   .bookmarked;
//                                           if (state
//                                               .trackLists
//                                               .message
//                                               .body
//                                               .trackList[widget.index]
//                                               .track
//                                               .bookmarked) {
//                                             BlocProvider.of<BookmarksBloc>(
//                                                     context)
//                                                 .bookmarksRepository
//                                                 .addToBookmarks(
//                                                   state.trackLists.message.body
//                                                       .trackList[widget.index],
//                                                 );
//                                           } else {
//                                             BlocProvider.of<BookmarksBloc>(
//                                                     context)
//                                                 .bookmarksRepository
//                                                 .removeFromBookmark(
//                                                   state.trackLists.message.body
//                                                       .trackList[widget.index],
//                                                 );
//                                           }
//                                         },
//                                       );
//                                       // print(BlocProvider.of<BookmarksBloc>(
//                                       //         context)
//                                       //     .bookmarksRepository
//                                       //     .bookmarks
//                                       //     .length);
//                                     },
//                                   );
//                                 }
//                                 return IconButton(
//                                   icon: const Icon(Icons.star_outline),
//                                   onPressed: () {
//                                     setState(
//                                       () {},
//                                     );
//                                   },
//                                 );
//                               },
//                             ),