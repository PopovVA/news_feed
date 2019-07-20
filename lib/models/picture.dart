class Picture {
  Picture.fromJson(Map<String, dynamic> json) {
    _url = json['url'];
  }
  String _url;
  String get url => _url;
}
