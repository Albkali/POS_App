import 'dart:convert';

ReqCreateSell reqCreateSellFromJson(String str) =>
    ReqCreateSell.fromJson(json.decode(str));

String reqCreateSellToJson(ReqCreateSell data) => json.encode(data.toJson());

class ReqCreateSell {
  ReqCreateSell({
    required this.sells,
  });

  List<Sell> sells;

  factory ReqCreateSell.fromJson(Map<String, dynamic> json) => ReqCreateSell(
        sells: List<Sell>.from(json["sells"].map((x) => Sell.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "sells": List<dynamic>.from(sells.map((x) => x.toJson())),
      };
}

class Sell {
  Sell({
    required this.locationId,
    required this.contactId,
    required this.discountAmount,
    required this.discountType,
    this.taxId,
    this.taxAmount,
    this.status,
    this.subStatus,
    this.isQuotation,
    required this.products,
    required this.payments,
  });

  int locationId;
  int contactId;
  String? taxId;
  String? taxAmount;
  String discountAmount;
  String discountType;
  String? status;
  String? subStatus;
  String? isQuotation;
  List<Product> products;
  List<Payment> payments;

  factory Sell.fromJson(Map<String, dynamic> json) => Sell(
        locationId: json["location_id"],
        contactId: json["contact_id"],
        taxId: json["tax_rate_id"].toString(),
        taxAmount: json["tax_amount"].toString(),
        discountAmount: json["discount_amount"].toString(),
        discountType: json["discount_type"].toString(),
        status: json["status"].toString(),
        subStatus: json["sub_status"].toString(),
        isQuotation: json["is_quotation"].toString(),
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
        payments: List<Payment>.from(
            json["payments"].map((x) => Payment.fromJson(x))),
      );

  Map<String, dynamic> toJson() =>
      {
        "location_id": locationId,
        "contact_id": contactId,
        "tax_rate_id": taxId,
        "tax_amount": taxAmount,
        "discount_amount": discountAmount,
        "discount_type": discountType,
        "status": status,
        "sub_status": subStatus,
        "is_quotation": isQuotation,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "payments": List<dynamic>.from(payments.map((x) => x.toJson())),
      };
}

class Payment {
  Payment({
    required this.amount,
    required this.method,
  });

  String amount;
  String method;

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        amount: json["amount"].toString(),
        method: json["method"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "method": method,
      };
}

class Product {
  Product({
    required this.productId,
    required this.quantity,
    required this.variationId,
    required this.unitPrice,
  });

  String productId;
  String quantity;
  String variationId;
  String unitPrice;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["product_id"].toString(),
        quantity: json["quantity"].toString(),
        variationId: json["variation_id"].toString(),
        unitPrice: json["unit_price"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "quantity": quantity,
        "variation_id": variationId,
        "unit_price": unitPrice,
      };
}
