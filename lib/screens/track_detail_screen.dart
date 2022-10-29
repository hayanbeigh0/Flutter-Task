import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../logic/blocs/internet_bloc/internet_bloc.dart';
import '/logic/blocs/bookmarks/bookmarks_bloc.dart';
import '/repositories/bookmarks_repository.dart';
import '/utils/app_colors.dart';

import '../logic/blocs/track_detail/track_detail_bloc.dart';
import '../logic/blocs/track_list/track_list_bloc.dart';
import '../logic/blocs/track_lyrics/track_lyrics_bloc.dart';

class TrackDetailScreen extends StatefulWidget {
  const TrackDetailScreen({
    super.key,
    required this.trackId,
    required this.state,
    required this.index,
    required this.fromBookmarkList,
  });
  final String trackId;
  final state;
  final int index;
  final bool fromBookmarkList;

  @override
  State<TrackDetailScreen> createState() => _TrackDetailScreenState();
}

class _TrackDetailScreenState extends State<TrackDetailScreen> {
  bool hasLyrics = true;
  double titleWidth = 65;
  late TrackListLoaded trackState;
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<InternetBloc>(context).add(CheckInternetEvent());
    BlocProvider.of<TrackDetailBloc>(context)
        .add(FetchTrackDetail(widget.trackId));
    BlocProvider.of<BookmarksBloc>(context)
        .add(LoadBookmarks(BookmarksRepository().bookmarks));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Track Details'),
      ),
      body: BlocConsumer<InternetBloc, InternetState>(
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
            return BlocBuilder<TrackDetailBloc, TrackDetailState>(
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
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Card(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            state.trackDetails.message.body
                                                .track.trackName,
                                            style: const TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.textColor,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: titleWidth,
                                                child: const Text(
                                                  'Artist:',
                                                  style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors.textColor,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                state.trackDetails.message.body
                                                    .track.artistName,
                                                style: const TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.textColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: titleWidth,
                                                child: const Text(
                                                  'Album:',
                                                  style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors.textColor,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  state.trackDetails.message
                                                      .body.track.albumName,
                                                  style: const TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w400,
                                                    color: AppColors.textColor,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: titleWidth,
                                                child: const Text(
                                                  'Rating:',
                                                  style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors.textColor,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  state.trackDetails.message
                                                      .body.track.trackRating
                                                      .toString(),
                                                  style: const TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w400,
                                                    color: AppColors.textColor,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: titleWidth,
                                                child: const Text(
                                                  'Track Id:',
                                                  style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors.textColor,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  state.trackDetails.message
                                                      .body.track.trackId
                                                      .toString(),
                                                  style: const TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w400,
                                                    color: AppColors.textColor,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  BlocBuilder<TrackListBloc, TrackListState>(
                                    builder: (context, trackListState) {
                                      BlocProvider.of<BookmarksBloc>(context)
                                          .add(LoadBookmarks(
                                              BookmarksRepository().bookmarks));
                                      if (trackListState is TrackListLoaded) {
                                        trackState = trackListState;
                                        return BlocConsumer<BookmarksBloc,
                                            BookmarksState>(
                                          listener: (context, bookmarkState) {},
                                          builder: (context, bookmarkState) {
                                            if (bookmarkState
                                                is BookmarksLoaded) {
                                              if (bookmarkState.loadedBookmarks
                                                      .isNotEmpty &&
                                                  bookmarkState.loadedBookmarks
                                                      .any((element) =>
                                                          element
                                                              .track.trackId ==
                                                          state
                                                              .trackDetails
                                                              .message
                                                              .body
                                                              .track
                                                              .trackId)) {
                                                bookmarked = true;
                                              } else {
                                                bookmarked = false;
                                              }
                                            }
                                            if (bookmarkState
                                                is BookmarksLoaded) {
                                              return IconButton(
                                                icon: Icon(
                                                  bookmarked
                                                      ? Icons.star
                                                      : Icons.star_outline,
                                                  color: bookmarked
                                                      ? Colors.red
                                                      : Colors.grey,
                                                ),
                                                onPressed: () {
                                                  if (bookmarked) {
                                                    BlocProvider.of<
                                                                BookmarksBloc>(
                                                            context)
                                                        .add(
                                                      widget.fromBookmarkList
                                                          ? RemoveFromBookmarksUsingIndex(
                                                              widget.index)
                                                          : RemoveFromBookmarksUsingTrackId(
                                                              trackListState
                                                                      .trackLists
                                                                      .message
                                                                      .body
                                                                      .trackList[
                                                                  widget.index],
                                                            ),
                                                    );
                                                    setState(() {
                                                      bookmarked = false;
                                                    });
                                                  } else {
                                                    BlocProvider.of<
                                                                BookmarksBloc>(
                                                            context)
                                                        .add(
                                                      AddToBookmarks(
                                                        trackListState
                                                                .trackLists
                                                                .message
                                                                .body
                                                                .trackList[
                                                            widget.index],
                                                      ),
                                                    );

                                                    setState(() {
                                                      bookmarked = true;
                                                    });
                                                  }
                                                },
                                              );
                                            }
                                            return IconButton(
                                              icon: Icon(
                                                bookmarked
                                                    ? Icons.error
                                                    : Icons.error,
                                                color: bookmarked
                                                    ? Colors.red
                                                    : Colors.grey,
                                              ),
                                              onPressed: () {},
                                            );
                                          },
                                        );
                                      }
                                      return const Text('Loading');
                                    },
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Lyrics',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textColor,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child:
                                BlocBuilder<TrackLyricsBloc, TrackLyricsState>(
                              builder: (context, state) {
                                if (state is TrackLyricsLoading) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                if (state is TrackLyricsLoadingError) {
                                  return const Center(
                                    child: Text(
                                      'No Lyrics Available!',
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  );
                                }
                                if (state is TrackLyricsLoaded) {
                                  return SizedBox(
                                    width: double.infinity,
                                    child: Card(
                                      elevation: 5,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: SingleChildScrollView(
                                            child: Text(
                                          state.trackLyrics.message.body.lyrics
                                              .lyricsBody,
                                          style: const TextStyle(
                                            fontSize: 15,
                                          ),
                                        )),
                                      ),
                                    ),
                                  );
                                }
                                return const SizedBox();
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
                return Container();
              },
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