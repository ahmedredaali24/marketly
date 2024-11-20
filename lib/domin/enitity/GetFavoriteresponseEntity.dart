class GetFavoriteResponseEntity {
  GetFavoriteResponseEntity({
      this.status, 
      this.count, 
      this.data,});

  String? status;
  num? count;
  List<GetFavDataEntity>? data;


}

class GetFavDataEntity {
  GetFavDataEntity({
      this.sold, 
      this.images, 
      this.subcategory, 
      this.ratingsQuantity, 
      this.id, 
      this.title, 
      this.slug, 
      this.description, 
      this.quantity, 
      this.price, 
      this.imageCover, 
      this.category, 
      this.brand, 
      this.ratingsAverage, 
      this.createdAt, 
      this.updatedAt, 
      this.v,});

  num? sold;
  List<String>? images;
  List<GetFavSubcategoryEntity>? subcategory;
  num? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  num? quantity;
  num? price;
  String? imageCover;
  GetFavCategoryEntity? category;
  GetFavBrandEntity? brand;
  num? ratingsAverage;
  String? createdAt;
  String? updatedAt;
  num? v;


}

class GetFavBrandEntity {
  GetFavBrandEntity({
      this.id, 
      this.name, 
      this.slug, 
      this.image,});

  String? id;
  String? name;
  String? slug;
  String? image;


}

class GetFavCategoryEntity {
  GetFavCategoryEntity({
      this.id, 
      this.name, 
      this.slug, 
      this.image,});

  String? id;
  String? name;
  String? slug;
  String? image;


}

class GetFavSubcategoryEntity {
  GetFavSubcategoryEntity({
      this.id, 
      this.name, 
      this.slug, 
      this.category,});

  String? id;
  String? name;
  String? slug;
  String? category;


}