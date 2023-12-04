class PlanetData {
  String position;
  String name;
  String image;
  String velocity;
  String distance;
  String description;

  PlanetData({
    required this.position,
    required this.name,
    required this.image,
    required this.velocity,
    required this.distance,
    required this.description,
  });

  factory PlanetData.fromjson(Map<String, dynamic> data) {
    return PlanetData(
        position: data['position'],
        name: data['name'],
        image: data['image'],
        velocity: data['velocity'],
        distance: data['distance'],
        description: data['description']);
  }
  String tostring() {
    return "position:$position,name:$name,image:$image,velocity:$velocity,distance:$distance,description:$description";
  }

  static List<PlanetData> Planet(List value) {
    List<PlanetData> list = value.map((e) => PlanetData.fromjson(e)).toList();
    return list;
  }
}
