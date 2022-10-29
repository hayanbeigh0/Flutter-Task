import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/blocs/bookmarks/bookmarks_bloc.dart';
import '../logic/blocs/track_list/track_list_bloc.dart';
import '../screens/track_detail_screen.dart';

class ListItem extends StatefulWidget {
  ListItem({
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
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => TrackDetailScreen(
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
            return ListTile(
              title: Text(
                widget.state.trackLists.message.body.trackList[widget.index]
                    .track.trackName,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
