class Products {
  int? id;
  String? title;
  String? sku;
  String? skuNew;
  String? categoryId;
  String? supplierId;
  String? branchId;
  String? taxId;
  String? priceType;
  String? purchasePrice;
  String? purchaseTax;
  String? purchasePriceAfterTax;
  String? sellPrice;
  String? sellPricePerKg;
  String? thickness;
  String? shortDescription;
  String? thumbnail;
  String? quantity;
  String? alarmingQty;
  String? totalPrice;
  String? taxPercentage;
  String? taxAmount;
  String? createdBy;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? sellType;
  int? currentStockQuantity;
  String? totalSellQty;

  Products(
      {this.id,
      this.title,
      this.sku,
      this.skuNew,
      this.categoryId,
      this.supplierId,
      this.branchId,
      this.taxId,
      this.priceType,
      this.purchasePrice,
      this.purchaseTax,
      this.purchasePriceAfterTax,
      this.sellPrice,
      this.sellPricePerKg,
      this.thickness,
      this.shortDescription,
      this.thumbnail,
      this.quantity,
      this.alarmingQty,
      this.totalPrice,
      this.taxPercentage,
      this.taxAmount,
      this.createdBy,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.sellType,
      this.currentStockQuantity,
      this.totalSellQty});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    sku = json['sku'];
    skuNew = json['sku_new'];
    categoryId = json['category_id'];
    supplierId = json['supplier_id'];
    branchId = json['branch_id'];
    taxId = json['tax_id'];
    priceType = json['price_type'];
    purchasePrice = json['purchase_price'];
    purchaseTax = json['purchase_tax'];
    purchasePriceAfterTax = json['purchase_price_after_tax'];
    sellPrice = json['sell_price'];
    sellPricePerKg = json['sell_price_per_kg'];
    thickness = json['thickness'];
    shortDescription = json['short_description'];
    thumbnail = json['thumbnail'];
    quantity = json['quantity'];
    alarmingQty = json['alarming_qty'];
    totalPrice = json['total_price'];
    taxPercentage = json['tax_percentage'];
    taxAmount = json['tax_amount'];
    createdBy = json['created_by'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    sellType = json['sell_type'];
    currentStockQuantity = json['current_stock_quantity'];
    totalSellQty = json['total_sell_qty'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['sku'] = sku;
    data['sku_new'] = skuNew;
    data['category_id'] = categoryId;
    data['supplier_id'] = supplierId;
    data['branch_id'] = branchId;
    data['tax_id'] = taxId;
    data['price_type'] = priceType;
    data['purchase_price'] = purchasePrice;
    data['purchase_tax'] = purchaseTax;
    data['purchase_price_after_tax'] = purchasePriceAfterTax;
    data['sell_price'] = sellPrice;
    data['sell_price_per_kg'] = sellPricePerKg;
    data['thickness'] = thickness;
    data['short_description'] = shortDescription;
    data['thumbnail'] = thumbnail;
    data['quantity'] = quantity;
    data['alarming_qty'] = alarmingQty;
    data['total_price'] = totalPrice;
    data['tax_percentage'] = taxPercentage;
    data['tax_amount'] = taxAmount;
    data['created_by'] = createdBy;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['sell_type'] = sellType;
    data['current_stock_quantity'] = currentStockQuantity;
    data['total_sell_qty'] = totalSellQty;
    return data;
  }
}
