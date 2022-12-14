// ignore: depend_on_referenced_packages
import 'package:hive/hive.dart';
// part 'bookmark.g.dart';

// @HiveType(typeId: 0)
class TrackLists {
  TrackLists({
    required this.message,
  });
  late final Message message;

  TrackLists.fromJson(Map<String, dynamic> json) {
    message = Message.fromJson(json['message']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['message'] = message.toJson();
    return data;
  }
}

class Message {
  Message({
    required this.header,
    required this.body,
  });
  late final Header header;
  late final Body body;

  Message.fromJson(Map<String, dynamic> json) {
    header = Header.fromJson(json['header']);
    body = Body.fromJson(json['body']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['header'] = header.toJson();
    data['body'] = body.toJson();
    return data;
  }
}

class Header {
  Header({
    required this.statusCode,
    required this.executeTime,
  });
  late final int statusCode;
  late final double executeTime;

  Header.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    executeTime = json['execute_time'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status_code'] = statusCode;
    data['execute_time'] = executeTime;
    return data;
  }
}

class Body {
  Body({
    required this.trackList,
  });
  late final List<TrackList> trackList;

  Body.fromJson(Map<String, dynamic> json) {
    trackList = List.from(json['track_list'])
        .map((e) => TrackList.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['track_list'] = trackList.map((e) => e.toJson()).toList();
    return data;
  }
}

@HiveType(typeId: 2)
class TrackList extends HiveObject {
  TrackList({
    required this.track,
  });
  @HiveField(0)
  late final Track track;

  TrackList.fromJson(Map<String, dynamic> json) {
    track = Track.fromJson(json['track']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['track'] = track.toJson();
    return data;
  }
}

class Track {
  Track({
    required this.trackId,
    required this.trackName,
    required this.trackNameTranslationList,
    required this.trackRating,
    required this.commontrackId,
    required this.instrumental,
    required this.explicit,
    required this.hasLyrics,
    required this.hasSubtitles,
    required this.hasRichsync,
    required this.numFavourite,
    required this.albumId,
    required this.albumName,
    required this.artistId,
    required this.artistName,
    required this.trackShareUrl,
    required this.trackEditUrl,
    required this.restricted,
    required this.updatedTime,
    required this.primaryGenres,
    required this.bookmarked,
  });
  // @HiveField(0)
  late final int trackId;
  // @HiveField(1)
  late final String trackName;
  // @HiveField(2)
  late final List<TrackNameTranslationList> trackNameTranslationList;
  // @HiveField(3)
  late final int trackRating;
  // @HiveField(4)
  late final int commontrackId;
  // @HiveField(5)
  late final int instrumental;
  // @HiveField(6)
  late final int explicit;
  // @HiveField(7)
  late final int hasLyrics;
  // @HiveField(8)
  late final int hasSubtitles;
  // @HiveField(9)
  late final int hasRichsync;
  // @HiveField(10)
  late final int numFavourite;
  // @HiveField(11)
  late final int albumId;
  // @HiveField(12)
  late final String albumName;
  // @HiveField(13)
  late final int artistId;
  // @HiveField(14)
  late final String artistName;
  // @HiveField(15)
  late final String trackShareUrl;
  // @HiveField(16)
  late final String trackEditUrl;
  // @HiveField(17)
  late final int restricted;
  // @HiveField(18)
  late final String updatedTime;
  // @HiveField(19)
  late final PrimaryGenres primaryGenres;
  late bool bookmarked;

  Track.fromJson(Map<String, dynamic> json) {
    bookmarked = false;
    trackId = json['track_id'];
    trackName = json['track_name'];
    trackNameTranslationList = List.from(json['track_name_translation_list'])
        .map((e) => TrackNameTranslationList.fromJson(e))
        .toList();
    trackRating = json['track_rating'];
    commontrackId = json['commontrack_id'];
    instrumental = json['instrumental'];
    explicit = json['explicit'];
    hasLyrics = json['has_lyrics'];
    hasSubtitles = json['has_subtitles'];
    hasRichsync = json['has_richsync'];
    numFavourite = json['num_favourite'];
    albumId = json['album_id'];
    albumName = json['album_name'];
    artistId = json['artist_id'];
    artistName = json['artist_name'];
    trackShareUrl = json['track_share_url'];
    trackEditUrl = json['track_edit_url'];
    restricted = json['restricted'];
    updatedTime = json['updated_time'];
    primaryGenres = PrimaryGenres.fromJson(json['primary_genres']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['track_id'] = trackId;
    data['track_name'] = trackName;
    data['track_name_translation_list'] =
        trackNameTranslationList.map((e) => e.toJson()).toList();
    data['track_rating'] = trackRating;
    data['commontrack_id'] = commontrackId;
    data['instrumental'] = instrumental;
    data['explicit'] = explicit;
    data['has_lyrics'] = hasLyrics;
    data['has_subtitles'] = hasSubtitles;
    data['has_richsync'] = hasRichsync;
    data['num_favourite'] = numFavourite;
    data['album_id'] = albumId;
    data['album_name'] = albumName;
    data['artist_id'] = artistId;
    data['artist_name'] = artistName;
    data['track_share_url'] = trackShareUrl;
    data['track_edit_url'] = trackEditUrl;
    data['restricted'] = restricted;
    data['updated_time'] = updatedTime;
    data['primary_genres'] = primaryGenres.toJson();
    return data;
  }
}

class TrackNameTranslationList {
  TrackNameTranslationList({
    required this.trackNameTranslation,
  });
  late final TrackNameTranslation trackNameTranslation;

  TrackNameTranslationList.fromJson(Map<String, dynamic> json) {
    trackNameTranslation =
        TrackNameTranslation.fromJson(json['track_name_translation']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['track_name_translation'] = trackNameTranslation.toJson();
    return data;
  }
}

class TrackNameTranslation {
  TrackNameTranslation({
    required this.language,
    required this.translation,
  });
  late final String language;
  late final String translation;

  TrackNameTranslation.fromJson(Map<String, dynamic> json) {
    language = json['language'];
    translation = json['translation'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['language'] = language;
    data['translation'] = translation;
    return data;
  }
}

class PrimaryGenres {
  PrimaryGenres({
    required this.musicGenreList,
  });
  late final List<MusicGenreList> musicGenreList;

  PrimaryGenres.fromJson(Map<String, dynamic> json) {
    musicGenreList = List.from(json['music_genre_list'])
        .map((e) => MusicGenreList.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['music_genre_list'] = musicGenreList.map((e) => e.toJson()).toList();
    return data;
  }
}

class MusicGenreList {
  MusicGenreList({
    required this.musicGenre,
  });
  late final MusicGenre musicGenre;

  MusicGenreList.fromJson(Map<String, dynamic> json) {
    musicGenre = MusicGenre.fromJson(json['music_genre']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['music_genre'] = musicGenre.toJson();
    return data;
  }
}

class MusicGenre {
  MusicGenre({
    required this.musicGenreId,
    required this.musicGenreParentId,
    required this.musicGenreName,
    required this.musicGenreNameExtended,
    required this.musicGenreVanity,
  });
  late final int musicGenreId;
  late final int musicGenreParentId;
  late final String musicGenreName;
  late final String musicGenreNameExtended;
  late final String musicGenreVanity;

  MusicGenre.fromJson(Map<String, dynamic> json) {
    musicGenreId = json['music_genre_id'];
    musicGenreParentId = json['music_genre_parent_id'];
    musicGenreName = json['music_genre_name'];
    musicGenreNameExtended = json['music_genre_name_extended'];
    musicGenreVanity = json['music_genre_vanity'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['music_genre_id'] = musicGenreId;
    data['music_genre_parent_id'] = musicGenreParentId;
    data['music_genre_name'] = musicGenreName;
    data['music_genre_name_extended'] = musicGenreNameExtended;
    data['music_genre_vanity'] = musicGenreVanity;
    return data;
  }
}
