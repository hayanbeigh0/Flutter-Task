import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/blocs/bookmarks/bookmarks_bloc.dart';
import '../logic/blocs/track_list/track_list_bloc.dart';
import '../screens/track_detail_screen.dart';

class ListItem extends StatefulWidget {
  const ListItem({
    super.key,
    required this.state,
    required this.index,
    // required this.bookmarked,
  });
  final TrackListLoaded state;
  final int index;
  // bool bookmarked;

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  Color textColor = const Color.fromARGB(208, 0, 0, 0);
  double titleWidth = 55;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => TrackDetailScreen(
            fromBookmarkList: false,
            trackId: widget.state.trackLists.message.body
                .trackList[widget.index].track.trackId
                .toString(),
            state: widget.state,
            index: widget.index,
          ),
        ),
      ),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: BlocBuilder<BookmarksBloc, BookmarksState>(
          builder: (context, bookmarksState) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: titleWidth,
                        child: const Text(
                          'Track:',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          widget.state.trackLists.message.body
                              .trackList[widget.index].track.trackName,
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                            color: textColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: titleWidth,
                        child: const Text(
                          'Artist:',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        widget.state.trackLists.message.body
                            .trackList[widget.index].track.artistName
                            .toString(),
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: textColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: titleWidth,
                        child: const Text(
                          'Album:',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          widget.state.trackLists.message.body
                              .trackList[widget.index].track.albumName
                              .toString(),
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            color: textColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: titleWidth,
                        child: const Text(
                          'Rating:',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        widget.state.trackLists.message.body
                            .trackList[widget.index].track.trackRating
                            .toString(),
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: textColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}


// title: Text(
//                 widget.state.trackLists.message.body.trackList[widget.index]
//                     .track.trackName,
//                 style: const TextStyle(
//                   fontSize: 16.0,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               trailing: Row(
//                 children: [
//                   Text('Rating:'),
//                   Text(widget.state.trackLists.message.body
//                       .trackList[widget.index].track.trackRating
//                       .toString()),