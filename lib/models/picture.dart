class Picture {
  int? id;
  String? picture;
  bool isUrl = true;

  Picture({this.id, this.picture});

  Picture.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    picture = json['picture'];
  }
}
