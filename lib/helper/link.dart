class Link {
  final String BASE_URL = "https://restaurant-api.dicoding.dev";

  String getLinkListRestaurant()
  {
    return '${BASE_URL}/list';
  }

  String getLinkDetailRestaurant(int id)
  {
    return '${BASE_URL}/detail/${id}';
  }

  String getLinkSearchRestaurant(String text)
  {
    return '${BASE_URL}/search?q=${text}';
  }

  String getLinkAddReviewRestaurant()
  {
    return '${BASE_URL}/review';
  }

  String getLinkImage(type, id){
    if(type == 'small'){
      return '${BASE_URL}/images/small/${id}';
    }else if(type == 'medium'){
      return '${BASE_URL}/images/medium/${id}';
    }else{
      return '${BASE_URL}/images/large/${id}';
    }
  }
}