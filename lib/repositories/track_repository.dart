import 'dart:convert';

import 'package:music_app/models/track_lyrics.dart';
import 'package:music_app/utils/app_constants.dart';

import '../models/track_details.dart';
import '/models/track_list.dart';
import 'package:http/http.dart' as http;

class TrackRepository {
  Future<TrackLists> getTracks() async {
    const String url =
        'https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=${AppConstants.apiKey}';
    final result = await http.get(Uri.parse(url));
    return parsedJsonForTrackList(result.body);
  }

  TrackLists parsedJsonForTrackList(final response) {
    final jsonProduct = json.decode(response);
    return TrackLists.fromJson(jsonProduct);
  }

  Future<TrackDetails> getTrackDetail(String trackId) async {
    final String url =
        'https://api.musixmatch.com/ws/1.1/track.get?track_id=$trackId&apikey=${AppConstants.apiKey}';
    final result = await http.get(Uri.parse(url));
    return parsedJsonForTrackDetail(result.body);
  }

  TrackDetails parsedJsonForTrackDetail(final response) {
    final jsonProduct = json.decode(response);
    return TrackDetails.fromJson(jsonProduct);
  }

  Future<TrackLyrics> getTrackLyrics(String trackId) async {
    final String url =
        'https://api.musixmatch.com/ws/1.1/track.lyrics.get?track_id=$trackId&apikey=${AppConstants.apiKey}';
    final result = await http.get(Uri.parse(url));
    return parsedJsonForTrackLyrics(result.body);
  }

  TrackLyrics parsedJsonForTrackLyrics(final response) {
    final jsonProduct = json.decode(response);
    return TrackLyrics.fromJson(jsonProduct);
  }
}
