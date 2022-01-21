import 'dart:convert';

ResAddSellReturn resAddSellReturnFromJson(String str) =>
    ResAddSellReturn.fromJson(json.decode(str));

String resAddSellReturnToJson(ResAddSellReturn data) =>
    json.encode(data.toJson());

class ResAddSellReturn {
  ResAddSellReturn({
    required this.invoiceNo,
    required this.discountType,
    required this.discountAmount,
    required this.taxId,
    required this.taxAmount,
    required this.totalBeforeTax,
    required this.finalTotal,
    required this.transactionDate,
    required this.businessId,
    required this.locationId,
    required this.contactId,
    required this.customerGroupId,
    required this.type,
    required this.status,
    required this.createdBy,
    required this.returnParentId,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  String invoiceNo;
  String discountType;
  String discountAmount;
  String taxId;
  String taxAmount;
  String totalBeforeTax;
  String finalTotal;
  String transactionDate;
  String businessId;
  String locationId;
  String contactId;
  String customerGroupId;
  String type;
  String status;
  String createdBy;
  String returnParentId;
  String updatedAt;
  String createdAt;
  String id;

  factory ResAddSellReturn.fromJson(Map<String, dynamic> json) =>
      ResAddSellReturn(
        invoiceNo: json["invoice_no"].toString(),
        discountType: json["discount_type"].toString(),
        discountAmount: json["discount_amount"].toString(),
        taxId: json["tax_id"].toString(),
        taxAmount: json["tax_amount"].toString(),
        totalBeforeTax: json["total_before_tax"].toString(),
        finalTotal: json["final_total"].toString(),
        transactionDate: json["transaction_date"].toString(),
        businessId: json["business_id"].toString(),
        locationId: json["location_id"].toString(),
        contactId: json["contact_id"].toString(),
        customerGroupId: json["customer_group_id"].toString(),
        type: json["type"].toString(),
        status: json["status"].toString(),
        createdBy: json["created_by"].toString(),
        returnParentId: json["return_parent_id"].toString(),
        updatedAt: json["updated_at"].toString(),
        createdAt: json["created_at"].toString(),
        id: json["id"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "invoice_no": invoiceNo,
        "discount_type": discountType,
        "discount_amount": discountAmount,
        "tax_id": taxId,
        "tax_amount": taxAmount,
        "total_before_tax": totalBeforeTax,
        "final_total": finalTotal,
        "transaction_date": transactionDate,
        "business_id": businessId,
        "location_id": locationId,
        "contact_id": contactId,
        "customer_group_id": customerGroupId,
        "type": type,
        "status": status,
        "created_by": createdBy,
        "return_parent_id": returnParentId,
        "updated_at": updatedAt,
        "created_at": createdAt,
        "id": id,
      };
}
