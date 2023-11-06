class Monument {
  String name, summary, map, pinMap, description;
  double rating;
  List<String> images;

  Monument(
      {required this.name,
      required this.summary,
      required this.map,
      required this.pinMap,
      required this.description,
      required this.images,
        this.rating = 0
      });
}
