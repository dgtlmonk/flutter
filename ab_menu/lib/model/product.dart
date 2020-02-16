class Product {
//  String productId;
  String name;
  String price;
  String macro;
//  String src;
  Product({
//    this.productId,
    this.name,
    this.macro,
    this.price,
//    this.src,
  });
  factory Product.fromJson(Map<String, dynamic> parsedJson) {
    return Product(
//      productId: parsedJson['id'],
      name: parsedJson['name'],
      price: parsedJson['price'],
      macro: parsedJson['macro'],
    );
  }
}
