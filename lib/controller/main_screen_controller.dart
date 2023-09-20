import 'package:bti_project1/models/meal_info.dart';
import 'package:flutter/material.dart';

class MainScreenController extends ChangeNotifier {

  late MealInfo selectedMealInfo;

  void setSelectedMealInfo (mealInfo){
    selectedMealInfo = mealInfo;
    notifyListeners();
  }



  void addNewComment ({required Map map} ){
    int index = mealsData.indexOf(
      mealsData.firstWhere((element) => element["id"] == selectedMealInfo.id)
    );


    List temp = mealsData[index]["comments"];
    temp.add(map);
    mealsData[index]["comments"] = temp;

    notifyListeners();
    setSelectedMealInfo(MealInfo(mealsData[index]));
  }


  List<Map> getAllFavMeals (){
    return mealsData.where((element) => element["isFavourite"] == true).toList();
  }

  void setMealFavourite (MealInfo meal){
    mealsData.where((element) => element["id"] == meal.id).first["isFavourite"] = !meal.isFavourite!;
    notifyListeners();
  }

  List<Map> category = [
    {
      "name":"Burger",
      "color":Color(0xFFFC9E24),
      "image":"",
    },
    {
      "name":"Pizza",
      "color":Color(0xFFE5DF64),
      "image":"",
    },
    {
      "name":"Chicken",
      "color":Color(0xFF64E5A5),
      "image":"",
    },
    {
      "name":"Meat",
      "color":Color(0xFFE56464),
      "image":"",
    },

  ];

  List<Map> mealsData = [
    {
      "id":1,
      "img_url": "https://images.unsplash.com/photo-1508737027454-e6454ef45afd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1372&q=80",
      "name": "Burger",
      "category":"Burger",
      "isFavourite":false,
      "price": 6,
      "contents": [
        {
          "name": "salad",
          "price": "2",
        },
        {
          "name": "ketchup",
          "price": "1"
        }

      ],
      "comments":<Map>[]
    },
    {
      "id":2,
      "img_url": "https://images.unsplash.com/photo-1508736793122-f516e3ba5569?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDd8fGJ1cmdlciUyMG1lYWx8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60",
      "name": "Burger",
      "category":"Burger",
      "isFavourite":false,
      "price": 6,
      "contents": [
        {
          "name": "salad",
          "price": "2",
        },
        {
          "name": "ketchup",
          "price": "1"
        }

      ],
      "comments":<Map>[]
    },
    {
      "id":3,
      "img_url": "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE0fHx8ZW58MHx8fHx8&auto=format&fit=crop&w=500&q=60",
      "name": "Burger",
      "category":"Burger",
      "isFavourite":false,
      "price": 6,
      "contents": [
        {
          "name": "salad",
          "price": "2",
        },
        {
          "name": "ketchup",
          "price": "1"
        }

      ],
      "comments":<Map>[]
    },
    {
      "id":4,
      "img_url": "https://images.unsplash.com/photo-1594212699903-ec8a3eca50f5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGJ1cmdlcnxlbnwwfDB8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60",
      "name": "Burger",
      "category":"Burger",
      "isFavourite":false,
      "price": 6,
      "contents": [
        {
          "name": "salad",
          "price": "2",
        },
        {
          "name": "ketchup",
          "price": "1"
        }

      ],
      "comments":<Map>[]
    },
    {
      "id":5,
      "img_url": "https://images.unsplash.com/photo-1594212699903-ec8a3eca50f5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGJ1cmdlcnxlbnwwfDB8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60",
      "name": "Burger",
      "category":"Burger",
      "isFavourite":false,
      "price": 6,
      "contents": [
        {
          "name": "salad",
          "price": "2",
        },
        {
          "name": "ketchup",
          "price": "1"
        }

      ],
      "comments":<Map>[]
    },


    {
      "id":6,
      "img_url": "https://media.istockphoto.com/id/1445823226/photo/italian-pizza-with-ham-sausage-mushrooms-tomatoes-and-onions.webp?b=1&s=170667a&w=0&k=20&c=bPl2ehNJTnADKqkb7-225VZZdoAtsnAEpKnMQQTm1xw=",
      "name": "Pizza",
      "category":"Pizza",
      "isFavourite":false,
      "price": 6,
      "contents": [
        {
          "name": "salad",
          "price": "2",
        },
        {
          "name": "ketchup",
          "price": "1"
        }

      ],
      "comments":<Map>[]
    },
    {
      "id":7,
      "img_url": "https://media.istockphoto.com/id/1389527253/photo/vegetarian-pizza-above-view-minimalist-on-a-blue-background.jpg?s=612x612&w=0&k=20&c=AVArR_DcD2Kv7mWGZJsLCR-MrFKP8E3vGB07nfdqD7A=",
      "name": "Pizza",
      "category":"Pizza",
      "isFavourite":false,
      "price": 6,
      "contents": [
        {
          "name": "salad",
          "price": "2",
        },
        {
          "name": "ketchup",
          "price": "1"
        }

      ],
      "comments":<Map>[]
    },
    {
      "id":8,
      "img_url": "https://media.istockphoto.com/id/1396086390/photo/pizza-with-tomatoes-cheese-mushrooms-tomato-sauce-and-fresh-herbs-isolated-on-a-white.jpg?s=612x612&w=0&k=20&c=dJ4w0Rvb0fc2DfrntcmHYuQmO8A8OGxfOgf-2Do2V4M=",
      "name": "Pizza",
      "category":"Pizza",
      "isFavourite":false,
      "price": 6,
      "contents": [
        {
          "name": "salad",
          "price": "2",
        },
        {
          "name": "ketchup",
          "price": "1"
        }

      ],
      "comments":<Map>[]
    },
    {
      "id":9,
      "img_url": "https://media.istockphoto.com/id/1270988485/photo/supreme-pizza.jpg?s=612x612&w=0&k=20&c=pou6feCdoQz3J6gFmz687JXX3J_mZXwqA2C7Hi5Y-nk=",
      "name": "Pizza",
      "category":"Pizza",
      "isFavourite":false,
      "price": 6,
      "contents": [
        {
          "name": "salad",
          "price": "2",
        },
        {
          "name": "ketchup",
          "price": "1"
        }

      ],
      "comments":<Map>[]
    },


    {
      "id":10,
      "img_url": "https://media.istockphoto.com/id/1498497473/photo/barbecued-chicken.jpg?s=612x612&w=0&k=20&c=X3dTMO_e6v3slNEnmVsQY7IKDS2-N1gGbMYG0ujBh_s=",
      "name": "Chicken",
      "category":"Chicken",
      "isFavourite":false,
      "price": 6,
      "contents": [
        {
          "name": "salad",
          "price": "2",
        },
        {
          "name": "ketchup",
          "price": "1"
        }

      ],
      "comments":<Map>[]
    },
    {
      "id":11,
      "img_url": "https://media.istockphoto.com/id/1409280601/photo/baked-chicken-wings-with-spring-onion-and-sweet-chili-sauce.jpg?s=612x612&w=0&k=20&c=0RtkOryGJ_kLYwQ088MlQN299Y3XWpLWaBBAyN4pFso=",
      "name": "Chicken",
      "category":"Chicken",
      "isFavourite":false,
      "price": 6,
      "contents": [
        {
          "name": "salad",
          "price": "2",
        },
        {
          "name": "ketchup",
          "price": "1"
        }

      ],
      "comments":<Map>[]
    },
    {
      "id":12,
      "img_url": "https://media.istockphoto.com/id/1345624336/photo/chicken-biriyani.jpg?s=612x612&w=0&k=20&c=adU_N0P-1SKMQLZu5yu7aPknfLLgbViI8XILqLP92A4=",
      "name": "Chicken",
      "category":"Chicken",
      "isFavourite":false,
      "price": 6,
      "contents": [
        {
          "name": "salad",
          "price": "2",
        },
        {
          "name": "ketchup",
          "price": "1"
        }

      ],
      "comments":<Map>[]
    },
    {
      "id":13,
      "img_url": "https://media.istockphoto.com/id/171159323/photo/roast-chicken-on-a-plate-of-vegetables.jpg?s=612x612&w=0&k=20&c=x4JTbdk80CfFtDrMJWbywUiRpGETXA5yU7Gk7ovg7eA=",
      "name": "Chicken",
      "category":"Chicken",
      "isFavourite":false,
      "price": 6,
      "contents": [
        {
          "name": "salad",
          "price": "2",
        },
        {
          "name": "ketchup",
          "price": "1"
        }

      ],
      "comments":<Map>[]
    },


    {
      "id":14,
      "img_url": "https://media.istockphoto.com/id/1191425335/photo/american-food-concept-grilled-pork-ribs-with-grilled-sauce-with-smoke-spices-and-rosemary.jpg?s=612x612&w=0&k=20&c=TXvrzSQ7JndB40X8BzNyInU0e78p5pdg0qFxsxZ5e_8=",
      "name": "Meat",
      "category":"Meat",
      "isFavourite":false,
      "price": 6,
      "contents": [
        {
          "name": "salad",
          "price": "2",
        },
        {
          "name": "ketchup",
          "price": "1"
        }

      ],
      "comments":<Map>[]
    },
    {
      "id":15,
      "img_url": "https://media.istockphoto.com/id/673152946/photo/grilled-beef-fillet-steaks-with-spices.jpg?s=612x612&w=0&k=20&c=j8Bw3c4dnawMhAqBTuOfkv24bykZxeg6j_9rJVNPfoo=",
      "name": "Meat",
      "category":"Meat",
      "isFavourite":false,
      "price": 6,
      "contents": [
        {
          "name": "salad",
          "price": "2",
        },
        {
          "name": "ketchup",
          "price": "1"
        }

      ],
      "comments":<Map>[]
    },
    {
      "id":16,
      "img_url": "https://media.istockphoto.com/id/134169762/photo/grilled-beefsteak-with-french-fries.jpg?s=612x612&w=0&k=20&c=4TtXtdIznFmW72X_yKCTFtaPnuHZsT63fDQmZoya_u8=",
      "name": "Meat",
      "category":"Meat",
      "isFavourite":false,
      "price": 6,
      "contents": [
        {
          "name": "salad",
          "price": "2",
        },
        {
          "name": "ketchup",
          "price": "1"
        }

      ],
      "comments":<Map>[]
    },
    {
      "id":17,
      "img_url": "https://media.istockphoto.com/id/594465474/photo/steaks-cooking-over-flaming-grill.jpg?s=612x612&w=0&k=20&c=kds8C_r0vvjfiZwArhQIsZTYDOISHVziwj3YXukar1Y=",
      "name": "Meat",
      "category":"Meat",
      "isFavourite":false,
      "price": 6,
      "contents": [
        {
          "name": "salad",
          "price": "2",
        },
        {
          "name": "ketchup",
          "price": "1"
        }

      ],
      "comments":<Map>[]
    },




  ];


}