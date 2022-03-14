
class Activity{
  String name;
  String? value;
  String unit;
  String image_url;
  bool reached;


  Activity({
    required this.name,
    required this.unit,
    required this.value,
    required this.image_url,
    this.reached = true,


  });
}