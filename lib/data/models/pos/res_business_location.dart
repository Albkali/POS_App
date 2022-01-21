import 'dart:convert';

ResBusinessLocation resBusinessLocationFromJson(String str) => ResBusinessLocation.fromJson(json.decode(str));

String resBusinessLocationToJson(ResBusinessLocation data) => json.encode(data.toJson());

class ResBusinessLocation {
  ResBusinessLocation({
    required this.data,
  });

  List<Location> data;

  factory ResBusinessLocation.fromJson(Map<String, dynamic> json) => ResBusinessLocation(
    data: List<Location>.from(json["data"].map((x) => Location.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Location {
  Location({
    this.id,
    this.businessId,
    this.locationId,
    this.name,
    this.landmark,
    this.country,
    this.state,
    this.city,
    this.zipCode,
    this.invoiceSchemeId,
    this.invoiceLayoutId,
    this.saleInvoiceLayoutId,
    this.sellingPriceGroupId,
    this.printReceiptOnInvoice,
    this.receiptPrinterType,
    this.printerId,
    this.mobile,
    this.alternateNumber,
    this.email,
    this.website,
    this.featuredProducts,
    this.isActive,
    this.customField1,
    this.customField2,
    this.customField3,
    this.customField4,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    // this.paymentMethods,
  });

  String? id;
  String? businessId;
  String? locationId;
  String? name;
  String? landmark;
  String? country;
  String? state;
  String? city;
  String? zipCode;
  String? invoiceSchemeId;
  String? invoiceLayoutId;
  String? saleInvoiceLayoutId;
  String? sellingPriceGroupId;
  String? printReceiptOnInvoice;
  String? receiptPrinterType;
  String? printerId;
  String? mobile;
  String? alternateNumber;
  String? email;
  String? website;
  String? featuredProducts;
  String? isActive;
  String? customField1;
  String? customField2;
  String? customField3;
  String? customField4;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;

  // List<PaymentMethod>? paymentMethods;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"].toString(),
        businessId: json["business_id"].toString(),
        locationId: json["location_id"].toString(),
        name: json["name"].toString(),
        landmark: json["landmark"].toString(),
        country: json["country"].toString(),
        state: json["state"].toString(),
        city: json["city"].toString(),
        zipCode: json["zip_code"].toString(),
    invoiceSchemeId: json["invoice_scheme_id"].toString(),
    invoiceLayoutId: json["invoice_layout_id"].toString(),
    saleInvoiceLayoutId: json["sale_invoice_layout_id"].toString(),
    sellingPriceGroupId: json["selling_price_group_id"].toString(),
    printReceiptOnInvoice: json["print_receipt_on_invoice"].toString(),
    receiptPrinterType: json["receipt_printer_type"].toString(),
    printerId: json["printer_id"].toString(),
    mobile: json["mobile"].toString(),
    alternateNumber: json["alternate_number"].toString(),
    email: json["email"].toString(),
    website: json["website"].toString(),
    featuredProducts: json["featured_products"].toString(),
    isActive: json["is_active"].toString(),
    customField1: json["custom_field1"].toString(),
    customField2: json["custom_field2"].toString(),
    customField3: json["custom_field3"].toString(),
    customField4: json["custom_field4"].toString(),
    deletedAt: json["deleted_at"].toString(),
    createdAt: json["created_at"].toString(),
    updatedAt: json["updated_at"].toString(),
        // paymentMethods: List<PaymentMethod>.from(json["payment_methods"].map((x) => PaymentMethod.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "business_id": businessId,
    "location_id": locationId,
    "name": name,
    "landmark": landmark,
    "country": country,
    "state": state,
    "city": city,
    "zip_code": zipCode,
    "invoice_scheme_id": invoiceSchemeId,
    "invoice_layout_id": invoiceLayoutId,
    "sale_invoice_layout_id": saleInvoiceLayoutId,
    "selling_price_group_id": sellingPriceGroupId,
    "print_receipt_on_invoice": printReceiptOnInvoice,
    "receipt_printer_type": receiptPrinterType,
    "printer_id": printerId,
    "mobile": mobile,
    "alternate_number": alternateNumber,
    "email": email,
    "website": website,
    "featured_products": featuredProducts,
    "is_active": isActive,
    "custom_field1": customField1,
    "custom_field2": customField2,
    "custom_field3": customField3,
    "custom_field4": customField4,
    "deleted_at": deletedAt,
    "created_at": createdAt,
    "updated_at": updatedAt,
    // "payment_methods": List<dynamic>.from(paymentMethods!.map((x) => x.toJson())),
      };
}

class PaymentMethod {
  PaymentMethod({
    this.name,
    this.label,
    this.accountId,
  });

  String? name;
  String? label;
  String? accountId;

  factory PaymentMethod.fromJson(Map<String, dynamic> json) => PaymentMethod(
        name: json["name"].toString(),
        label: json["label"].toString(),
        accountId: json["account_id"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "label": label,
        "account_id": accountId,
  };
}
