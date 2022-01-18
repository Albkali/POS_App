// To parse this JSON data, do
//
//     final resUpdateReturnSell = resUpdateReturnSellFromJson(jsonString);

import 'dart:convert';

ResUpdateReturnSell resUpdateReturnSellFromJson(String str) =>
    ResUpdateReturnSell.fromJson(json.decode(str));

String resUpdateReturnSellToJson(ResUpdateReturnSell data) =>
    json.encode(data.toJson());

class ResUpdateReturnSell {
  ResUpdateReturnSell({
    required this.id,
    required this.businessId,
    required this.locationId,
    required this.resTableId,
    required this.resWaiterId,
    required this.resOrderStatus,
    required this.type,
    required this.subType,
    required this.status,
    required this.subStatus,
    required this.isQuotation,
    required this.paymentStatus,
    required this.adjustmentType,
    required this.contactId,
    required this.customerGroupId,
    required this.invoiceNo,
    required this.refNo,
    required this.source,
    required this.subscriptionNo,
    required this.subscriptionRepeatOn,
    required this.transactionDate,
    required this.totalBeforeTax,
    required this.taxId,
    required this.taxAmount,
    required this.discountType,
    required this.discountAmount,
    required this.rpRedeemed,
    required this.rpRedeemedAmount,
    required this.shippingDetails,
    required this.shippingAddress,
    required this.shippingStatus,
    required this.deliveredTo,
    required this.shippingCharges,
    required this.shippingCustomField1,
    required this.shippingCustomField2,
    required this.shippingCustomField3,
    required this.shippingCustomField4,
    required this.shippingCustomField5,
    required this.additionalNotes,
    required this.staffNote,
    required this.isExport,
    required this.exportCustomFieldsInfo,
    required this.roundOffAmount,
    required this.additionalExpenseKey1,
    required this.additionalExpenseValue1,
    required this.additionalExpenseKey2,
    required this.additionalExpenseValue2,
    required this.additionalExpenseKey3,
    required this.additionalExpenseValue3,
    required this.additionalExpenseKey4,
    required this.additionalExpenseValue4,
    required this.finalTotal,
    required this.expenseCategoryId,
    required this.expenseFor,
    required this.commissionAgent,
    required this.document,
    required this.isDirectSale,
    required this.isSuspend,
    required this.exchangeRate,
    required this.totalAmountRecovered,
    required this.transferParentId,
    required this.returnParentId,
    required this.openingStockProductId,
    required this.createdBy,
    required this.woocommerceOrderId,
    required this.mfgParentProductionPurchaseId,
    required this.mfgWastedUnits,
    required this.mfgProductionCost,
    required this.mfgIsFinal,
    required this.essentialsDuration,
    required this.essentialsDurationUnit,
    required this.essentialsAmountPerUnitDuration,
    required this.essentialsAllowances,
    required this.essentialsDeductions,
    required this.preferPaymentMethod,
    required this.preferPaymentAccount,
    required this.salesOrderIds,
    required this.purchaseOrderIds,
    required this.customField1,
    required this.customField2,
    required this.customField3,
    required this.customField4,
    required this.importBatch,
    required this.importTime,
    required this.typesOfServiceId,
    required this.packingCharge,
    required this.packingChargeType,
    required this.serviceCustomField1,
    required this.serviceCustomField2,
    required this.serviceCustomField3,
    required this.serviceCustomField4,
    required this.serviceCustomField5,
    required this.serviceCustomField6,
    required this.isCreatedFromApi,
    required this.rpEarned,
    required this.orderAddresses,
    required this.isRecurring,
    required this.recurInterval,
    required this.recurIntervalType,
    required this.recurRepetitions,
    required this.recurStoppedOn,
    required this.recurParentId,
    required this.invoiceToken,
    required this.payTermNumber,
    required this.payTermType,
    required this.sellingPriceGroupId,
    required this.createdAt,
    required this.updatedAt,
    required this.invoiceUrl,
    required this.paymentLink,
    required this.paymentLines,
  });

  String id;
  String businessId;
  String locationId;
  String resTableId;
  String resWaiterId;
  String resOrderStatus;
  String type;
  String subType;
  String status;
  String subStatus;
  String isQuotation;
  String paymentStatus;
  String adjustmentType;
  String contactId;
  String customerGroupId;
  String invoiceNo;
  String refNo;
  String source;
  String subscriptionNo;
  String subscriptionRepeatOn;
  String transactionDate;
  String totalBeforeTax;
  String taxId;
  String taxAmount;
  String discountType;
  String discountAmount;
  String rpRedeemed;
  String rpRedeemedAmount;
  String shippingDetails;
  String shippingAddress;
  String shippingStatus;
  String deliveredTo;
  String shippingCharges;
  String shippingCustomField1;
  String shippingCustomField2;
  String shippingCustomField3;
  String shippingCustomField4;
  String shippingCustomField5;
  String additionalNotes;
  String staffNote;
  String isExport;
  String exportCustomFieldsInfo;
  String roundOffAmount;
  String additionalExpenseKey1;
  String additionalExpenseValue1;
  String additionalExpenseKey2;
  String additionalExpenseValue2;
  String additionalExpenseKey3;
  String additionalExpenseValue3;
  String additionalExpenseKey4;
  String additionalExpenseValue4;
  String finalTotal;
  String expenseCategoryId;
  String expenseFor;
  String commissionAgent;
  String document;
  String isDirectSale;
  String isSuspend;
  String exchangeRate;
  String totalAmountRecovered;
  String transferParentId;
  String returnParentId;
  String openingStockProductId;
  String createdBy;
  String woocommerceOrderId;
  String mfgParentProductionPurchaseId;
  String mfgWastedUnits;
  String mfgProductionCost;
  String mfgIsFinal;
  String essentialsDuration;
  String essentialsDurationUnit;
  String essentialsAmountPerUnitDuration;
  String essentialsAllowances;
  String essentialsDeductions;
  String preferPaymentMethod;
  String preferPaymentAccount;
  String salesOrderIds;
  String purchaseOrderIds;
  String customField1;
  String customField2;
  String customField3;
  String customField4;
  String importBatch;
  String importTime;
  String typesOfServiceId;
  String packingCharge;
  String packingChargeType;
  String serviceCustomField1;
  String serviceCustomField2;
  String serviceCustomField3;
  String serviceCustomField4;
  String serviceCustomField5;
  String serviceCustomField6;
  String isCreatedFromApi;
  String rpEarned;
  String orderAddresses;
  String isRecurring;
  String recurInterval;
  String recurIntervalType;
  String recurRepetitions;
  String recurStoppedOn;
  String recurParentId;
  String invoiceToken;
  String payTermNumber;
  String payTermType;
  String sellingPriceGroupId;
  String createdAt;
  String updatedAt;
  String invoiceUrl;
  String paymentLink;
  List<PaymentLine> paymentLines;

  factory ResUpdateReturnSell.fromJson(Map<String, dynamic> json) =>
      ResUpdateReturnSell(
        id: json["id"].toString().toString(),
        businessId: json["business_id"].toString(),
        locationId: json["location_id"].toString(),
        resTableId: json["res_table_id"].toString(),
        resWaiterId: json["res_waiter_id"].toString(),
        resOrderStatus: json["res_order_status"].toString(),
        type: json["type"].toString(),
        subType: json["sub_type"].toString(),
        status: json["status"].toString(),
        subStatus: json["sub_status"].toString(),
        isQuotation: json["is_quotation"].toString(),
        paymentStatus: json["payment_status"].toString(),
        adjustmentType: json["adjustment_type"].toString(),
        contactId: json["contact_id"].toString(),
        customerGroupId: json["customer_group_id"].toString(),
        invoiceNo: json["invoice_no"].toString(),
        refNo: json["ref_no"].toString(),
        source: json["source"].toString(),
        subscriptionNo: json["subscription_no"].toString(),
        subscriptionRepeatOn: json["subscription_repeat_on"].toString(),
        transactionDate: json["transaction_date"].toString(),
        totalBeforeTax: json["total_before_tax"].toString(),
        taxId: json["tax_id"].toString(),
        taxAmount: json["tax_amount"].toString(),
        discountType: json["discount_type"].toString(),
        discountAmount: json["discount_amount"].toString(),
        rpRedeemed: json["rp_redeemed"].toString(),
        rpRedeemedAmount: json["rp_redeemed_amount"].toString(),
        shippingDetails: json["shipping_details"].toString(),
        shippingAddress: json["shipping_address"].toString(),
        shippingStatus: json["shipping_status"].toString(),
        deliveredTo: json["delivered_to"].toString(),
        shippingCharges: json["shipping_charges"].toString(),
        shippingCustomField1: json["shipping_custom_field_1"].toString(),
        shippingCustomField2: json["shipping_custom_field_2"].toString(),
        shippingCustomField3: json["shipping_custom_field_3"].toString(),
        shippingCustomField4: json["shipping_custom_field_4"].toString(),
        shippingCustomField5: json["shipping_custom_field_5"].toString(),
        additionalNotes: json["additional_notes"].toString(),
        staffNote: json["staff_note"].toString(),
        isExport: json["is_export"].toString(),
        exportCustomFieldsInfo: json["export_custom_fields_info"].toString(),
        roundOffAmount: json["round_off_amount"].toString(),
        additionalExpenseKey1: json["additional_expense_key_1"].toString(),
        additionalExpenseValue1: json["additional_expense_value_1"].toString(),
        additionalExpenseKey2: json["additional_expense_key_2"].toString(),
        additionalExpenseValue2: json["additional_expense_value_2"].toString(),
        additionalExpenseKey3: json["additional_expense_key_3"].toString(),
        additionalExpenseValue3: json["additional_expense_value_3"].toString(),
        additionalExpenseKey4: json["additional_expense_key_4"].toString(),
        additionalExpenseValue4: json["additional_expense_value_4"].toString(),
        finalTotal: json["final_total"].toString(),
        expenseCategoryId: json["expense_category_id"].toString(),
        expenseFor: json["expense_for"].toString(),
        commissionAgent: json["commission_agent"].toString(),
        document: json["document"].toString(),
        isDirectSale: json["is_direct_sale"].toString(),
        isSuspend: json["is_suspend"].toString(),
        exchangeRate: json["exchange_rate"].toString(),
        totalAmountRecovered: json["total_amount_recovered"].toString(),
        transferParentId: json["transfer_parent_id"].toString(),
        returnParentId: json["return_parent_id"].toString(),
        openingStockProductId: json["opening_stock_product_id"].toString(),
        createdBy: json["created_by"].toString(),
        woocommerceOrderId: json["woocommerce_order_id"].toString(),
        mfgParentProductionPurchaseId:
            json["mfg_parent_production_purchase_id"].toString(),
        mfgWastedUnits: json["mfg_wasted_units"].toString(),
        mfgProductionCost: json["mfg_production_cost"].toString(),
        mfgIsFinal: json["mfg_is_final"].toString(),
        essentialsDuration: json["essentials_duration"].toString(),
        essentialsDurationUnit: json["essentials_duration_unit"].toString(),
        essentialsAmountPerUnitDuration:
            json["essentials_amount_per_unit_duration"].toString(),
        essentialsAllowances: json["essentials_allowances"].toString(),
        essentialsDeductions: json["essentials_deductions"].toString(),
        preferPaymentMethod: json["prefer_payment_method"].toString(),
        preferPaymentAccount: json["prefer_payment_account"].toString(),
        salesOrderIds: json["sales_order_ids"].toString(),
        purchaseOrderIds: json["purchase_order_ids"].toString(),
        customField1: json["custom_field_1"].toString(),
        customField2: json["custom_field_2"].toString(),
        customField3: json["custom_field_3"].toString(),
        customField4: json["custom_field_4"].toString(),
        importBatch: json["import_batch"].toString(),
        importTime: json["import_time"].toString(),
        typesOfServiceId: json["types_of_service_id"].toString(),
        packingCharge: json["packing_charge"].toString(),
        packingChargeType: json["packing_charge_type"].toString(),
        serviceCustomField1: json["service_custom_field_1"].toString(),
        serviceCustomField2: json["service_custom_field_2"].toString(),
        serviceCustomField3: json["service_custom_field_3"].toString(),
        serviceCustomField4: json["service_custom_field_4"].toString(),
        serviceCustomField5: json["service_custom_field_5"].toString(),
        serviceCustomField6: json["service_custom_field_6"].toString(),
        isCreatedFromApi: json["is_created_from_api"].toString(),
        rpEarned: json["rp_earned"].toString(),
        orderAddresses: json["order_addresses"].toString(),
        isRecurring: json["is_recurring"].toString(),
        recurInterval: json["recur_interval"].toString(),
        recurIntervalType: json["recur_interval_type"].toString(),
        recurRepetitions: json["recur_repetitions"].toString(),
        recurStoppedOn: json["recur_stopped_on"].toString(),
        recurParentId: json["recur_parent_id"].toString(),
        invoiceToken: json["invoice_token"].toString(),
        payTermNumber: json["pay_term_number"].toString(),
        payTermType: json["pay_term_type"].toString(),
        sellingPriceGroupId: json["selling_price_group_id"].toString(),
        createdAt: json["created_at"].toString(),
        updatedAt: json["updated_at"].toString(),
        invoiceUrl: json["invoice_url"].toString(),
        paymentLink: json["payment_link"].toString(),
        paymentLines: List<PaymentLine>.from(
            json["payment_lines"].map((x) => PaymentLine.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "business_id": businessId,
        "location_id": locationId,
        "res_table_id": resTableId,
        "res_waiter_id": resWaiterId,
        "res_order_status": resOrderStatus,
        "type": type,
        "sub_type": subType,
        "status": status,
        "sub_status": subStatus,
        "is_quotation": isQuotation,
        "payment_status": paymentStatus,
        "adjustment_type": adjustmentType,
        "contact_id": contactId,
        "customer_group_id": customerGroupId,
        "invoice_no": invoiceNo,
        "ref_no": refNo,
        "source": source,
        "subscription_no": subscriptionNo,
        "subscription_repeat_on": subscriptionRepeatOn,
        "transaction_date": transactionDate,
        "total_before_tax": totalBeforeTax,
        "tax_id": taxId,
        "tax_amount": taxAmount,
        "discount_type": discountType,
        "discount_amount": discountAmount,
        "rp_redeemed": rpRedeemed,
        "rp_redeemed_amount": rpRedeemedAmount,
        "shipping_details": shippingDetails,
        "shipping_address": shippingAddress,
        "shipping_status": shippingStatus,
        "delivered_to": deliveredTo,
        "shipping_charges": shippingCharges,
        "shipping_custom_field_1": shippingCustomField1,
        "shipping_custom_field_2": shippingCustomField2,
        "shipping_custom_field_3": shippingCustomField3,
        "shipping_custom_field_4": shippingCustomField4,
        "shipping_custom_field_5": shippingCustomField5,
        "additional_notes": additionalNotes,
        "staff_note": staffNote,
        "is_export": isExport,
        "export_custom_fields_info": exportCustomFieldsInfo,
        "round_off_amount": roundOffAmount,
        "additional_expense_key_1": additionalExpenseKey1,
        "additional_expense_value_1": additionalExpenseValue1,
        "additional_expense_key_2": additionalExpenseKey2,
        "additional_expense_value_2": additionalExpenseValue2,
        "additional_expense_key_3": additionalExpenseKey3,
        "additional_expense_value_3": additionalExpenseValue3,
        "additional_expense_key_4": additionalExpenseKey4,
        "additional_expense_value_4": additionalExpenseValue4,
        "final_total": finalTotal,
        "expense_category_id": expenseCategoryId,
        "expense_for": expenseFor,
        "commission_agent": commissionAgent,
        "document": document,
        "is_direct_sale": isDirectSale,
        "is_suspend": isSuspend,
        "exchange_rate": exchangeRate,
        "total_amount_recovered": totalAmountRecovered,
        "transfer_parent_id": transferParentId,
        "return_parent_id": returnParentId,
        "opening_stock_product_id": openingStockProductId,
        "created_by": createdBy,
        "woocommerce_order_id": woocommerceOrderId,
        "mfg_parent_production_purchase_id": mfgParentProductionPurchaseId,
        "mfg_wasted_units": mfgWastedUnits,
        "mfg_production_cost": mfgProductionCost,
        "mfg_is_final": mfgIsFinal,
        "essentials_duration": essentialsDuration,
        "essentials_duration_unit": essentialsDurationUnit,
        "essentials_amount_per_unit_duration": essentialsAmountPerUnitDuration,
        "essentials_allowances": essentialsAllowances,
        "essentials_deductions": essentialsDeductions,
        "prefer_payment_method": preferPaymentMethod,
        "prefer_payment_account": preferPaymentAccount,
        "sales_order_ids": salesOrderIds,
        "purchase_order_ids": purchaseOrderIds,
        "custom_field_1": customField1,
        "custom_field_2": customField2,
        "custom_field_3": customField3,
        "custom_field_4": customField4,
        "import_batch": importBatch,
        "import_time": importTime,
        "types_of_service_id": typesOfServiceId,
        "packing_charge": packingCharge,
        "packing_charge_type": packingChargeType,
        "service_custom_field_1": serviceCustomField1,
        "service_custom_field_2": serviceCustomField2,
        "service_custom_field_3": serviceCustomField3,
        "service_custom_field_4": serviceCustomField4,
        "service_custom_field_5": serviceCustomField5,
        "service_custom_field_6": serviceCustomField6,
        "is_created_from_api": isCreatedFromApi,
        "rp_earned": rpEarned,
        "order_addresses": orderAddresses,
        "is_recurring": isRecurring,
        "recur_interval": recurInterval,
        "recur_interval_type": recurIntervalType,
        "recur_repetitions": recurRepetitions,
        "recur_stopped_on": recurStoppedOn,
        "recur_parent_id": recurParentId,
        "invoice_token": invoiceToken,
        "pay_term_number": payTermNumber,
        "pay_term_type": payTermType,
        "selling_price_group_id": sellingPriceGroupId,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "invoice_url": invoiceUrl,
        "payment_link": paymentLink,
        "payment_lines":
            List<dynamic>.from(paymentLines.map((x) => x.toJson())),
      };
}

class PaymentLine {
  PaymentLine({
    required this.id,
    required this.transactionId,
    required this.businessId,
    required this.isReturn,
    required this.amount,
    required this.method,
    required this.transactionNo,
    required this.cardTransactionNumber,
    required this.cardNumber,
    required this.cardType,
    required this.cardHolderName,
    required this.cardMonth,
    required this.cardYear,
    required this.cardSecurity,
    required this.chequeNumber,
    required this.bankAccountNumber,
    required this.paidOn,
    required this.createdBy,
    required this.paidThroughLink,
    required this.gateway,
    required this.isAdvance,
    required this.paymentFor,
    required this.parentId,
    required this.note,
    required this.document,
    required this.paymentRefNo,
    required this.accountId,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String transactionId;
  String businessId;
  String isReturn;
  String amount;
  String method;
  String transactionNo;
  String cardTransactionNumber;
  String cardNumber;
  String cardType;
  String cardHolderName;
  String cardMonth;
  String cardYear;
  String cardSecurity;
  String chequeNumber;
  String bankAccountNumber;
  String paidOn;
  String createdBy;
  String paidThroughLink;
  String gateway;
  String isAdvance;
  String paymentFor;
  String parentId;
  String note;
  String document;
  String paymentRefNo;
  String accountId;
  String createdAt;
  String updatedAt;

  factory PaymentLine.fromJson(Map<String, dynamic> json) => PaymentLine(
        id: json["id"].toString(),
        transactionId: json["transaction_id"].toString(),
        businessId: json["business_id"].toString(),
        isReturn: json["is_return"].toString(),
        amount: json["amount"].toString(),
        method: json["method"].toString(),
        transactionNo: json["transaction_no"].toString(),
        cardTransactionNumber: json["card_transaction_number"].toString(),
        cardNumber: json["card_number"].toString(),
        cardType: json["card_type"].toString(),
        cardHolderName: json["card_holder_name"].toString(),
        cardMonth: json["card_month"].toString(),
        cardYear: json["card_year"].toString(),
        cardSecurity: json["card_security"].toString(),
        chequeNumber: json["cheque_number"].toString(),
        bankAccountNumber: json["bank_account_number"].toString(),
        paidOn: json["paid_on"].toString(),
        createdBy: json["created_by"].toString(),
        paidThroughLink: json["paid_through_link"].toString(),
        gateway: json["gateway"].toString(),
        isAdvance: json["is_advance"].toString(),
        paymentFor: json["payment_for"].toString(),
        parentId: json["parent_id"].toString(),
        note: json["note"].toString(),
        document: json["document"].toString(),
        paymentRefNo: json["payment_ref_no"].toString(),
        accountId: json["account_id"].toString(),
        createdAt: json["created_at"].toString(),
        updatedAt: json["updated_at"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "transaction_id": transactionId,
        "business_id": businessId,
        "is_return": isReturn,
        "amount": amount,
        "method": method,
        "transaction_no": transactionNo,
        "card_transaction_number": cardTransactionNumber,
        "card_number": cardNumber,
        "card_type": cardType,
        "card_holder_name": cardHolderName,
        "card_month": cardMonth,
        "card_year": cardYear,
        "card_security": cardSecurity,
        "cheque_number": chequeNumber,
        "bank_account_number": bankAccountNumber,
        "paid_on": paidOn,
        "created_by": createdBy,
        "paid_through_link": paidThroughLink,
        "gateway": gateway,
        "is_advance": isAdvance,
        "payment_for": paymentFor,
        "parent_id": parentId,
        "note": note,
        "document": document,
        "payment_ref_no": paymentRefNo,
        "account_id": accountId,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
