class CastTile {
  final int castId;
  final String imageUrl;
  final String castName;
  final String castRoleName;

  CastTile({
    required this.castId,
    required this.imageUrl,
    required this.castName,
    required this.castRoleName,
  });

  factory CastTile.fromJson(Map<String, dynamic> json) {
    return CastTile(
      // TMDB ID
      castId: json['id'],

      // set to empty string if null
      imageUrl: json['profile_path'] ?? '',

      //name of cast
      castName: json['name'] ?? '',

      // cast character name
      castRoleName: json['character'] ?? '',
    );
  }
}
