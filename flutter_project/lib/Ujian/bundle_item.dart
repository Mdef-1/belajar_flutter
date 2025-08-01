class BundleItem {
  final String name;
  final String location;
  final String date;
  final String description;
  final double price;
  final String imagePath;
  final String? paymentMethod;

  const BundleItem(
      {required this.name,
      required this.location,
      required this.date,
      required this.description,
      required this.price,
      required this.imagePath,
      this.paymentMethod});
}
