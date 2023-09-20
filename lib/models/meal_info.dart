class MealInfo {
  int? id;
  String? img_url;
  String? name;
  int? price;
  bool? isFavourite;
  List<Contents>? contents;
  List<MealComment>? mealComments;

  MealInfo(Map map) {
    id = map["id"];
    img_url = map["img_url"];
    name = map["name"];
    isFavourite = map["isFavourite"];
    price = map["price"];
    contents = (map["contents"] as List).map((e) => Contents(e)).toList();
    mealComments = (map["comments"] as List).map((e) => MealComment(e)).toList();
  }
}

class Contents {
  String? name;
  String? price;

  Contents(Map map) {
    name = map["name"];
    price = map["price"];
  }
}

class MealComment {
  String? userName;
  String? userPhoto;
  String? date;
  String? comment;

  MealComment (Map map){
    userName = map["name"];
    userPhoto = map["photo"];
    date = map["date"];
    comment = map["comment"];
  }

}
