class VideoTile {
  final String videoId;
  final String key;
  final String videoName;
  final String site;
  final String type;

  VideoTile({
    required this.videoId,
    required this.key,
    required this.videoName,
    required this.site,
    required this.type,
  });

  factory VideoTile.fromJson(Map<String, dynamic> json) {
    return VideoTile(
      videoId: json['id'], //unique id
      key: json['key'], //link
      videoName: json['name'], //name of video
      site: json['site'], //website -> Youtube
      type: json['type'], //type of video
    );
  }
}
