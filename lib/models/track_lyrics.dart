class TrackLyrics {
  TrackLyrics({
    required this.message,
  });
  late final Message message;

  TrackLyrics.fromJson(Map<String, dynamic> json) {
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
    required this.lyrics,
  });
  late final Lyrics lyrics;

  Body.fromJson(Map<String, dynamic> json) {
    lyrics = Lyrics.fromJson(json['lyrics']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['lyrics'] = lyrics.toJson();
    return data;
  }
}

class Lyrics {
  Lyrics({
    required this.lyricsId,
    required this.explicit,
    required this.lyricsBody,
    required this.scriptTrackingUrl,
    required this.pixelTrackingUrl,
    required this.lyricsCopyright,
    required this.updatedTime,
  });
  late final int lyricsId;
  late final int explicit;
  late final String lyricsBody;
  late final String scriptTrackingUrl;
  late final String pixelTrackingUrl;
  late final String lyricsCopyright;
  late final String updatedTime;

  Lyrics.fromJson(Map<String, dynamic> json) {
    lyricsId = json['lyrics_id'];
    explicit = json['explicit'];
    lyricsBody = json['lyrics_body'];
    scriptTrackingUrl = json['script_tracking_url'];
    pixelTrackingUrl = json['pixel_tracking_url'];
    lyricsCopyright = json['lyrics_copyright'];
    updatedTime = json['updated_time'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['lyrics_id'] = lyricsId;
    data['explicit'] = explicit;
    data['lyrics_body'] = lyricsBody;
    data['script_tracking_url'] = scriptTrackingUrl;
    data['pixel_tracking_url'] = pixelTrackingUrl;
    data['lyrics_copyright'] = lyricsCopyright;
    data['updated_time'] = updatedTime;
    return data;
  }
}
