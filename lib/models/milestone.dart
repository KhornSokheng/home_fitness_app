
class Milestone{
  String name;
  int? value;
  String unit;
  String image_url;
  bool reached;


  Milestone({
    required this.name,
    required this.unit,
    required this.value,
    required this.image_url,
    this.reached = true,


  });
}