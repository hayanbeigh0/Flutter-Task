import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../logic/blocs/bookmarks/bookmarks_bloc.dart';
import '/screens/bookmarks_screen.dart';
import '/screens/track_detail_screen.dart';
import '/widgets/list_item.dart';

import '../logic/blocs/track_list/track_list_bloc.dart';

class TrackListScreen extends StatelessWidget {
  const TrackListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tracks'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => BookmarksScreen(),
              ));
            },
            icon: const Icon(
              Icons.star,
            ),
          ),
        ],
      ),
      body: BlocConsumer<TrackListBloc, TrackListState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is TrackListLoading) {
            return const Center(
              child: Text('Loading...'),
            );
          }
          if (state is TrackListLoadingError) {
            return Center(
              child: Text(
                state.errorMessage.toString(),
              ),
            );
          }
          if (state is TrackListLoaded) {
            return BlocListener<BookmarksBloc, BookmarksState>(
              listener: (context, state) {},
              child: ListView.builder(
                padding: const EdgeInsets.all(10.0),
                itemCount: state.trackLists.message.body.trackList.length,
                itemBuilder: (context, index) {
                  return ListItem(
                    state: state,
                    index: index,
                  );
                },
              ),
            );
          }

          return Container();
        },
      ),
    );
  }
}
