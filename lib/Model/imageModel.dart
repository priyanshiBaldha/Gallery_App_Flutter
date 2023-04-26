class ImageModel{
  String largeImageURL;
  String tags;

  ImageModel({required this.largeImageURL,required this.tags});

  factory ImageModel.fromMap({required Map Data}) {
    return ImageModel(largeImageURL: Data["largeImageURL"], tags: Data["tags"]);
  }
}
