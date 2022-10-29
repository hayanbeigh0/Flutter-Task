import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../logic/blocs/bookmarks/bookmarks_bloc.dart';
import '../logic/blocs/internet_bloc/internet_bloc.dart';
import '/screens/bookmarks_screen.dart';
import '/screens/track_detail_screen.dart';
import '/widgets/list_item.dart';

import '../logic/blocs/track_list/track_list_bloc.dart';

class TrackListScreen extends StatelessWidget {
  const TrackListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<InternetBloc>(context).add(CheckInternetEvent());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tracks'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const BookmarksScreen(),
              ));
            },
            icon: const Icon(
              Icons.star,
            ),
          ),
        ],
      ),
      body: BlocConsumer<InternetBloc, InternetState>(
        listener: (context, state) {
          if (state is InternetDisconnected) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('No Internet Connection!')));
          }
          if (state is InternetConnected) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Internet Connected!')));
          }
        },
        builder: (context, state) {
          if (state is InternetDisconnected) {
            return const Center(
              child: Text('No Internet Connection!'),
            );
          }
          if (state is InternetConnected) {
            return BlocConsumer<TrackListBloc, TrackListState>(
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
            );
          }
          return Container();
        },
      ),
    );
  }
}
