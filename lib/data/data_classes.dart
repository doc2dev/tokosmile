class Product {
  final int id;
  final String category;
  final String description;
  final double avgRating;
  final int numOfReviews;
  final int itemsSold;
  final List<String> images;
  final bool likedByUser;
  final double price;

  Product({
    required this.id,
    required this.description,
    required this.avgRating,
    required this.numOfReviews,
    required this.itemsSold,
    required this.images,
    required this.likedByUser,
    required this.price,
    required this.category,
  });
}

class CarouselData {
  final String hashTag;
  final String title;
  final String subtitle;
  final String imageFile;
  final String callToAction;

  CarouselData({
    required this.hashTag,
    required this.title,
    required this.subtitle,
    required this.imageFile,
    required this.callToAction,
  });
}
