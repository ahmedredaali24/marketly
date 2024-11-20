
import '../../../domin/enitity/GetFavoriteresponseEntity.dart';

class GetFavoriteResponseDto extends GetFavoriteResponseEntity {
  GetFavoriteResponseDto(
      {super.status,
      super.count,
      super.data,
      this.message,
      this.statusMessage});

  GetFavoriteResponseDto.fromJson(dynamic json) {
    status = json['status'];
    statusMessage = json['statusMessage'];
    message = json['message'];
    count = json['count'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(GetDataFavDto.fromJson(v));
      });
    }
  }

  String? message;
  String? statusMessage;
}

class GetDataFavDto extends GetFavDataEntity {
  GetDataFavDto({
    super.sold,
    super.images,
    super.subcategory,
    super.ratingsQuantity,
    super.id,
    super.title,
    super.slug,
    super.description,
    super.quantity,
    super.price,
    super.imageCover,
    super.category,
    super.brand,
    super.ratingsAverage,
    super.createdAt,
    super.updatedAt,
    super.v,
  });

  GetDataFavDto.fromJson(dynamic json) {
    sold = json['sold'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(GetFavSubcategoryDto.fromJson(v));
      });
    }
    ratingsQuantity = json['ratingsQuantity'];
    id = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    imageCover = json['imageCover'];
    category = json['category'] != null
        ? GetFavCategoryDto.fromJson(json['category'])
        : null;
    brand =
        json['brand'] != null ? GetFavBrandDto.fromJson(json['brand']) : null;
    ratingsAverage = json['ratingsAverage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    id = json['id'];
  }
}

class GetFavBrandDto extends GetFavBrandEntity {
  GetFavBrandDto({
    super.id,
    super.name,
    super.slug,
    super.image,
  });

  GetFavBrandDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }
}

class GetFavCategoryDto extends GetFavCategoryEntity {
  GetFavCategoryDto({
    super.id,
    super.name,
    super.slug,
    super.image,
  });

  GetFavCategoryDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }
}

class GetFavSubcategoryDto extends GetFavSubcategoryEntity {
  GetFavSubcategoryDto({
    super.id,
    super.name,
    super.slug,
    super.category,
  });

  GetFavSubcategoryDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }
}
