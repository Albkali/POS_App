import 'dart:convert';

ResProductPos resProductPosFromJson(String str) => ResProductPos.fromJson(json.decode(str));

String resProductPosToJson(ResProductPos data) => json.encode(data.toJson());

class ResProductPos {
  ResProductPos({
    required this.data,
    required this.links,
    required this.meta,
  });

  List<Items> data;
  Links links;
  Meta meta;

  factory ResProductPos.fromJson(Map<String, dynamic> json) => ResProductPos(
    data: List<Items>.from(json["data"].map((x) => Items.fromJson(x))),
    links: Links.fromJson(json["links"]),
    meta: Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "links": links.toJson(),
    "meta": meta.toJson(),
  };
}

class Items {
  Items({
    required this.id,
    required this.name,
    required this.businessId,
    required this.type,
    required this.subUnitIds,
    required this.enableStock,
    required this.alertQuantity,
    required this.sku,
    required this.barcodeType,
    required this.expiryPeriod,
    required this.expiryPeriodType,
    required this.enableSrNo,
    required this.weight,
    required this.productCustomField1,
    required this.productCustomField2,
    required this.productCustomField3,
    required this.productCustomField4,
    required this.image,
    required this.woocommerceMediaId,
    required this.productDescription,
    required this.createdBy,
    required this.woocommerceProductId,
    required this.woocommerceDisableSync,
    required this.warrantyId,
    required this.isInactive,
    required this.notForSelling,
    required this.imageUrl,
    required this.productVariations,
    required this.brand,
    required this.unit,
    required this.category,
    required this.subCategory,
    required this.productTax,
    required this.productLocations,

  });

  String id;
  String name;
  String businessId;
  String type;
  String subUnitIds;
  String enableStock;
  String alertQuantity;
  String sku;
  String barcodeType;
  String expiryPeriod;
  String expiryPeriodType;
  String enableSrNo;
  String weight;
  String productCustomField1;
  String productCustomField2;
  String productCustomField3;
  String productCustomField4;
  String image;
  String woocommerceMediaId;
  String productDescription;
  String createdBy;
  String woocommerceProductId;
  String woocommerceDisableSync;
  String warrantyId;
  String isInactive;
  String notForSelling;
  String imageUrl;
  List<ProductVariation> productVariations;
  String brand;
  Unit unit;
  String category;
  String subCategory;
  String productTax;
  List<ProductLocation> productLocations;
  int itemCounter = 1;

  factory Items.fromJson(Map<String, dynamic> json) => Items(
    id: json["id"].toString(),
    name: json["name"].toString(),
    businessId: json["business_id"].toString(),
    type: json["type"].toString(),
    subUnitIds: json["sub_unit_ids"].toString(),
    enableStock: json["enable_stock"].toString(),
    alertQuantity: json["alert_quantity"].toString(),
    sku: json["sku"].toString(),
    barcodeType: json["barcode_type"].toString(),
    expiryPeriod: json["expiry_period"].toString(),
    expiryPeriodType: json["expiry_period_type"].toString(),
    enableSrNo: json["enable_sr_no"].toString(),
    weight: json["weight"].toString(),
    productCustomField1: json["product_custom_field1"].toString(),
    productCustomField2: json["product_custom_field2"].toString(),
    productCustomField3: json["product_custom_field3"].toString(),
    productCustomField4: json["product_custom_field4"].toString(),
    image: json["image"].toString(),
    woocommerceMediaId: json["woocommerce_media_id"].toString(),
    productDescription: json["product_description"].toString(),
    createdBy: json["created_by"].toString(),
    woocommerceProductId: json["woocommerce_product_id"].toString(),
    woocommerceDisableSync: json["woocommerce_disable_sync"].toString(),
    warrantyId: json["warranty_id"].toString(),
    isInactive: json["is_inactive"].toString(),
    notForSelling: json["not_for_selling"].toString(),
    imageUrl: json["image_url"].toString(),
    productVariations: List<ProductVariation>.from(json["product_variations"].map((x) => ProductVariation.fromJson(x))),
    brand: json["brand"].toString(),
    unit: Unit.fromJson(json["unit"]),
    category: json["category"].toString(),
    subCategory: json["sub_category"].toString(),
    productTax: json["product_tax"].toString(),
    productLocations: List<ProductLocation>.from(json["product_locations"].map((x) => ProductLocation.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "business_id": businessId,
        "type": type,
        "sub_unit_ids": subUnitIds,
        "enable_stock": enableStock,
        "alert_quantity": alertQuantity,
        "sku": sku,
        "barcode_type": barcodeType,
        "expiry_period": expiryPeriod,
        "expiry_period_type": expiryPeriodType,
        "enable_sr_no": enableSrNo,
        "weight": weight,
        "product_custom_field1": productCustomField1,
        "product_custom_field2": productCustomField2,
        "product_custom_field3": productCustomField3,
        "product_custom_field4": productCustomField4,
        "image": image,
    "woocommerce_media_id": woocommerceMediaId,
    "product_description": productDescription,
    "created_by": createdBy,
    "woocommerce_product_id": woocommerceProductId,
    "woocommerce_disable_sync": woocommerceDisableSync,
    "warranty_id": warrantyId,
    "is_inactive": isInactive,
    "not_for_selling": notForSelling,
    "image_url": imageUrl,
    "product_variations": List<dynamic>.from(productVariations.map((x) => x.toJson())),
    "brand": brand,
    "unit": unit.toJson(),
    "category": category,
    "sub_category": subCategory,
    "product_tax": productTax,
    "product_locations": List<dynamic>.from(productLocations.map((x) => x.toJson())),
  };
}

class ProductLocation {
  ProductLocation({
    required this.id,
    required this.businessId,
    required this.locationId,
    required this.name,
    required this.landmark,
    required this.country,
    required this.state,
    required this.city,
    required this.zipCode,
    required this.invoiceSchemeId,
    required this.invoiceLayoutId,
    required this.saleInvoiceLayoutId,
    required this.sellingPriceGroupId,
    required this.printReceiptOnInvoice,
    required this.receiptPrinterType,
    required this.printerId,
    required this.mobile,
    required this.alternateNumber,
    required this.email,
    required this.website,
    required this.featuredProducts,
    required this.isActive,
    required this.defaultPaymentAccounts,
    required this.customField1,
    required this.customField2,
    required this.customField3,
    required this.customField4,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.pivot,
  });

  String id;
  String businessId;
  String locationId;
  String name;
  String landmark;
  String country;
  String state;
  String city;
  String zipCode;
  String invoiceSchemeId;
  String invoiceLayoutId;
  String saleInvoiceLayoutId;
  String sellingPriceGroupId;
  String printReceiptOnInvoice;
  String receiptPrinterType;
  String printerId;
  String mobile;
  String alternateNumber;
  String email;
  String website;
  String featuredProducts;
  String isActive;
  String defaultPaymentAccounts;
  String customField1;
  String customField2;
  String customField3;
  String customField4;
  String deletedAt;
  String createdAt;
  String updatedAt;
  Pivot pivot;

  factory ProductLocation.fromJson(Map<String, dynamic> json) => ProductLocation(
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
    defaultPaymentAccounts: json["default_payment_accounts"].toString(),
    customField1: json["custom_field1"].toString(),
    customField2: json["custom_field2"].toString(),
    customField3: json["custom_field3"].toString(),
    customField4: json["custom_field4"].toString(),
    deletedAt: json["deleted_at"].toString(),
    createdAt: json["created_at"].toString(),
    updatedAt: json["updated_at"].toString(),
    pivot: Pivot.fromJson(json["pivot"]),
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
    "default_payment_accounts": defaultPaymentAccounts,
    "custom_field1": customField1,
    "custom_field2": customField2,
    "custom_field3": customField3,
    "custom_field4": customField4,
    "deleted_at": deletedAt,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "pivot": pivot.toJson(),
  };
}

class Pivot {
  Pivot({
    required this.productId,
    required this.locationId,
  });

  String productId;
  String locationId;

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
    productId: json["product_id"].toString(),
    locationId: json["location_id"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "location_id": locationId,
  };
}

class ProductVariation {
  ProductVariation({
    required this.id,
    required this.variationTemplateId,
    required this.name,
    required this.productId,
    required this.isDummy,
    required this.createdAt,
    required this.updatedAt,
    required this.variations,
  });

  String id;
  String variationTemplateId;
  String name;
  String productId;
  String isDummy;
  String createdAt;
  String updatedAt;
  List<Variation> variations;

  factory ProductVariation.fromJson(Map<String, dynamic> json) => ProductVariation(
    id: json["id"].toString(),
    variationTemplateId: json["variation_template_id"].toString(),
    name: json["name"].toString(),
    productId: json["product_id"].toString(),
    isDummy: json["is_dummy"].toString(),
    createdAt: json["created_at"].toString(),
    updatedAt: json["updated_at"].toString(),
    variations: List<Variation>.from(json["variations"].map((x) => Variation.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "variation_template_id": variationTemplateId,
    "name": name,
    "product_id": productId,
    "is_dummy": isDummy,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "variations": List<dynamic>.from(variations.map((x) => x.toJson())),
  };
}

class Variation {
  Variation({
    required this.id,
    required this.name,
    required this.productId,
    required this.subSku,
    required this.productVariationId,
    required this.woocommerceVariationId,
    required this.variationValueId,
    required this.defaultPurchasePrice,
    required this.dppIncTax,
    required this.profitPercent,
    required this.defaultSellPrice,
    required this.sellPriceIncTax,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.comboVariations,
    required this.variationLocationDetails,
    required this.media,
    required this.discounts,
  });

  String id;
  String name;
  String productId;
  String subSku;
  String productVariationId;
  String woocommerceVariationId;
  String variationValueId;
  String defaultPurchasePrice;
  String dppIncTax;
  String profitPercent;
  String defaultSellPrice;
  String sellPriceIncTax;
  String createdAt;
  String updatedAt;
  String deletedAt;
  List<dynamic> comboVariations;
  List<VariationLocationDetail> variationLocationDetails;
  List<dynamic> media;
  List<dynamic> discounts;

  factory Variation.fromJson(Map<String, dynamic> json) => Variation(
    id: json["id"].toString(),
    name: json["name"].toString(),
    productId: json["product_id"].toString(),
    subSku: json["sub_sku"].toString(),
    productVariationId: json["product_variation_id"].toString(),
    woocommerceVariationId: json["woocommerce_variation_id"].toString(),
    variationValueId: json["variation_value_id"].toString(),
    defaultPurchasePrice: json["default_purchase_price"].toString(),
    dppIncTax: json["dpp_inc_tax"].toString(),
    profitPercent: json["profit_percent"].toString(),
    defaultSellPrice: json["default_sell_price"].toString(),
    sellPriceIncTax: json["sell_price_inc_tax"].toString(),
    createdAt: json["created_at"].toString(),
    updatedAt: json["updated_at"].toString(),
    deletedAt: json["deleted_at"].toString(),
    comboVariations: List<dynamic>.from(json["combo_variations"].map((x) => x)),
    variationLocationDetails: List<VariationLocationDetail>.from(json["variation_location_details"].map((x) => VariationLocationDetail.fromJson(x))),
    media: List<dynamic>.from(json["media"].map((x) => x)),
    discounts: List<dynamic>.from(json["discounts"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "product_id": productId,
    "sub_sku": subSku,
    "product_variation_id": productVariationId,
    "woocommerce_variation_id": woocommerceVariationId,
    "variation_value_id": variationValueId,
    "default_purchase_price": defaultPurchasePrice,
    "dpp_inc_tax": dppIncTax,
    "profit_percent": profitPercent,
    "default_sell_price": defaultSellPrice,
    "sell_price_inc_tax": sellPriceIncTax,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "deleted_at": deletedAt,
    "combo_variations": List<dynamic>.from(comboVariations.map((x) => x)),
    "variation_location_details": List<dynamic>.from(variationLocationDetails.map((x) => x.toJson())),
    "media": List<dynamic>.from(media.map((x) => x)),
    "discounts": List<dynamic>.from(discounts.map((x) => x)),
  };
}

class VariationLocationDetail {
  VariationLocationDetail({
    required this.id,
    required this.productId,
    required this.productVariationId,
    required this.variationId,
    required this.locationId,
    required this.qtyAvailable,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String productId;
  String productVariationId;
  String variationId;
  String locationId;
  String qtyAvailable;
  String createdAt;
  String updatedAt;

  factory VariationLocationDetail.fromJson(Map<String, dynamic> json) => VariationLocationDetail(
    id: json["id"].toString(),
    productId: json["product_id"].toString(),
    productVariationId: json["product_variation_id"].toString(),
    variationId: json["variation_id"].toString(),
    locationId: json["location_id"].toString(),
    qtyAvailable: json["qty_available"].toString(),
    createdAt: json["created_at"].toString(),
    updatedAt: json["updated_at"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id": productId,
    "product_variation_id": productVariationId,
    "variation_id": variationId,
    "location_id": locationId,
    "qty_available": qtyAvailable,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

class Unit {
  Unit({
    required this.id,
    required this.businessId,
    required this.actualName,
    required this.shortName,
    required this.allowDecimal,
    required this.baseUnitId,
    required this.baseUnitMultiplier,
    required this.createdBy,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String businessId;
  String actualName;
  String shortName;
  String allowDecimal;
  String baseUnitId;
  String baseUnitMultiplier;
  String createdBy;
  String deletedAt;
  String createdAt;
  String updatedAt;

  factory Unit.fromJson(Map<String, dynamic> json) => Unit(
    id: json["id"].toString(),
    businessId: json["business_id"].toString(),
    actualName: json["actual_name"].toString(),
    shortName: json["short_name"].toString(),
    allowDecimal: json["allow_decimal"].toString(),
    baseUnitId: json["base_unit_id"].toString(),
    baseUnitMultiplier: json["base_unit_multiplier"].toString(),
    createdBy: json["created_by"].toString(),
    deletedAt: json["deleted_at"].toString(),
    createdAt: json["created_at"].toString(),
    updatedAt: json["updated_at"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "business_id": businessId,
    "actual_name": actualName,
    "short_name": shortName,
    "allow_decimal": allowDecimal,
    "base_unit_id": baseUnitId,
    "base_unit_multiplier": baseUnitMultiplier,
    "created_by": createdBy,
    "deleted_at": deletedAt,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

class Links {
  Links({
    required this.first,
    required this.last,
    required this.prev,
    required this.next,
  });

  String first;
  String last;
  String prev;
  String next;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    first: json["first"].toString(),
    last: json["last"].toString(),
    prev: json["prev"].toString(),
    next: json["next"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "first": first,
    "last": last,
    "prev": prev,
    "next": next,
  };
}

class Meta {
  Meta({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });

 String currentPage;
 String from;
 String lastPage;
 String path;
 String perPage;
 String to;
 String total;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    currentPage: json["current_page"].toString(),
    from: json["from"].toString(),
    lastPage: json["last_page"].toString(),
    path: json["path"].toString(),
    perPage: json["per_page"].toString(),
    to: json["to"].toString(),
    total: json["total"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "from": from,
    "last_page": lastPage,
    "path": path,
    "per_page": perPage,
    "to": to,
    "total": total,
  };
}
