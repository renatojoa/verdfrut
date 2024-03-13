class ItemModel {
  String itemName;
  String imageUrl;
  String unit;
  double price;
  String description;
  String ncm;
  String nutrionalURL;

  ItemModel(
      {required this.itemName,
      required this.imageUrl,
      required this.unit,
      required this.price,
      required this.description,
      required this.ncm,
      required this.nutrionalURL});
}
