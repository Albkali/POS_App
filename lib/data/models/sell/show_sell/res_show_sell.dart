// // To parse this JSON data, do
// //
// //     final resShowSell = resShowSellFromJson(jsonString);
//
// import 'package:meta/meta.dart';
// import 'dart:convert';
//
// ResShowSell resShowSellFromJson(String str) =>
//     ResShowSell.fromJson(json.decode(str));
//
// String resShowSellToJson(ResShowSell data) => json.encode(data.toJson());
//
// class ResShowSell {
//   ResShowSell({
//     required this.data,
//     // this.links,
//     // required this.meta,
//   });
//
//   List<SellItem> data;
//   // Links? links;
//   // Meta meta;
//
//   factory ResShowSell.fromJson(Map<String, dynamic> json) => ResShowSell(
//         data:
//             List<SellItem>.from(json["data"].map((x) => SellItem.fromJson(x))),
//         // links: Links.fromJson(json["links"]),
//         // meta: Meta.fromJson(json["meta"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//         // "links": links?.toJson(),
//         // "meta": meta.toJson(),
//       };
// }
//
// class SellItem {
//   SellItem({
//     required this.id,
//     required this.businessId,
//     required this.locationId,
//     required this.resTableId,
//     required this.resWaiterId,
//     required this.resOrderStatus,
//     required this.type,
//     required this.subType,
//     required this.status,
//     required this.subStatus,
//     required this.isQuotation,
//     required this.paymentStatus,
//     required this.adjustmentType,
//     required this.contactId,
//     required this.customerGroupId,
//     required this.invoiceNo,
//     required this.refNo,
//     required this.source,
//     required this.subscriptionNo,
//     required this.subscriptionRepeatOn,
//     required this.transactionDate,
//     required this.totalBeforeTax,
//     required this.taxId,
//     required this.taxAmount,
//     required this.discountType,
//     required this.discountAmount,
//     required this.rpRedeemed,
//     required this.rpRedeemedAmount,
//     required this.shippingDetails,
//     required this.shippingAddress,
//     required this.shippingStatus,
//     required this.deliveredTo,
//     required this.shippingCharges,
//     required this.shippingCustomField1,
//     required this.shippingCustomField2,
//     required this.shippingCustomField3,
//     required this.shippingCustomField4,
//     required this.shippingCustomField5,
//     required this.additionalNotes,
//     required this.staffNote,
//     required this.isExport,
//     required this.exportCustomFieldsInfo,
//     required this.roundOffAmount,
//     required this.additionalExpenseKey1,
//     required this.additionalExpenseValue1,
//     required this.additionalExpenseKey2,
//     required this.additionalExpenseValue2,
//     required this.additionalExpenseKey3,
//     required this.additionalExpenseValue3,
//     required this.additionalExpenseKey4,
//     required this.additionalExpenseValue4,
//     required this.finalTotal,
//     required this.expenseCategoryId,
//     required this.expenseFor,
//     required this.commissionAgent,
//     required this.document,
//     required this.isDirectSale,
//     required this.isSuspend,
//     required this.exchangeRate,
//     required this.totalAmountRecovered,
//     required this.transferParentId,
//     required this.returnParentId,
//     required this.openingStockProductId,
//     required this.createdBy,
//     required this.woocommerceOrderId,
//     required this.mfgParentProductionPurchaseId,
//     required this.mfgWastedUnits,
//     required this.mfgProductionCost,
//     required this.mfgIsFinal,
//     required this.essentialsDuration,
//     required this.essentialsDurationUnit,
//     required this.essentialsAmountPerUnitDuration,
//     required this.essentialsAllowances,
//     required this.essentialsDeductions,
//     required this.preferPaymentMethod,
//     required this.preferPaymentAccount,
//     required this.salesOrderIds,
//     required this.purchaseOrderIds,
//     required this.customField1,
//     required this.customField2,
//     required this.customField3,
//     required this.customField4,
//     required this.importBatch,
//     required this.importTime,
//     required this.typesOfServiceId,
//     required this.packingCharge,
//     required this.packingChargeType,
//     required this.serviceCustomField1,
//     required this.serviceCustomField2,
//     required this.serviceCustomField3,
//     required this.serviceCustomField4,
//     required this.serviceCustomField5,
//     required this.serviceCustomField6,
//     required this.isCreatedFromApi,
//     required this.rpEarned,
//     required this.orderAddresses,
//     required this.isRecurring,
//     required this.recurInterval,
//     required this.recurIntervalType,
//     required this.recurRepetitions,
//     required this.recurStoppedOn,
//     required this.recurParentId,
//     required this.invoiceToken,
//     required this.payTermNumber,
//     required this.payTermType,
//     required this.sellingPriceGroupId,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.sellLines,
//     required this.paymentLines,
//     required this.invoiceUrl,
//     required this.paymentLink,
//      this.contact,
//   });
//
//   String id;
//   String businessId;
//   String locationId;
//   String resTableId;
//   String resWaiterId;
//   String resOrderStatus;
//   String type;
//   String subType;
//   String status;
//   String subStatus;
//   String isQuotation;
//   String paymentStatus;
//   String adjustmentType;
//   String contactId;
//   String customerGroupId;
//   String invoiceNo;
//   String refNo;
//   String source;
//   String subscriptionNo;
//   String subscriptionRepeatOn;
//   DateTime transactionDate;
//   String totalBeforeTax;
//   String taxId;
//   String taxAmount;
//   String discountType;
//   String discountAmount;
//   String rpRedeemed;
//   String rpRedeemedAmount;
//   String shippingDetails;
//   String shippingAddress;
//   String shippingStatus;
//   String deliveredTo;
//   String shippingCharges;
//   String shippingCustomField1;
//   String shippingCustomField2;
//   String shippingCustomField3;
//   String shippingCustomField4;
//   String shippingCustomField5;
//   String additionalNotes;
//   String staffNote;
//   String isExport;
//   String exportCustomFieldsInfo;
//   String roundOffAmount;
//   String additionalExpenseKey1;
//   String additionalExpenseValue1;
//   String additionalExpenseKey2;
//   String additionalExpenseValue2;
//   String additionalExpenseKey3;
//   String additionalExpenseValue3;
//   String additionalExpenseKey4;
//   String additionalExpenseValue4;
//   String finalTotal;
//   String expenseCategoryId;
//   String expenseFor;
//   String commissionAgent;
//   String document;
//   String isDirectSale;
//   String isSuspend;
//   String exchangeRate;
//   String totalAmountRecovered;
//   String transferParentId;
//   String returnParentId;
//   String openingStockProductId;
//   String createdBy;
//   String woocommerceOrderId;
//   String mfgParentProductionPurchaseId;
//   String mfgWastedUnits;
//   String mfgProductionCost;
//   String mfgIsFinal;
//   String essentialsDuration;
//   String essentialsDurationUnit;
//   String essentialsAmountPerUnitDuration;
//   String essentialsAllowances;
//   String essentialsDeductions;
//   String preferPaymentMethod;
//   String preferPaymentAccount;
//   String salesOrderIds;
//   String purchaseOrderIds;
//   String customField1;
//   String customField2;
//   String customField3;
//   String customField4;
//   String importBatch;
//   String importTime;
//   String typesOfServiceId;
//   String packingCharge;
//   String packingChargeType;
//   String serviceCustomField1;
//   String serviceCustomField2;
//   String serviceCustomField3;
//   String serviceCustomField4;
//   String serviceCustomField5;
//   String serviceCustomField6;
//   String isCreatedFromApi;
//   String rpEarned;
//   String orderAddresses;
//   String isRecurring;
//   String recurInterval;
//   String recurIntervalType;
//   String recurRepetitions;
//   String recurStoppedOn;
//   String recurParentId;
//   String invoiceToken;
//   String payTermNumber;
//   String payTermType;
//   String sellingPriceGroupId;
//   DateTime createdAt;
//   DateTime updatedAt;
//   List<SellLine> sellLines;
//   List<PaymentLine> paymentLines;
//   String invoiceUrl;
//   String paymentLink;
//   Contact? contact;
//
//   factory SellItem.fromJson(Map<String, dynamic> json) => SellItem(
//         id: json["id"].toString(),
//         businessId: json["business_id"].toString(),
//         locationId: json["location_id"].toString(),
//         resTableId: json["res_table_id"].toString(),
//         resWaiterId: json["res_waiter_id"].toString(),
//         resOrderStatus: json["res_order_status"].toString(),
//         type: json["type"].toString(),
//         subType: json["sub_type"].toString(),
//         status: json["status"].toString(),
//         subStatus: json["sub_status"].toString(),
//         isQuotation: json["is_quotation"].toString(),
//         paymentStatus: json["payment_status"].toString(),
//         adjustmentType: json["adjustment_type"].toString(),
//         contactId: json["contact_id"].toString(),
//         customerGroupId: json["customer_group_id"].toString(),
//         invoiceNo: json["invoice_no"].toString(),
//         refNo: json["ref_no"].toString(),
//         source: json["source"].toString(),
//         subscriptionNo: json["subscription_no"].toString(),
//         subscriptionRepeatOn: json["subscription_repeat_on"].toString(),
//         transactionDate: DateTime.parse(json["transaction_date"]),
//         totalBeforeTax: json["total_before_tax"].toString(),
//         taxId: json["tax_id"].toString(),
//         taxAmount: json["tax_amount"].toString(),
//         discountType: json["discount_type"].toString(),
//         discountAmount: json["discount_amount"].toString(),
//         rpRedeemed: json["rp_redeemed"].toString(),
//         rpRedeemedAmount: json["rp_redeemed_amount"].toString(),
//         shippingDetails: json["shipping_details"].toString(),
//         shippingAddress: json["shipping_address"].toString(),
//         shippingStatus: json["shipping_status"].toString(),
//         deliveredTo: json["delivered_to"].toString(),
//         shippingCharges: json["shipping_charges"].toString(),
//         shippingCustomField1: json["shipping_custom_field_1"].toString(),
//         shippingCustomField2: json["shipping_custom_field_2"].toString(),
//         shippingCustomField3: json["shipping_custom_field_3"].toString(),
//         shippingCustomField4: json["shipping_custom_field_4"].toString(),
//         shippingCustomField5: json["shipping_custom_field_5"].toString(),
//         additionalNotes: json["additional_notes"].toString(),
//         staffNote: json["staff_note"].toString(),
//         isExport: json["is_export"].toString(),
//         exportCustomFieldsInfo: json["export_custom_fields_info"].toString(),
//         roundOffAmount: json["round_off_amount"].toString(),
//         additionalExpenseKey1: json["additional_expense_key_1"].toString(),
//         additionalExpenseValue1: json["additional_expense_value_1"].toString(),
//         additionalExpenseKey2: json["additional_expense_key_2"].toString(),
//         additionalExpenseValue2: json["additional_expense_value_2"].toString(),
//         additionalExpenseKey3: json["additional_expense_key_3"].toString(),
//         additionalExpenseValue3: json["additional_expense_value_3"].toString(),
//         additionalExpenseKey4: json["additional_expense_key_4"].toString(),
//         additionalExpenseValue4: json["additional_expense_value_4"].toString(),
//         finalTotal: json["final_total"].toString(),
//         expenseCategoryId: json["expense_category_id"].toString(),
//         expenseFor: json["expense_for"].toString(),
//         commissionAgent: json["commission_agent"].toString(),
//         document: json["document"].toString(),
//         isDirectSale: json["is_direct_sale"].toString(),
//         isSuspend: json["is_suspend"].toString(),
//         exchangeRate: json["exchange_rate"].toString(),
//         totalAmountRecovered: json["total_amount_recovered"].toString(),
//         transferParentId: json["transfer_parent_id"].toString(),
//         returnParentId: json["return_parent_id"].toString(),
//         openingStockProductId: json["opening_stock_product_id"].toString(),
//         createdBy: json["created_by"].toString(),
//         woocommerceOrderId: json["woocommerce_order_id"].toString(),
//         mfgParentProductionPurchaseId:
//             json["mfg_parent_production_purchase_id"].toString(),
//         mfgWastedUnits: json["mfg_wasted_units"].toString(),
//         mfgProductionCost: json["mfg_production_cost"].toString(),
//         mfgIsFinal: json["mfg_is_final"].toString(),
//         essentialsDuration: json["essentials_duration"].toString(),
//         essentialsDurationUnit: json["essentials_duration_unit"].toString(),
//         essentialsAmountPerUnitDuration:
//             json["essentials_amount_per_unit_duration"].toString(),
//         essentialsAllowances: json["essentials_allowances"].toString(),
//         essentialsDeductions: json["essentials_deductions"].toString(),
//         preferPaymentMethod: json["prefer_payment_method"].toString(),
//         preferPaymentAccount: json["prefer_payment_account"].toString(),
//         salesOrderIds: json["sales_order_ids"].toString(),
//         purchaseOrderIds: json["purchase_order_ids"].toString(),
//         customField1: json["custom_field_1"].toString(),
//         customField2: json["custom_field_2"].toString(),
//         customField3: json["custom_field_3"].toString(),
//         customField4: json["custom_field_4"].toString(),
//         importBatch: json["import_batch"].toString(),
//         importTime: json["import_time"].toString(),
//         typesOfServiceId: json["types_of_service_id"].toString(),
//         packingCharge: json["packing_charge"].toString(),
//         packingChargeType: json["packing_charge_type"].toString(),
//         serviceCustomField1: json["service_custom_field_1"].toString(),
//         serviceCustomField2: json["service_custom_field_2"].toString(),
//         serviceCustomField3: json["service_custom_field_3"].toString(),
//         serviceCustomField4: json["service_custom_field_4"].toString(),
//         serviceCustomField5: json["service_custom_field_5"].toString(),
//         serviceCustomField6: json["service_custom_field_6"].toString(),
//         isCreatedFromApi: json["is_created_from_api"].toString(),
//         rpEarned: json["rp_earned"].toString(),
//         orderAddresses: json["order_addresses"].toString(),
//         isRecurring: json["is_recurring"].toString(),
//         recurInterval: json["recur_interval"].toString(),
//         recurIntervalType: json["recur_interval_type"].toString(),
//         recurRepetitions: json["recur_repetitions"].toString(),
//         recurStoppedOn: json["recur_stopped_on"].toString(),
//         recurParentId: json["recur_parent_id"].toString(),
//         invoiceToken: json["invoice_token"].toString(),
//         payTermNumber: json["pay_term_number"].toString(),
//         payTermType: json["pay_term_type"].toString(),
//         sellingPriceGroupId: json["selling_price_group_id"].toString(),
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         sellLines: List<SellLine>.from(
//             json["sell_lines"].map((x) => SellLine.fromJson(x))),
//         paymentLines: List<PaymentLine>.from(
//             json["payment_lines"].map((x) => PaymentLine.fromJson(x))),
//         invoiceUrl: json["invoice_url"],
//         paymentLink: json["payment_link"],
//     contact: json["contact"]
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "business_id": businessId,
//         "location_id": locationId,
//         "res_table_id": resTableId,
//         "res_waiter_id": resWaiterId,
//         "res_order_status": resOrderStatus,
//         "type": type,
//         "sub_type": subType,
//         "status": status,
//         "sub_status": subStatus,
//         "is_quotation": isQuotation,
//         "payment_status": paymentStatus,
//         "adjustment_type": adjustmentType,
//         "contact_id": contactId,
//         "customer_group_id": customerGroupId,
//         "invoice_no": invoiceNo,
//         "ref_no": refNo,
//         "source": source,
//         "subscription_no": subscriptionNo,
//         "subscription_repeat_on": subscriptionRepeatOn,
//         "transaction_date": transactionDate.toIso8601String(),
//         "total_before_tax": totalBeforeTax,
//         "tax_id": taxId,
//         "tax_amount": taxAmount,
//         "discount_type": discountType,
//         "discount_amount": discountAmount,
//         "rp_redeemed": rpRedeemed,
//         "rp_redeemed_amount": rpRedeemedAmount,
//         "shipping_details": shippingDetails,
//         "shipping_address": shippingAddress,
//         "shipping_status": shippingStatus,
//         "delivered_to": deliveredTo,
//         "shipping_charges": shippingCharges,
//         "shipping_custom_field_1": shippingCustomField1,
//         "shipping_custom_field_2": shippingCustomField2,
//         "shipping_custom_field_3": shippingCustomField3,
//         "shipping_custom_field_4": shippingCustomField4,
//         "shipping_custom_field_5": shippingCustomField5,
//         "additional_notes": additionalNotes,
//         "staff_note": staffNote,
//         "is_export": isExport,
//         "export_custom_fields_info": exportCustomFieldsInfo,
//         "round_off_amount": roundOffAmount,
//         "additional_expense_key_1": additionalExpenseKey1,
//         "additional_expense_value_1": additionalExpenseValue1,
//         "additional_expense_key_2": additionalExpenseKey2,
//         "additional_expense_value_2": additionalExpenseValue2,
//         "additional_expense_key_3": additionalExpenseKey3,
//         "additional_expense_value_3": additionalExpenseValue3,
//         "additional_expense_key_4": additionalExpenseKey4,
//         "additional_expense_value_4": additionalExpenseValue4,
//         "final_total": finalTotal,
//         "expense_category_id": expenseCategoryId,
//         "expense_for": expenseFor,
//         "commission_agent": commissionAgent,
//         "document": document,
//         "is_direct_sale": isDirectSale,
//         "is_suspend": isSuspend,
//         "exchange_rate": exchangeRate,
//         "total_amount_recovered": totalAmountRecovered,
//         "transfer_parent_id": transferParentId,
//         "return_parent_id": returnParentId,
//         "opening_stock_product_id": openingStockProductId,
//         "created_by": createdBy,
//         "woocommerce_order_id": woocommerceOrderId,
//         "mfg_parent_production_purchase_id": mfgParentProductionPurchaseId,
//         "mfg_wasted_units": mfgWastedUnits,
//         "mfg_production_cost": mfgProductionCost,
//         "mfg_is_final": mfgIsFinal,
//         "essentials_duration": essentialsDuration,
//         "essentials_duration_unit": essentialsDurationUnit,
//         "essentials_amount_per_unit_duration": essentialsAmountPerUnitDuration,
//         "essentials_allowances": essentialsAllowances,
//         "essentials_deductions": essentialsDeductions,
//         "prefer_payment_method": preferPaymentMethod,
//         "prefer_payment_account": preferPaymentAccount,
//         "sales_order_ids": salesOrderIds,
//         "purchase_order_ids": purchaseOrderIds,
//         "custom_field_1": customField1,
//         "custom_field_2": customField2,
//         "custom_field_3": customField3,
//         "custom_field_4": customField4,
//         "import_batch": importBatch,
//         "import_time": importTime,
//         "types_of_service_id": typesOfServiceId,
//         "packing_charge": packingCharge,
//         "packing_charge_type": packingChargeType,
//         "service_custom_field_1": serviceCustomField1,
//         "service_custom_field_2": serviceCustomField2,
//         "service_custom_field_3": serviceCustomField3,
//         "service_custom_field_4": serviceCustomField4,
//         "service_custom_field_5": serviceCustomField5,
//         "service_custom_field_6": serviceCustomField6,
//         "is_created_from_api": isCreatedFromApi,
//         "rp_earned": rpEarned,
//         "order_addresses": orderAddresses,
//         "is_recurring": isRecurring,
//         "recur_interval": recurInterval,
//         "recur_interval_type": recurIntervalType,
//         "recur_repetitions": recurRepetitions,
//         "recur_stopped_on": recurStoppedOn,
//         "recur_parent_id": recurParentId,
//         "invoice_token": invoiceToken,
//         "pay_term_number": payTermNumber,
//         "pay_term_type": payTermType,
//         "selling_price_group_id": sellingPriceGroupId,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//         "sell_lines": List<dynamic>.from(sellLines.map((x) => x.toJson())),
//         "payment_lines":
//             List<dynamic>.from(paymentLines.map((x) => x.toJson())),
//         "invoice_url": invoiceUrl,
//         "payment_link": paymentLink,
//         "contact": contact,
//       };
// }
//
// class PaymentLine {
//   PaymentLine({
//     required this.id,
//     required this.transactionId,
//     required this.businessId,
//     required this.isReturn,
//     required this.amount,
//     required this.method,
//     required this.transactionNo,
//     required this.cardTransactionNumber,
//     required this.cardNumber,
//     required this.cardType,
//     required this.cardHolderName,
//     required this.cardMonth,
//     required this.cardYear,
//     required this.cardSecurity,
//     required this.chequeNumber,
//     required this.bankAccountNumber,
//     required this.paidOn,
//     required this.createdBy,
//     required this.paidThroughLink,
//     required this.gateway,
//     required this.isAdvance,
//     required this.paymentFor,
//     required this.parentId,
//     required this.note,
//     required this.document,
//     required this.paymentRefNo,
//     required this.accountId,
//     required this.createdAt,
//     required this.updatedAt,
//   });
//
//   String id;
//   String transactionId;
//   String businessId;
//   String isReturn;
//   String amount;
//   String method;
//   String transactionNo;
//   String cardTransactionNumber;
//   String cardNumber;
//   String cardType;
//   String cardHolderName;
//   String cardMonth;
//   String cardYear;
//   String cardSecurity;
//   String chequeNumber;
//   String bankAccountNumber;
//   String paidOn;
//   String createdBy;
//   String paidThroughLink;
//   String gateway;
//   String isAdvance;
//   String paymentFor;
//   String parentId;
//   String note;
//   String document;
//   String paymentRefNo;
//   String accountId;
//   String createdAt;
//   String updatedAt;
//
//   factory PaymentLine.fromJson(Map<String, dynamic> json) => PaymentLine(
//         id: json["id"].toString(),
//         transactionId: json["transaction_id"].toString(),
//         businessId: json["business_id"].toString(),
//         isReturn: json["is_return"].toString(),
//         amount: json["amount"].toString(),
//         method: json["method"].toString(),
//         transactionNo: json["transaction_no"].toString(),
//         cardTransactionNumber: json["card_transaction_number"].toString(),
//         cardNumber: json["card_number"].toString(),
//         cardType: json["card_type"].toString(),
//         cardHolderName: json["card_holder_name"].toString(),
//         cardMonth: json["card_month"].toString(),
//         cardYear: json["card_year"].toString(),
//         cardSecurity: json["card_security"].toString(),
//         chequeNumber: json["cheque_number"].toString(),
//         bankAccountNumber: json["bank_account_number"].toString(),
//         paidOn: json["paid_on"].toString(),
//         createdBy: json["created_by"].toString(),
//         paidThroughLink: json["paid_through_link"].toString(),
//         gateway: json["gateway"].toString(),
//         isAdvance: json["is_advance"].toString(),
//         paymentFor: json["payment_for"].toString(),
//         parentId: json["parent_id"].toString(),
//         note: json["note"].toString(),
//         document: json["document"].toString(),
//         paymentRefNo: json["payment_ref_no"].toString(),
//         accountId: json["account_id"].toString(),
//         createdAt: json["created_at"].toString(),
//         updatedAt: json["updated_at"].toString(),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "transaction_id": transactionId,
//         "business_id": businessId,
//         "is_return": isReturn,
//         "amount": amount,
//         "method": method,
//         "transaction_no": transactionNo,
//         "card_transaction_number": cardTransactionNumber,
//         "card_number": cardNumber,
//         "card_type": cardType,
//         "card_holder_name": cardHolderName,
//         "card_month": cardMonth,
//         "card_year": cardYear,
//         "card_security": cardSecurity,
//         "cheque_number": chequeNumber,
//         "bank_account_number": bankAccountNumber,
//         "paid_on": paidOn,
//         "created_by": createdBy,
//         "paid_through_link": paidThroughLink,
//         "gateway": gateway,
//         "is_advance": isAdvance,
//         "payment_for": paymentFor,
//         "parent_id": parentId,
//         "note": note,
//         "document": document,
//         "payment_ref_no": paymentRefNo,
//         "account_id": accountId,
//         "created_at": createdAt,
//         "updated_at": updatedAt,
//       };
// }
//
// class SellLine {
//   SellLine({
//     required this.id,
//     required this.transactionId,
//     required this.productId,
//     required this.variationId,
//     required this.quantity,
//     required this.mfgWastePercent,
//     required this.quantityReturned,
//     required this.unitPriceBeforeDiscount,
//     required this.unitPrice,
//     required this.lineDiscountType,
//     required this.lineDiscountAmount,
//     required this.unitPriceIncTax,
//     required this.itemTax,
//     required this.taxId,
//     required this.discountId,
//     required this.lotNoLineId,
//     required this.sellLineNote,
//     required this.woocommerceLineItemsId,
//     required this.soLineId,
//     required this.soQuantityInvoiced,
//     required this.resServiceStaffId,
//     required this.resLineOrderStatus,
//     required this.parentSellLineId,
//     required this.childrenType,
//     required this.subUnitId,
//     required this.createdAt,
//     required this.updatedAt,
//   });
//
//   String id;
//   String transactionId;
//   String productId;
//   String variationId;
//   String quantity;
//   String mfgWastePercent;
//   String quantityReturned;
//   String unitPriceBeforeDiscount;
//   String unitPrice;
//   String lineDiscountType;
//   String lineDiscountAmount;
//   String unitPriceIncTax;
//   String itemTax;
//   String taxId;
//   String discountId;
//   String lotNoLineId;
//   String sellLineNote;
//   String woocommerceLineItemsId;
//   String soLineId;
//   String soQuantityInvoiced;
//   String resServiceStaffId;
//   String resLineOrderStatus;
//   String parentSellLineId;
//   String childrenType;
//   String subUnitId;
//   String createdAt;
//   String updatedAt;
//
//   factory SellLine.fromJson(Map<String, dynamic> json) => SellLine(
//         id: json["id"].toString(),
//         transactionId: json["transaction_id"].toString(),
//         productId: json["product_id"].toString(),
//         variationId: json["variation_id"].toString(),
//         quantity: json["quantity"].toString(),
//         mfgWastePercent: json["mfg_waste_percent"].toString(),
//         quantityReturned: json["quantity_returned"].toString(),
//         unitPriceBeforeDiscount: json["unit_price_before_discount"].toString(),
//         unitPrice: json["unit_price"].toString(),
//         lineDiscountType: json["line_discount_type"].toString(),
//         lineDiscountAmount: json["line_discount_amount"].toString(),
//         unitPriceIncTax: json["unit_price_inc_tax"].toString(),
//         itemTax: json["item_tax"].toString(),
//         taxId: json["tax_id"].toString(),
//         discountId: json["discount_id"].toString(),
//         lotNoLineId: json["lot_no_line_id"].toString(),
//         sellLineNote: json["sell_line_note"].toString(),
//         woocommerceLineItemsId: json["woocommerce_line_items_id"].toString(),
//         soLineId: json["so_line_id"].toString(),
//         soQuantityInvoiced: json["so_quantity_invoiced"].toString(),
//         resServiceStaffId: json["res_service_staff_id"].toString(),
//         resLineOrderStatus: json["res_line_order_status"].toString(),
//         parentSellLineId: json["parent_sell_line_id"].toString(),
//         childrenType: json["children_type"].toString(),
//         subUnitId: json["sub_unit_id"].toString(),
//         createdAt: json["created_at"].toString(),
//         updatedAt: json["updated_at"].toString(),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "transaction_id": transactionId,
//         "product_id": productId,
//         "variation_id": variationId,
//         "quantity": quantity,
//         "mfg_waste_percent": mfgWastePercent,
//         "quantity_returned": quantityReturned,
//         "unit_price_before_discount": unitPriceBeforeDiscount,
//         "unit_price": unitPrice,
//         "line_discount_type": lineDiscountType,
//         "line_discount_amount": lineDiscountAmount,
//         "unit_price_inc_tax": unitPriceIncTax,
//         "item_tax": itemTax,
//         "tax_id": taxId,
//         "discount_id": discountId,
//         "lot_no_line_id": lotNoLineId,
//         "sell_line_note": sellLineNote,
//         "woocommerce_line_items_id": woocommerceLineItemsId,
//         "so_line_id": soLineId,
//         "so_quantity_invoiced": soQuantityInvoiced,
//         "res_service_staff_id": resServiceStaffId,
//         "res_line_order_status": resLineOrderStatus,
//         "parent_sell_line_id": parentSellLineId,
//         "children_type": childrenType,
//         "sub_unit_id": subUnitId,
//         "created_at": createdAt,
//         "updated_at": updatedAt,
//       };
// }
//
// // class Links {
// //   Links({
// //      this.first,
// //      this.last,
// //      this.prev,
// //      this.next,
// //   });
// //
// //   String? first;
// //   String? last;
// //   String? prev;
// //   String? next;
// //
// //   factory Links.fromJson(Map<String, dynamic> json) => Links(
// //     first: json["first"].toString(),
// //     last: json["last"].toString(),
// //     prev: json["prev"].toString(),
// //     next: json["next"].toString(),
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "first": first,
// //     "last": last,
// //     "prev": prev,
// //     "next": next,
// //   };
// // }
//
// class Meta {
//   Meta({
//     required this.currentPage,
//     required this.from,
//     required this.lastPage,
//     required this.path,
//     required this.perPage,
//     required this.to,
//     required this.total,
//   });
//
//   String currentPage;
//   String from;
//   String lastPage;
//   String path;
//   String perPage;
//   String to;
//   String total;
//
//   factory Meta.fromJson(Map<String, dynamic> json) => Meta(
//         currentPage: json["current_page"].toString(),
//         from: json["from"].toString(),
//         lastPage: json["last_page"].toString(),
//         path: json["path"].toString(),
//         perPage: json["per_page"].toString(),
//         to: json["to"].toString(),
//         total: json["total"].toString(),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "current_page": currentPage,
//         "from": from,
//         "last_page": lastPage,
//         "path": path,
//         "per_page": perPage,
//         "to": to,
//         "total": total,
//       };
// }
//
// class Contact {
//  String? id;
//  String? businessId;
//  String? type;
//  String? supplierBusinessName;
//  String? name;
//  String? prefix;
//  String? firstName;
//  String? middleName;
//  String? lastName;
//  String? email;
//  String? contactId;
//  String? contactStatus;
//  String? taxNumber;
//  String? city;
//  String? state;
//  String? country;
//  String? addressLine1;
//  String? addressLine2;
//  String? zipCode;
//  String? dob;
//  String? mobile;
//  String? landline;
//  String? alternateNumber;
//  String? payTermNumber;
//  String? payTermType;
//  String? creditLimit;
//  String? createdBy;
//  String? balance;
//  String? totalRp;
//  String? totalRpUsed;
//  String? totalRpExpired;
//  String? isDefault;
//  String? shippingAddress;
//  String? shippingCustomFieldDetails;
//  String? isExport;
//  String? exportCustomField1;
//  String? exportCustomField2;
//  String? exportCustomField3;
//  String? exportCustomField4;
//  String? exportCustomField5;
//  String? exportCustomField6;
//  String? position;
//  String? customerGroupId;
//  String? customField1;
//  String? customField2;
//  String? customField3;
//  String? customField4;
//  String? customField5;
//  String? customField6;
//  String? customField7;
//  String? customField8;
//  String? customField9;
//  String? customField10;
//  String? deletedAt;
//  String? createdAt;
//  String? updatedAt;
//
//   Contact(
//       {this.id,
//       this.businessId,
//       this.type,
//       this.supplierBusinessName,
//       this.name,
//       this.prefix,
//       this.firstName,
//       this.middleName,
//       this.lastName,
//       this.email,
//       this.contactId,
//       this.contactStatus,
//       this.taxNumber,
//       this.city,
//       this.state,
//       this.country,
//       this.addressLine1,
//       this.addressLine2,
//       this.zipCode,
//       this.dob,
//       this.mobile,
//       this.landline,
//       this.alternateNumber,
//       this.payTermNumber,
//       this.payTermType,
//       this.creditLimit,
//       this.createdBy,
//       this.balance,
//       this.totalRp,
//       this.totalRpUsed,
//       this.totalRpExpired,
//       this.isDefault,
//       this.shippingAddress,
//       this.shippingCustomFieldDetails,
//       this.isExport,
//       this.exportCustomField1,
//       this.exportCustomField2,
//       this.exportCustomField3,
//       this.exportCustomField4,
//       this.exportCustomField5,
//       this.exportCustomField6,
//       this.position,
//       this.customerGroupId,
//       this.customField1,
//       this.customField2,
//       this.customField3,
//       this.customField4,
//       this.customField5,
//       this.customField6,
//       this.customField7,
//       this.customField8,
//       this.customField9,
//       this.customField10,
//       this.deletedAt,
//       this.createdAt,
//       this.updatedAt});
//
//   Contact.fromJson(Map<String, dynamic> json) {
//     id = json['id'].toString();
//     businessId = json['business_id'].toString();
//     type = json['type'].toString();
//     supplierBusinessName = json['supplier_business_name'].toString();
//     name = json['name'].toString();
//     prefix = json['prefix'].toString();
//     firstName = json['first_name'].toString();
//     middleName = json['middle_name'].toString();
//     lastName = json['last_name'].toString();
//     email = json['email'].toString();
//     contactId = json['contact_id'].toString();
//     contactStatus = json['contact_status'].toString();
//     taxNumber = json['tax_number'].toString();
//     city = json['city'].toString();
//     state = json['state'].toString();
//     country = json['country'].toString();
//     addressLine1 = json['address_line_1'].toString();
//     addressLine2 = json['address_line_2'].toString();
//     zipCode = json['zip_code'].toString();
//     dob = json['dob'].toString();
//     mobile = json['mobile'].toString();
//     landline = json['landline'].toString();
//     alternateNumber = json['alternate_number'].toString();
//     payTermNumber = json['pay_term_number'].toString();
//     payTermType = json['pay_term_type'].toString();
//     creditLimit = json['credit_limit'].toString();
//     createdBy = json['created_by'].toString();
//     balance = json['balance'].toString();
//     totalRp = json['total_rp'].toString();
//     totalRpUsed = json['total_rp_used'].toString();
//     totalRpExpired = json['total_rp_expired'].toString();
//     isDefault = json['is_default'].toString();
//     shippingAddress = json['shipping_address'].toString();
//     shippingCustomFieldDetails = json['shipping_custom_field_details'].toString();
//     isExport = json['is_export'].toString();
//     exportCustomField1 = json['export_custom_field_1'].toString();
//     exportCustomField2 = json['export_custom_field_2'].toString();
//     exportCustomField3 = json['export_custom_field_3'].toString();
//     exportCustomField4 = json['export_custom_field_4'].toString();
//     exportCustomField5 = json['export_custom_field_5'].toString();
//     exportCustomField6 = json['export_custom_field_6'].toString();
//     position = json['position'].toString();
//     customerGroupId = json['customer_group_id'].toString();
//     customField1 = json['custom_field1'].toString();
//     customField2 = json['custom_field2'].toString();
//     customField3 = json['custom_field3'].toString();
//     customField4 = json['custom_field4'].toString();
//     customField5 = json['custom_field5'].toString();
//     customField6 = json['custom_field6'].toString();
//     customField7 = json['custom_field7'].toString();
//     customField8 = json['custom_field8'].toString();
//     customField9 = json['custom_field9'].toString();
//     customField10 = json['custom_field10'].toString();
//     deletedAt = json['deleted_at'].toString();
//     createdAt = json['created_at'].toString();
//     updatedAt = json['updated_at'].toString();
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['business_id'] = this.businessId;
//     data['type'] = this.type;
//     data['supplier_business_name'] = this.supplierBusinessName;
//     data['name'] = this.name;
//     data['prefix'] = this.prefix;
//     data['first_name'] = this.firstName;
//     data['middle_name'] = this.middleName;
//     data['last_name'] = this.lastName;
//     data['email'] = this.email;
//     data['contact_id'] = this.contactId;
//     data['contact_status'] = this.contactStatus;
//     data['tax_number'] = this.taxNumber;
//     data['city'] = this.city;
//     data['state'] = this.state;
//     data['country'] = this.country;
//     data['address_line_1'] = this.addressLine1;
//     data['address_line_2'] = this.addressLine2;
//     data['zip_code'] = this.zipCode;
//     data['dob'] = this.dob;
//     data['mobile'] = this.mobile;
//     data['landline'] = this.landline;
//     data['alternate_number'] = this.alternateNumber;
//     data['pay_term_number'] = this.payTermNumber;
//     data['pay_term_type'] = this.payTermType;
//     data['credit_limit'] = this.creditLimit;
//     data['created_by'] = this.createdBy;
//     data['balance'] = this.balance;
//     data['total_rp'] = this.totalRp;
//     data['total_rp_used'] = this.totalRpUsed;
//     data['total_rp_expired'] = this.totalRpExpired;
//     data['is_default'] = this.isDefault;
//     data['shipping_address'] = this.shippingAddress;
//     data['shipping_custom_field_details'] = this.shippingCustomFieldDetails;
//     data['is_export'] = this.isExport;
//     data['export_custom_field_1'] = this.exportCustomField1;
//     data['export_custom_field_2'] = this.exportCustomField2;
//     data['export_custom_field_3'] = this.exportCustomField3;
//     data['export_custom_field_4'] = this.exportCustomField4;
//     data['export_custom_field_5'] = this.exportCustomField5;
//     data['export_custom_field_6'] = this.exportCustomField6;
//     data['position'] = this.position;
//     data['customer_group_id'] = this.customerGroupId;
//     data['custom_field1'] = this.customField1;
//     data['custom_field2'] = this.customField2;
//     data['custom_field3'] = this.customField3;
//     data['custom_field4'] = this.customField4;
//     data['custom_field5'] = this.customField5;
//     data['custom_field6'] = this.customField6;
//     data['custom_field7'] = this.customField7;
//     data['custom_field8'] = this.customField8;
//     data['custom_field9'] = this.customField9;
//     data['custom_field10'] = this.customField10;
//     data['deleted_at'] = this.deletedAt;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }

// class ResShowSell {
//   List<SellItem> data;
//
//   ResShowSell({required this.data});
//
//   ResShowSell.fromJson(Map<String, dynamic> json) {
//     if (json['data'] != null) {
//       data = <SellItem>[];
//       json['data'].forEach((v) {
//         data.add(new SellItem.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
class ResShowSell {
  ResShowSell({
    required this.data,
    // this.links,
    // required this.meta,
  });

  List<SellItem> data;

  // Links? links;
  // Meta meta;

  factory ResShowSell.fromJson(Map<String, dynamic> json) => ResShowSell(
        data:
            List<SellItem>.from(json["data"].map((x) => SellItem.fromJson(x))),
        // links: Links.fromJson(json["links"]),
        // meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        // "links": links?.toJson(),
        // "meta": meta.toJson(),
      };
}
class SellItem {
  String? id;
  String? businessId;
  String? locationId;
  String? resTableId;
  String? resWaiterId;
  String? resOrderStatus;
  String? type;
  String? subType;
  String? status;
  String? subStatus;
  String? isQuotation;
  String? paymentStatus;
  String? adjustmentType;
  String? contactId;
  String? customerGroupId;
  String? invoiceNo;
  String? refNo;
  String? source;
  String? subscriptionNo;
  String? subscriptionRepeatOn;
  String? transactionDate;
  String? totalBeforeTax;
  String? taxId;
  String? taxAmount;
  String? discountType;
  String? discountAmount;
  String? rpRedeemed;
  String? rpRedeemedAmount;
  String? shippingDetails;
  String? shippingAddress;
  String? shippingStatus;
  String? deliveredTo;
  String? shippingCharges;
  String? shippingCustomField1;
  String? shippingCustomField2;
  String? shippingCustomField3;
  String? shippingCustomField4;
  String? shippingCustomField5;
  String? additionalNotes;
  String? staffNote;
  String? isExport;
  String? exportCustomFieldsInfo;
  String? roundOffAmount;
  String? additionalExpenseKey1;
  String? additionalExpenseValue1;
  String? additionalExpenseKey2;
  String? additionalExpenseValue2;
  String? additionalExpenseKey3;
  String? additionalExpenseValue3;
  String? additionalExpenseKey4;
  String? additionalExpenseValue4;
  String? finalTotal;
  String? expenseCategoryId;
  String? expenseFor;
  String? commissionAgent;
  String? document;
  String? isDirectSale;
  String? isSuspend;
  String? exchangeRate;
  String? totalAmountRecovered;
  String? transferParentId;
  String? returnParentId;
  String? openingStockProductId;
  String? createdBy;
  String? woocommerceOrderId;
  String? mfgParentProductionPurchaseId;
  String? mfgWastedUnits;
  String? mfgProductionCost;
  String? mfgIsFinal;
  String? essentialsDuration;
  String? essentialsDurationUnit;
  String? essentialsAmountPerUnitDuration;
  String? essentialsAllowances;
  String? essentialsDeductions;
  String? preferPaymentMethod;
  String? preferPaymentAccount;
  String? salesOrderIds;
  String? purchaseOrderIds;
  String? customField1;
  String? customField2;
  String? customField3;
  String? customField4;
  String? importBatch;
  String? importTime;
  String? typesOfServiceId;
  String? packingCharge;
  String? packingChargeType;
  String? serviceCustomField1;
  String? serviceCustomField2;
  String? serviceCustomField3;
  String? serviceCustomField4;
  String? serviceCustomField5;
  String? serviceCustomField6;
  String? isCreatedFromApi;
  String? rpEarned;
  String? orderAddresses;
  String? isRecurring;
  String? recurInterval;
  String? recurIntervalType;
  String? recurRepetitions;
  String? recurStoppedOn;
  String? recurParentId;
  String? invoiceToken;
  String? payTermNumber;
  String? payTermType;
  String? sellingPriceGroupId;
  String? createdAt;
  String? updatedAt;
  List<SellLines>? sellLines;
  List<PaymentLines>? paymentLines;
  Contact? contact;
  String? invoiceUrl;
  String? paymentLink;

  SellItem(
      {this.id,
      this.businessId,
      this.locationId,
      this.resTableId,
      this.resWaiterId,
      this.resOrderStatus,
      this.type,
      this.subType,
      this.status,
      this.subStatus,
      this.isQuotation,
      this.paymentStatus,
      this.adjustmentType,
      this.contactId,
      this.customerGroupId,
      this.invoiceNo,
      this.refNo,
      this.source,
      this.subscriptionNo,
      this.subscriptionRepeatOn,
      this.transactionDate,
      this.totalBeforeTax,
      this.taxId,
      this.taxAmount,
      this.discountType,
      this.discountAmount,
      this.rpRedeemed,
      this.rpRedeemedAmount,
      this.shippingDetails,
      this.shippingAddress,
      this.shippingStatus,
      this.deliveredTo,
      this.shippingCharges,
      this.shippingCustomField1,
      this.shippingCustomField2,
      this.shippingCustomField3,
      this.shippingCustomField4,
      this.shippingCustomField5,
      this.additionalNotes,
      this.staffNote,
      this.isExport,
      this.exportCustomFieldsInfo,
      this.roundOffAmount,
      this.additionalExpenseKey1,
      this.additionalExpenseValue1,
      this.additionalExpenseKey2,
      this.additionalExpenseValue2,
      this.additionalExpenseKey3,
      this.additionalExpenseValue3,
      this.additionalExpenseKey4,
      this.additionalExpenseValue4,
      this.finalTotal,
      this.expenseCategoryId,
      this.expenseFor,
      this.commissionAgent,
      this.document,
      this.isDirectSale,
      this.isSuspend,
      this.exchangeRate,
      this.totalAmountRecovered,
      this.transferParentId,
      this.returnParentId,
      this.openingStockProductId,
      this.createdBy,
      this.woocommerceOrderId,
      this.mfgParentProductionPurchaseId,
      this.mfgWastedUnits,
      this.mfgProductionCost,
      this.mfgIsFinal,
      this.essentialsDuration,
      this.essentialsDurationUnit,
      this.essentialsAmountPerUnitDuration,
      this.essentialsAllowances,
      this.essentialsDeductions,
      this.preferPaymentMethod,
      this.preferPaymentAccount,
      this.salesOrderIds,
      this.purchaseOrderIds,
      this.customField1,
      this.customField2,
      this.customField3,
      this.customField4,
      this.importBatch,
      this.importTime,
      this.typesOfServiceId,
      this.packingCharge,
      this.packingChargeType,
      this.serviceCustomField1,
      this.serviceCustomField2,
      this.serviceCustomField3,
      this.serviceCustomField4,
      this.serviceCustomField5,
      this.serviceCustomField6,
      this.isCreatedFromApi,
      this.rpEarned,
      this.orderAddresses,
      this.isRecurring,
      this.recurInterval,
      this.recurIntervalType,
      this.recurRepetitions,
      this.recurStoppedOn,
      this.recurParentId,
      this.invoiceToken,
      this.payTermNumber,
      this.payTermType,
      this.sellingPriceGroupId,
      this.createdAt,
      this.updatedAt,
      this.sellLines,
      this.paymentLines,
      this.contact,
      this.invoiceUrl,
      this.paymentLink});

  SellItem.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    businessId = json['business_id'].toString();
    locationId = json['location_id'].toString();
    resTableId = json['res_table_id'].toString();
    resWaiterId = json['res_waiter_id'].toString();
    resOrderStatus = json['res_order_status'].toString();
    type = json['type'].toString();
    subType = json['sub_type'].toString();
    status = json['status'].toString();
    subStatus = json['sub_status'].toString();
    isQuotation = json['is_quotation'].toString();
    paymentStatus = json['payment_status'].toString();
    adjustmentType = json['adjustment_type'].toString();
    contactId = json['contact_id'].toString();
    customerGroupId = json['customer_group_id'].toString();
    invoiceNo = json['invoice_no'].toString();
    refNo = json['ref_no'].toString();
    source = json['source'].toString();
    subscriptionNo = json['subscription_no'].toString();
    subscriptionRepeatOn = json['subscription_repeat_on'].toString();
    transactionDate = json['transaction_date'].toString();
    totalBeforeTax = json['total_before_tax'].toString();
    taxId = json['tax_id'].toString();
    taxAmount = json['tax_amount'].toString();
    discountType = json['discount_type'].toString();
    discountAmount = json['discount_amount'].toString();
    rpRedeemed = json['rp_redeemed'].toString();
    rpRedeemedAmount = json['rp_redeemed_amount'].toString();
    shippingDetails = json['shipping_details'].toString();
    shippingAddress = json['shipping_address'].toString();
    shippingStatus = json['shipping_status'].toString();
    deliveredTo = json['delivered_to'].toString();
    shippingCharges = json['shipping_charges'].toString();
    shippingCustomField1 = json['shipping_custom_field_1'].toString();
    shippingCustomField2 = json['shipping_custom_field_2'].toString();
    shippingCustomField3 = json['shipping_custom_field_3'].toString();
    shippingCustomField4 = json['shipping_custom_field_4'].toString();
    shippingCustomField5 = json['shipping_custom_field_5'].toString();
    additionalNotes = json['additional_notes'].toString();
    staffNote = json['staff_note'].toString();
    isExport = json['is_export'].toString();
    exportCustomFieldsInfo = json['export_custom_fields_info'].toString();
    roundOffAmount = json['round_off_amount'].toString();
    additionalExpenseKey1 = json['additional_expense_key_1'].toString();
    additionalExpenseValue1 = json['additional_expense_value_1'].toString();
    additionalExpenseKey2 = json['additional_expense_key_2'].toString();
    additionalExpenseValue2 = json['additional_expense_value_2'].toString();
    additionalExpenseKey3 = json['additional_expense_key_3'].toString();
    additionalExpenseValue3 = json['additional_expense_value_3'].toString();
    additionalExpenseKey4 = json['additional_expense_key_4'].toString();
    additionalExpenseValue4 = json['additional_expense_value_4'].toString();
    finalTotal = json['final_total'].toString();
    expenseCategoryId = json['expense_category_id'].toString();
    expenseFor = json['expense_for'].toString();
    commissionAgent = json['commission_agent'].toString();
    document = json['document'].toString();
    isDirectSale = json['is_direct_sale'].toString();
    isSuspend = json['is_suspend'].toString();
    exchangeRate = json['exchange_rate'].toString();
    totalAmountRecovered = json['total_amount_recovered'].toString();
    transferParentId = json['transfer_parent_id'].toString();
    returnParentId = json['return_parent_id'].toString();
    openingStockProductId = json['opening_stock_product_id'].toString();
    createdBy = json['created_by'].toString();
    woocommerceOrderId = json['woocommerce_order_id'].toString();
    mfgParentProductionPurchaseId =
        json['mfg_parent_production_purchase_id'].toString();
    mfgWastedUnits = json['mfg_wasted_units'].toString();
    mfgProductionCost = json['mfg_production_cost'].toString();
    mfgIsFinal = json['mfg_is_final'].toString();
    essentialsDuration = json['essentials_duration'].toString();
    essentialsDurationUnit = json['essentials_duration_unit'].toString();
    essentialsAmountPerUnitDuration =
        json['essentials_amount_per_unit_duration'].toString();
    essentialsAllowances = json['essentials_allowances'].toString();
    essentialsDeductions = json['essentials_deductions'].toString();
    preferPaymentMethod = json['prefer_payment_method'].toString();
    preferPaymentAccount = json['prefer_payment_account'].toString();
    salesOrderIds = json['sales_order_ids'].toString();
    purchaseOrderIds = json['purchase_order_ids'].toString();
    customField1 = json['custom_field_1'].toString();
    customField2 = json['custom_field_2'].toString();
    customField3 = json['custom_field_3'].toString();
    customField4 = json['custom_field_4'].toString();
    importBatch = json['import_batch'].toString();
    importTime = json['import_time'].toString();
    typesOfServiceId = json['types_of_service_id'].toString();
    packingCharge = json['packing_charge'].toString();
    packingChargeType = json['packing_charge_type'].toString();
    serviceCustomField1 = json['service_custom_field_1'].toString();
    serviceCustomField2 = json['service_custom_field_2'].toString();
    serviceCustomField3 = json['service_custom_field_3'].toString();
    serviceCustomField4 = json['service_custom_field_4'].toString();
    serviceCustomField5 = json['service_custom_field_5'].toString();
    serviceCustomField6 = json['service_custom_field_6'].toString();
    isCreatedFromApi = json['is_created_from_api'].toString();
    rpEarned = json['rp_earned'].toString();
    orderAddresses = json['order_addresses'].toString();
    isRecurring = json['is_recurring'].toString();
    recurInterval = json['recur_interval'].toString();
    recurIntervalType = json['recur_interval_type'].toString();
    recurRepetitions = json['recur_repetitions'].toString();
    recurStoppedOn = json['recur_stopped_on'].toString();
    recurParentId = json['recur_parent_id'].toString();
    invoiceToken = json['invoice_token'].toString();
    payTermNumber = json['pay_term_number'].toString();
    payTermType = json['pay_term_type'].toString();
    sellingPriceGroupId = json['selling_price_group_id'].toString();
    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'].toString();
    if (json['sell_lines'] != null) {
      sellLines = <SellLines>[];
      json['sell_lines'].forEach((v) {
        sellLines!.add(new SellLines.fromJson(v));
      });
    }
    if (json['payment_lines'] != null) {
      paymentLines = <PaymentLines>[];
      json['payment_lines'].forEach((v) {
        paymentLines!.add(new PaymentLines.fromJson(v));
      });
    }
    contact =
        json['contact'] != null ? new Contact.fromJson(json['contact']) : null;
    invoiceUrl = json['invoice_url'];
    paymentLink = json['payment_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['business_id'] = this.businessId;
    data['location_id'] = this.locationId;
    data['res_table_id'] = this.resTableId;
    data['res_waiter_id'] = this.resWaiterId;
    data['res_order_status'] = this.resOrderStatus;
    data['type'] = this.type;
    data['sub_type'] = this.subType;
    data['status'] = this.status;
    data['sub_status'] = this.subStatus;
    data['is_quotation'] = this.isQuotation;
    data['payment_status'] = this.paymentStatus;
    data['adjustment_type'] = this.adjustmentType;
    data['contact_id'] = this.contactId;
    data['customer_group_id'] = this.customerGroupId;
    data['invoice_no'] = this.invoiceNo;
    data['ref_no'] = this.refNo;
    data['source'] = this.source;
    data['subscription_no'] = this.subscriptionNo;
    data['subscription_repeat_on'] = this.subscriptionRepeatOn;
    data['transaction_date'] = this.transactionDate;
    data['total_before_tax'] = this.totalBeforeTax;
    data['tax_id'] = this.taxId;
    data['tax_amount'] = this.taxAmount;
    data['discount_type'] = this.discountType;
    data['discount_amount'] = this.discountAmount;
    data['rp_redeemed'] = this.rpRedeemed;
    data['rp_redeemed_amount'] = this.rpRedeemedAmount;
    data['shipping_details'] = this.shippingDetails;
    data['shipping_address'] = this.shippingAddress;
    data['shipping_status'] = this.shippingStatus;
    data['delivered_to'] = this.deliveredTo;
    data['shipping_charges'] = this.shippingCharges;
    data['shipping_custom_field_1'] = this.shippingCustomField1;
    data['shipping_custom_field_2'] = this.shippingCustomField2;
    data['shipping_custom_field_3'] = this.shippingCustomField3;
    data['shipping_custom_field_4'] = this.shippingCustomField4;
    data['shipping_custom_field_5'] = this.shippingCustomField5;
    data['additional_notes'] = this.additionalNotes;
    data['staff_note'] = this.staffNote;
    data['is_export'] = this.isExport;
    data['export_custom_fields_info'] = this.exportCustomFieldsInfo;
    data['round_off_amount'] = this.roundOffAmount;
    data['additional_expense_key_1'] = this.additionalExpenseKey1;
    data['additional_expense_value_1'] = this.additionalExpenseValue1;
    data['additional_expense_key_2'] = this.additionalExpenseKey2;
    data['additional_expense_value_2'] = this.additionalExpenseValue2;
    data['additional_expense_key_3'] = this.additionalExpenseKey3;
    data['additional_expense_value_3'] = this.additionalExpenseValue3;
    data['additional_expense_key_4'] = this.additionalExpenseKey4;
    data['additional_expense_value_4'] = this.additionalExpenseValue4;
    data['final_total'] = this.finalTotal;
    data['expense_category_id'] = this.expenseCategoryId;
    data['expense_for'] = this.expenseFor;
    data['commission_agent'] = this.commissionAgent;
    data['document'] = this.document;
    data['is_direct_sale'] = this.isDirectSale;
    data['is_suspend'] = this.isSuspend;
    data['exchange_rate'] = this.exchangeRate;
    data['total_amount_recovered'] = this.totalAmountRecovered;
    data['transfer_parent_id'] = this.transferParentId;
    data['return_parent_id'] = this.returnParentId;
    data['opening_stock_product_id'] = this.openingStockProductId;
    data['created_by'] = this.createdBy;
    data['woocommerce_order_id'] = this.woocommerceOrderId;
    data['mfg_parent_production_purchase_id'] =
        this.mfgParentProductionPurchaseId;
    data['mfg_wasted_units'] = this.mfgWastedUnits;
    data['mfg_production_cost'] = this.mfgProductionCost;
    data['mfg_is_final'] = this.mfgIsFinal;
    data['essentials_duration'] = this.essentialsDuration;
    data['essentials_duration_unit'] = this.essentialsDurationUnit;
    data['essentials_amount_per_unit_duration'] =
        this.essentialsAmountPerUnitDuration;
    data['essentials_allowances'] = this.essentialsAllowances;
    data['essentials_deductions'] = this.essentialsDeductions;
    data['prefer_payment_method'] = this.preferPaymentMethod;
    data['prefer_payment_account'] = this.preferPaymentAccount;
    data['sales_order_ids'] = this.salesOrderIds;
    data['purchase_order_ids'] = this.purchaseOrderIds;
    data['custom_field_1'] = this.customField1;
    data['custom_field_2'] = this.customField2;
    data['custom_field_3'] = this.customField3;
    data['custom_field_4'] = this.customField4;
    data['import_batch'] = this.importBatch;
    data['import_time'] = this.importTime;
    data['types_of_service_id'] = this.typesOfServiceId;
    data['packing_charge'] = this.packingCharge;
    data['packing_charge_type'] = this.packingChargeType;
    data['service_custom_field_1'] = this.serviceCustomField1;
    data['service_custom_field_2'] = this.serviceCustomField2;
    data['service_custom_field_3'] = this.serviceCustomField3;
    data['service_custom_field_4'] = this.serviceCustomField4;
    data['service_custom_field_5'] = this.serviceCustomField5;
    data['service_custom_field_6'] = this.serviceCustomField6;
    data['is_created_from_api'] = this.isCreatedFromApi;
    data['rp_earned'] = this.rpEarned;
    data['order_addresses'] = this.orderAddresses;
    data['is_recurring'] = this.isRecurring;
    data['recur_interval'] = this.recurInterval;
    data['recur_interval_type'] = this.recurIntervalType;
    data['recur_repetitions'] = this.recurRepetitions;
    data['recur_stopped_on'] = this.recurStoppedOn;
    data['recur_parent_id'] = this.recurParentId;
    data['invoice_token'] = this.invoiceToken;
    data['pay_term_number'] = this.payTermNumber;
    data['pay_term_type'] = this.payTermType;
    data['selling_price_group_id'] = this.sellingPriceGroupId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.sellLines != null) {
      data['sell_lines'] = this.sellLines!.map((v) => v.toJson()).toList();
    }
    if (this.paymentLines != null) {
      data['payment_lines'] =
          this.paymentLines!.map((v) => v.toJson()).toList();
    }
    if (this.contact != null) {
      data['contact'] = this.contact!.toJson();
    }
    data['invoice_url'] = this.invoiceUrl;
    data['payment_link'] = this.paymentLink;
    return data;
  }
}

class SellLines {
  String? id;
  String? transactionId;
  String? productId;
  String? variationId;
  String? quantity;
  String? mfgWastePercent;
  String? quantityReturned;
  String? unitPriceBeforeDiscount;
  String? unitPrice;
  String? lineDiscountType;
  String? lineDiscountAmount;
  String? unitPriceIncTax;
  String? itemTax;
  String? taxId;
  String? discountId;
  String? lotNoLineId;
  String? sellLineNote;
  String? woocommerceLineItemsId;
  String? soLineId;
  String? soQuantityInvoiced;
  String? resServiceStaffId;
  String? resLineOrderStatus;
  String? parentSellLineId;
  String? childrenType;
  String? subUnitId;
  String? createdAt;
  String? updatedAt;

  SellLines(
      {this.id,
      this.transactionId,
      this.productId,
      this.variationId,
      this.quantity,
      this.mfgWastePercent,
      this.quantityReturned,
      this.unitPriceBeforeDiscount,
      this.unitPrice,
      this.lineDiscountType,
      this.lineDiscountAmount,
      this.unitPriceIncTax,
      this.itemTax,
      this.taxId,
      this.discountId,
      this.lotNoLineId,
      this.sellLineNote,
      this.woocommerceLineItemsId,
      this.soLineId,
      this.soQuantityInvoiced,
      this.resServiceStaffId,
      this.resLineOrderStatus,
      this.parentSellLineId,
      this.childrenType,
      this.subUnitId,
      this.createdAt,
      this.updatedAt});

  SellLines.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    transactionId = json['transaction_id'].toString();
    productId = json['product_id'].toString();
    variationId = json['variation_id'].toString();
    quantity = json['quantity'].toString();
    mfgWastePercent = json['mfg_waste_percent'].toString();
    quantityReturned = json['quantity_returned'].toString();
    unitPriceBeforeDiscount = json['unit_price_before_discount'].toString();
    unitPrice = json['unit_price'].toString();
    lineDiscountType = json['line_discount_type'].toString();
    lineDiscountAmount = json['line_discount_amount'].toString();
    unitPriceIncTax = json['unit_price_inc_tax'].toString();
    itemTax = json['item_tax'].toString();
    taxId = json['tax_id'].toString();
    discountId = json['discount_id'].toString();
    lotNoLineId = json['lot_no_line_id'].toString();
    sellLineNote = json['sell_line_note'].toString();
    woocommerceLineItemsId = json['woocommerce_line_items_id'].toString();
    soLineId = json['so_line_id'].toString();
    soQuantityInvoiced = json['so_quantity_invoiced'].toString();
    resServiceStaffId = json['res_service_staff_id'].toString();
    resLineOrderStatus = json['res_line_order_status'].toString();
    parentSellLineId = json['parent_sell_line_id'].toString();
    childrenType = json['children_type'].toString();
    subUnitId = json['sub_unit_id'].toString();
    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['transaction_id'] = this.transactionId;
    data['product_id'] = this.productId;
    data['variation_id'] = this.variationId;
    data['quantity'] = this.quantity;
    data['mfg_waste_percent'] = this.mfgWastePercent;
    data['quantity_returned'] = this.quantityReturned;
    data['unit_price_before_discount'] = this.unitPriceBeforeDiscount;
    data['unit_price'] = this.unitPrice;
    data['line_discount_type'] = this.lineDiscountType;
    data['line_discount_amount'] = this.lineDiscountAmount;
    data['unit_price_inc_tax'] = this.unitPriceIncTax;
    data['item_tax'] = this.itemTax;
    data['tax_id'] = this.taxId;
    data['discount_id'] = this.discountId;
    data['lot_no_line_id'] = this.lotNoLineId;
    data['sell_line_note'] = this.sellLineNote;
    data['woocommerce_line_items_id'] = this.woocommerceLineItemsId;
    data['so_line_id'] = this.soLineId;
    data['so_quantity_invoiced'] = this.soQuantityInvoiced;
    data['res_service_staff_id'] = this.resServiceStaffId;
    data['res_line_order_status'] = this.resLineOrderStatus;
    data['parent_sell_line_id'] = this.parentSellLineId;
    data['children_type'] = this.childrenType;
    data['sub_unit_id'] = this.subUnitId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class PaymentLines {
  String? id;
  String? transactionId;
  String? businessId;
  String? isReturn;
  String? amount;
  String? method;
  String? transactionNo;
  String? cardTransactionNumber;
  String? cardNumber;
  String? cardType;
  String? cardHolderName;
  String? cardMonth;
  String? cardYear;
  String? cardSecurity;
  String? chequeNumber;
  String? bankAccountNumber;
  String? paidOn;
  String? createdBy;
  String? paidThroughLink;
  String? gateway;
  String? isAdvance;
  String? paymentFor;
  String? parentId;
  String? note;
  String? document;
  String? paymentRefNo;
  String? accountId;
  String? createdAt;
  String? updatedAt;

  PaymentLines(
      {this.id,
      this.transactionId,
      this.businessId,
      this.isReturn,
      this.amount,
      this.method,
      this.transactionNo,
      this.cardTransactionNumber,
      this.cardNumber,
      this.cardType,
      this.cardHolderName,
      this.cardMonth,
      this.cardYear,
      this.cardSecurity,
      this.chequeNumber,
      this.bankAccountNumber,
      this.paidOn,
      this.createdBy,
      this.paidThroughLink,
      this.gateway,
      this.isAdvance,
      this.paymentFor,
      this.parentId,
      this.note,
      this.document,
      this.paymentRefNo,
      this.accountId,
      this.createdAt,
      this.updatedAt});

  PaymentLines.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    transactionId = json['transaction_id'].toString();
    businessId = json['business_id'].toString();
    isReturn = json['is_return'].toString();
    amount = json['amount'].toString();
    method = json['method'].toString();
    transactionNo = json['transaction_no'].toString();
    cardTransactionNumber = json['card_transaction_number'].toString();
    cardNumber = json['card_number'].toString();
    cardType = json['card_type'].toString();
    cardHolderName = json['card_holder_name'].toString();
    cardMonth = json['card_month'].toString();
    cardYear = json['card_year'].toString();
    cardSecurity = json['card_security'].toString();
    chequeNumber = json['cheque_number'].toString();
    bankAccountNumber = json['bank_account_number'].toString();
    paidOn = json['paid_on'].toString();
    createdBy = json['created_by'].toString();
    paidThroughLink = json['paid_through_link'].toString();
    gateway = json['gateway'].toString();
    isAdvance = json['is_advance'].toString();
    paymentFor = json['payment_for'].toString();
    parentId = json['parent_id'].toString();
    note = json['note'].toString();
    document = json['document'].toString();
    paymentRefNo = json['payment_ref_no'].toString();
    accountId = json['account_id'].toString();
    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['transaction_id'] = this.transactionId;
    data['business_id'] = this.businessId;
    data['is_return'] = this.isReturn;
    data['amount'] = this.amount;
    data['method'] = this.method;
    data['transaction_no'] = this.transactionNo;
    data['card_transaction_number'] = this.cardTransactionNumber;
    data['card_number'] = this.cardNumber;
    data['card_type'] = this.cardType;
    data['card_holder_name'] = this.cardHolderName;
    data['card_month'] = this.cardMonth;
    data['card_year'] = this.cardYear;
    data['card_security'] = this.cardSecurity;
    data['cheque_number'] = this.chequeNumber;
    data['bank_account_number'] = this.bankAccountNumber;
    data['paid_on'] = this.paidOn;
    data['created_by'] = this.createdBy;
    data['paid_through_link'] = this.paidThroughLink;
    data['gateway'] = this.gateway;
    data['is_advance'] = this.isAdvance;
    data['payment_for'] = this.paymentFor;
    data['parent_id'] = this.parentId;
    data['note'] = this.note;
    data['document'] = this.document;
    data['payment_ref_no'] = this.paymentRefNo;
    data['account_id'] = this.accountId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Contact {
  String? id;
  String? businessId;
  String? type;
  String? supplierBusinessName;
  String? name;
  String? prefix;
  String? firstName;
  String? middleName;
  String? lastName;
  String? email;
  String? contactId;
  String? contactStatus;
  String? taxNumber;
  String? city;
  String? state;
  String? country;
  String? addressLine1;
  String? addressLine2;
  String? zipCode;
  String? dob;
  String? mobile;
  String? landline;
  String? alternateNumber;
  String? payTermNumber;
  String? payTermType;
  String? creditLimit;
  String? createdBy;
  String? balance;
  String? totalRp;
  String? totalRpUsed;
  String? totalRpExpired;
  String? isDefault;
  String? shippingAddress;
  String? shippingCustomFieldDetails;
  String? isExport;
  String? exportCustomField1;
  String? exportCustomField2;
  String? exportCustomField3;
  String? exportCustomField4;
  String? exportCustomField5;
  String? exportCustomField6;
  String? position;
  String? customerGroupId;
  String? customField1;
  String? customField2;
  String? customField3;
  String? customField4;
  String? customField5;
  String? customField6;
  String? customField7;
  String? customField8;
  String? customField9;
  String? customField10;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;

  Contact(
      {this.id,
      this.businessId,
      this.type,
      this.supplierBusinessName,
      this.name,
      this.prefix,
      this.firstName,
      this.middleName,
      this.lastName,
      this.email,
      this.contactId,
      this.contactStatus,
      this.taxNumber,
      this.city,
      this.state,
      this.country,
      this.addressLine1,
      this.addressLine2,
      this.zipCode,
      this.dob,
      this.mobile,
      this.landline,
      this.alternateNumber,
      this.payTermNumber,
      this.payTermType,
      this.creditLimit,
      this.createdBy,
      this.balance,
      this.totalRp,
      this.totalRpUsed,
      this.totalRpExpired,
      this.isDefault,
      this.shippingAddress,
      this.shippingCustomFieldDetails,
      this.isExport,
      this.exportCustomField1,
      this.exportCustomField2,
      this.exportCustomField3,
      this.exportCustomField4,
      this.exportCustomField5,
      this.exportCustomField6,
      this.position,
      this.customerGroupId,
      this.customField1,
      this.customField2,
      this.customField3,
      this.customField4,
      this.customField5,
      this.customField6,
      this.customField7,
      this.customField8,
      this.customField9,
      this.customField10,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  Contact.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    businessId = json['business_id'].toString();
    type = json['type'].toString();
    supplierBusinessName = json['supplier_business_name'].toString();
    name = json['name'].toString();
    prefix = json['prefix'].toString();
    firstName = json['first_name'].toString();
    middleName = json['middle_name'].toString();
    lastName = json['last_name'].toString();
    email = json['email'].toString();
    contactId = json['contact_id'].toString();
    contactStatus = json['contact_status'].toString();
    taxNumber = json['tax_number'].toString();
    city = json['city'].toString();
    state = json['state'].toString();
    country = json['country'].toString();
    addressLine1 = json['address_line_1'].toString();
    addressLine2 = json['address_line_2'].toString();
    zipCode = json['zip_code'].toString();
    dob = json['dob'].toString();
    mobile = json['mobile'].toString();
    landline = json['landline'].toString();
    alternateNumber = json['alternate_number'].toString();
    payTermNumber = json['pay_term_number'].toString();
    payTermType = json['pay_term_type'].toString();
    creditLimit = json['credit_limit'].toString();
    createdBy = json['created_by'].toString();
    balance = json['balance'].toString();
    totalRp = json['total_rp'].toString();
    totalRpUsed = json['total_rp_used'].toString();
    totalRpExpired = json['total_rp_expired'].toString();
    isDefault = json['is_default'].toString();
    shippingAddress = json['shipping_address'].toString();
    shippingCustomFieldDetails =
        json['shipping_custom_field_details'].toString();
    isExport = json['is_export'].toString();
    exportCustomField1 = json['export_custom_field_1'].toString();
    exportCustomField2 = json['export_custom_field_2'].toString();
    exportCustomField3 = json['export_custom_field_3'].toString();
    exportCustomField4 = json['export_custom_field_4'].toString();
    exportCustomField5 = json['export_custom_field_5'].toString();
    exportCustomField6 = json['export_custom_field_6'].toString();
    position = json['position'].toString();
    customerGroupId = json['customer_group_id'].toString();
    customField1 = json['custom_field1'].toString();
    customField2 = json['custom_field2'].toString();
    customField3 = json['custom_field3'].toString();
    customField4 = json['custom_field4'].toString();
    customField5 = json['custom_field5'].toString();
    customField6 = json['custom_field6'].toString();
    customField7 = json['custom_field7'].toString();
    customField8 = json['custom_field8'].toString();
    customField9 = json['custom_field9'].toString();
    customField10 = json['custom_field10'].toString();
    deletedAt = json['deleted_at'].toString();
    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['business_id'] = this.businessId;
    data['type'] = this.type;
    data['supplier_business_name'] = this.supplierBusinessName;
    data['name'] = this.name;
    data['prefix'] = this.prefix;
    data['first_name'] = this.firstName;
    data['middle_name'] = this.middleName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['contact_id'] = this.contactId;
    data['contact_status'] = this.contactStatus;
    data['tax_number'] = this.taxNumber;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['address_line_1'] = this.addressLine1;
    data['address_line_2'] = this.addressLine2;
    data['zip_code'] = this.zipCode;
    data['dob'] = this.dob;
    data['mobile'] = this.mobile;
    data['landline'] = this.landline;
    data['alternate_number'] = this.alternateNumber;
    data['pay_term_number'] = this.payTermNumber;
    data['pay_term_type'] = this.payTermType;
    data['credit_limit'] = this.creditLimit;
    data['created_by'] = this.createdBy;
    data['balance'] = this.balance;
    data['total_rp'] = this.totalRp;
    data['total_rp_used'] = this.totalRpUsed;
    data['total_rp_expired'] = this.totalRpExpired;
    data['is_default'] = this.isDefault;
    data['shipping_address'] = this.shippingAddress;
    data['shipping_custom_field_details'] = this.shippingCustomFieldDetails;
    data['is_export'] = this.isExport;
    data['export_custom_field_1'] = this.exportCustomField1;
    data['export_custom_field_2'] = this.exportCustomField2;
    data['export_custom_field_3'] = this.exportCustomField3;
    data['export_custom_field_4'] = this.exportCustomField4;
    data['export_custom_field_5'] = this.exportCustomField5;
    data['export_custom_field_6'] = this.exportCustomField6;
    data['position'] = this.position;
    data['customer_group_id'] = this.customerGroupId;
    data['custom_field1'] = this.customField1;
    data['custom_field2'] = this.customField2;
    data['custom_field3'] = this.customField3;
    data['custom_field4'] = this.customField4;
    data['custom_field5'] = this.customField5;
    data['custom_field6'] = this.customField6;
    data['custom_field7'] = this.customField7;
    data['custom_field8'] = this.customField8;
    data['custom_field9'] = this.customField9;
    data['custom_field10'] = this.customField10;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
