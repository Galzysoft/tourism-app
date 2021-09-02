class PlaceModel {
  String picture;
  String description;
  String title;
  String location;
  double rating;
  bool favourite;

  PlaceModel(
      {this.picture,
      this.description,
      this.title,
      this.location,
      this.rating,
      this.favourite=false});

  Map<String,dynamic> toMap(){
    var map = <String,dynamic>{
      'picture' : picture,
      'description' : description,
      'title' : title,
      'location' : location,
      'rating' : rating,
      'favourite' : favourite,
    };
    return map;
  }


  PlaceModel.fromMap(Map<String,dynamic> map){
    picture =map['picture'];
    description =map['description'];
    title =map['title'];
    location =map['location'];
    rating =map['rating'];
    favourite =map['favourite'];
  }

@override
  String toString() {
    return 'PlaceModel{picture: $picture, description: $description, title: $title, location: $location, rating: $rating, favourite: $favourite}';
  }
}

