import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/logic/blocs/bookmarks/bookmarks_bloc.dart';
import 'package:music_app/logic/blocs/internet_bloc/internet_bloc.dart';
import 'package:music_app/repositories/bookmarks_repository.dart';
import 'package:music_app/screens/track_list_screen.dart';
import '/logic/blocs/track_list/track_list_bloc.dart';
import '/repositories/track_repository.dart';
import 'logic/blocs/track_detail/track_detail_bloc.dart';
import 'logic/blocs/track_lyrics/track_lyrics_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final applicationDocumentDir = await getApplicationDocumentsDirectory();
  // await Hive.initFlutter();
  // await Hive.openBox('myBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TrackListBloc>(
          create: (BuildContext context) =>
              TrackListBloc(TrackRepository())..add(FetchTrackList()),
        ),
        BlocProvider<TrackDetailBloc>(
          create: (BuildContext context) =>
              TrackDetailBloc(trackRepository: TrackRepository()),
        ),
        BlocProvider<TrackLyricsBloc>(
          create: (BuildContext context) =>
              TrackLyricsBloc(trackRepository: TrackRepository()),
        ),
        BlocProvider<BookmarksBloc>(
          create: (BuildContext context) =>
              BookmarksBloc(BookmarksRepository()),
        ),
        BlocProvider<InternetBloc>(
          create: (BuildContext context) =>
              InternetBloc()..add(CheckInternetEvent()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const TrackListScreen(),
      ),
    );
  }
}
