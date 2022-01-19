// To parse this JSON data, do
//
//     final reqAddReturnSell = reqAddReturnSellFromJson(jsonString);

import 'dart:convert';

ReqAddReturnSell reqAddReturnSellFromJson(String str) => ReqAddReturnSell.fromJson(json.decode(str));

String reqAddReturnSellToJson(ReqAddReturnSell data) => json.encode(data.toJson());

class ReqAddReturnSell {
  ReqAddReturnSell({
    this.transactionId,
    required this.products,
  });

  String? transactionId;
  List<Product> products;

  factory ReqAddReturnSell.fromJson(Map<String, dynamic> json) => ReqAddReturnSell(
    transactionId: json["transaction_id"].toString(),
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "transaction_id": transactionId,
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
  };
}

class Product {
  Product({
    this.sellLineId,
    this.quantity,
    this.unitPriceIncTax,
  });

  String? sellLineId;
  String? quantity;
  String? unitPriceIncTax;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    sellLineId: json["sell_line_id"],
    quantity: json["quantity"],
    unitPriceIncTax: json["unit_price_inc_tax"],
  );

  Map<String, dynamic> toJson() => {
    "sell_line_id": sellLineId,
    "quantity": quantity,
    "unit_price_inc_tax": unitPriceIncTax,
  };
}
