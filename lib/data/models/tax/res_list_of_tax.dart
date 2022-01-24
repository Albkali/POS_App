import 'dart:convert';

ResListTax resListTaxFromJson(String str) =>
    ResListTax.fromJson(json.decode(str));

String resListTaxToJson(ResListTax data) => json.encode(data.toJson());

class ResListTax {
  ResListTax({
    required this.data,
  });

  List<Taxes> data;

  factory ResListTax.fromJson(Map<String, dynamic> json) => ResListTax(
        data: List<Taxes>.from(json["data"].map((x) => Taxes.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Taxes {
  Taxes({
    this.id,
    this.businessId,
    this.name,
    this.amount,
    this.isTaxGroup,
    this.forTaxGroup,
    this.createdBy,
    this.woocommerceTaxRateId,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  String? businessId;
  String? name;
  String? amount;
  String? isTaxGroup;
  String? forTaxGroup;
  String? createdBy;
  String? woocommerceTaxRateId;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;

  factory Taxes.fromJson(Map<String, dynamic> json) => Taxes(
        id: json["id"].toString(),
        businessId: json["business_id"].toString(),
        name: json["name"].toString(),
        amount: json["amount"].toString(),
        isTaxGroup: json["is_tax_group"].toString(),
        forTaxGroup: json["for_tax_group"].toString(),
        createdBy: json["created_by"].toString(),
        woocommerceTaxRateId: json["woocommerce_tax_rate_id"].toString(),
        deletedAt: json["deleted_at"].toString(),
        createdAt: json["created_at"].toString(),
        updatedAt: json["updated_at"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "business_id": businessId,
        "name": name,
        "amount": amount,
        "is_tax_group": isTaxGroup,
        "for_tax_group": forTaxGroup,
        "created_by": createdBy,
        "woocommerce_tax_rate_id": woocommerceTaxRateId,
        "deleted_at": deletedAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
