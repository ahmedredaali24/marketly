
import '../../../domin/enitity/AddCartResponseEntity.dart';

class AddCartResponseDto extends AddCartResponseEntity {
  AddCartResponseDto({
      super.status,
      super.message,
      super.numOfCartItems,
      super.data,});

  AddCartResponseDto.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    data = json['data'] != null ? AddDataDto.fromJson(json['data']) : null;
  }




}

class AddDataDto extends AddDataEntity {
  AddDataDto({
      super.id,
      super.cartOwner,
      super.products,
      super.createdAt,
      super.updatedAt,
      super.v,
      super.totalCartPrice,});

  AddDataDto.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(AddProductsDto.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }



}

class AddProductsDto extends AddProductsEntity {
  AddProductsDto({
      super.count,
      super.id,
      super.product,
      super.price,});

  AddProductsDto.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'];
    price = json['price'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['_id'] = id;
    map['product'] = product;
    map['price'] = price;
    return map;
  }

}