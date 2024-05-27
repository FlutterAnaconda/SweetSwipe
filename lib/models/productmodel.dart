class ProductModel {
  String? title;
  String? image;
  String? subtitle;
  String? price;
  String? rating;
  String? location;
  bool isfav;
  bool istapped;
  String? status;
  bool? discount;
  bool? outofstock;
  int? quantity;

  ProductModel(
      {this.title,
        this.image,
        this.istapped=false,
        this.price,
        this.rating,
        this.location,
        this.subtitle,
        this.status,
        this.outofstock=false,
        this.quantity=25,
        this.discount=false,
        this.isfav = false});
}
