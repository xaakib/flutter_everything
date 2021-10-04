// // To parse this JSON data, do
// //
// //     final testData = testDataFromJson(jsonString);

// import 'dart:convert';

// List<TestData> testDataFromJson(String str) => List<TestData>.from(json.decode(str).map((x) => TestData.fromJson(x)));

// String testDataToJson(List<TestData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class TestData {
//     TestData({
//         this.frontLocation,
//         this.allLocation,
//         this.frontHotel,
//         this.frontTour,
//     });

//     List<FrontLocation> frontLocation;
//     List<AllLocation> allLocation;
//     List<FrontHotel> frontHotel;
//     List<dynamic> frontTour;

//     factory TestData.fromJson(Map<String, dynamic> json) => TestData(
//         frontLocation: List<FrontLocation>.from(json["front_location"].map((x) => FrontLocation.fromJson(x))),
//         allLocation: List<AllLocation>.from(json["all_location"].map((x) => AllLocation.fromJson(x))),
//         frontHotel: List<FrontHotel>.from(json["front_hotel"].map((x) => FrontHotel.fromJson(x))),
//         frontTour: List<dynamic>.from(json["front_tour"].map((x) => x)),
//     );

//     Map<String, dynamic> toJson() => {
//         "front_location": List<dynamic>.from(frontLocation.map((x) => x.toJson())),
//         "all_location": List<dynamic>.from(allLocation.map((x) => x.toJson())),
//         "front_hotel": List<dynamic>.from(frontHotel.map((x) => x.toJson())),
//         "front_tour": List<dynamic>.from(frontTour.map((x) => x)),
//     };
// }

// class AllLocation {
//     AllLocation({
//         this.id,
//         this.country,
//         this.location,
//         this.metaTitle,
//         this.metaDescription,
//         this.metaKeywords,
//         this.thumbnail,
//         this.latitude,
//         this.longitude,
//         this.user,
//         this.home,
//         this.status,
//         this.division,
//     });

//     String id;
//     Country country;
//     String location;
//     String metaTitle;
//     MetaDescription metaDescription;
//     String metaKeywords;
//     String thumbnail;
//     String latitude;
//     String longitude;
//     dynamic user;
//     String home;
//     Status status;
//     Division division;

//     factory AllLocation.fromJson(Map<String, dynamic> json) => AllLocation(
//         id: json["id"],
//         country: countryValues.map[json["country"]],
//         location: json["location"],
//         metaTitle: json["meta_title"],
//         metaDescription: metaDescriptionValues.map[json["meta_description"]],
//         metaKeywords: json["meta_keywords"],
//         thumbnail: json["thumbnail"],
//         latitude: json["latitude"],
//         longitude: json["longitude"],
//         user: json["user"],
//         home: json["home"],
//         status: statusValues.map[json["status"]],
//         division: divisionValues.map[json["division"]],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "country": countryValues.reverse[country],
//         "location": location,
//         "meta_title": metaTitle,
//         "meta_description": metaDescriptionValues.reverse[metaDescription],
//         "meta_keywords": metaKeywords,
//         "thumbnail": thumbnail,
//         "latitude": latitude,
//         "longitude": longitude,
//         "user": user,
//         "home": home,
//         "status": statusValues.reverse[status],
//         "division": divisionValues.reverse[division],
//     };
// }

// enum Country { BANGLADESH }

// final countryValues = EnumValues({
//     "Bangladesh": Country.BANGLADESH
// });

// enum Division { CHITTAGONG, MYMENSINGH, RANGPUR, DHAKA, SYLHET, BARISAL, KHULNA, RAJSHAHI }

// final divisionValues = EnumValues({
//     "Barisal": Division.BARISAL,
//     "Chittagong": Division.CHITTAGONG,
//     "Dhaka": Division.DHAKA,
//     "Khulna": Division.KHULNA,
//     "Mymensingh": Division.MYMENSINGH,
//     "Rajshahi": Division.RAJSHAHI,
//     "Rangpur": Division.RANGPUR,
//     "Sylhet": Division.SYLHET
// });

// enum MetaDescription { SAJEK_VALLEY, EMPTY, CHANDPUR }

// final metaDescriptionValues = EnumValues({
//     "Chandpur": MetaDescription.CHANDPUR,
//     "": MetaDescription.EMPTY,
//     "Sajek Valley": MetaDescription.SAJEK_VALLEY
// });

// enum Status { YES }

// final statusValues = EnumValues({
//     "Yes": Status.YES
// });

// class FrontHotel {
//     FrontHotel({
//         this.id,
//         this.title,
//         this.slug,
//         this.thumbnail,
//         this.stars,
//         this.starsCount,
//         this.payarr,
//         this.location,
//         this.desc,
//         this.price,
//         this.currCode,
//         this.currSymbol,
//         this.amenities,
//         this.avgReviews,
//         this.latitude,
//         this.longitude,
//         this.address,
//         this.airportDistance,
//         this.citycenterDistance,
//         this.beachDistance,
//         this.breakfastCrg,
//         this.hotelpayOpt,
//         this.portDistance,
//         this.lastBooking,
//         this.popularAminities,
//         this.policy,
//         this.basicprice,
//         this.stayNight,
//     });

//     String id;
//     String title;
//     String slug;
//     String thumbnail;
//     String stars;
//     String starsCount;
//     String payarr;
//     String location;
//     String desc;
//     String price;
//     String currCode;
//     String currSymbol;
//     List<Nity> amenities;
//     AvgReviews avgReviews;
//     String latitude;
//     String longitude;
//     dynamic address;
//     dynamic airportDistance;
//     dynamic citycenterDistance;
//     dynamic beachDistance;
//     dynamic breakfastCrg;
//     dynamic hotelpayOpt;
//     dynamic portDistance;
//     String lastBooking;
//     List<Nity> popularAminities;
//     dynamic policy;
//     double basicprice;
//     int stayNight;

//     factory FrontHotel.fromJson(Map<String, dynamic> json) => FrontHotel(
//         id: json["id"],
//         title: json["title"],
//         slug: json["slug"],
//         thumbnail: json["thumbnail"],
//         stars: json["stars"],
//         starsCount: json["starsCount"],
//         payarr: json["payarr"],
//         location: json["location"],
//         desc: json["desc"],
//         price: json["price"],
//         currCode: json["currCode"],
//         currSymbol: json["currSymbol"],
//         amenities: List<Nity>.from(json["amenities"].map((x) => Nity.fromJson(x))),
//         avgReviews: AvgReviews.fromJson(json["avgReviews"]),
//         latitude: json["latitude"],
//         longitude: json["longitude"],
//         address: json["address"],
//         airportDistance: json["airport_distance"],
//         citycenterDistance: json["citycenter_distance"],
//         beachDistance: json["beachDistance"],
//         breakfastCrg: json["breakfast_crg"],
//         hotelpayOpt: json["hotelpay_opt"],
//         portDistance: json["portDistance"],
//         lastBooking: json["last_booking"] == null ? null : json["last_booking"],
//         popularAminities: List<Nity>.from(json["popular_aminities"].map((x) => Nity.fromJson(x))),
//         policy: json["policy"],
//         basicprice: json["basicprice"].toDouble(),
//         stayNight: json["stay_night"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "title": title,
//         "slug": slug,
//         "thumbnail": thumbnail,
//         "stars": stars,
//         "starsCount": starsCount,
//         "payarr": payarr,
//         "location": location,
//         "desc": desc,
//         "price": price,
//         "currCode": currCode,
//         "currSymbol": currSymbol,
//         "amenities": List<dynamic>.from(amenities.map((x) => x.toJson())),
//         "avgReviews": avgReviews.toJson(),
//         "latitude": latitude,
//         "longitude": longitude,
//         "address": address,
//         "airport_distance": airportDistance,
//         "citycenter_distance": citycenterDistance,
//         "beachDistance": beachDistance,
//         "breakfast_crg": breakfastCrg,
//         "hotelpay_opt": hotelpayOpt,
//         "portDistance": portDistance,
//         "last_booking": lastBooking == null ? null : lastBooking,
//         "popular_aminities": List<dynamic>.from(popularAminities.map((x) => x.toJson())),
//         "policy": policy,
//         "basicprice": basicprice,
//         "stay_night": stayNight,
//     };
// }

// class Nity {
//     Nity({
//         this.icon,
//         this.name,
//     });

//     String icon;
//     String name;

//     factory Nity.fromJson(Map<String, dynamic> json) => Nity(
//         icon: json["icon"],
//         name: json["name"],
//     );

//     Map<String, dynamic> toJson() => {
//         "icon": icon,
//         "name": name,
//     };
// }

// class AvgReviews {
//     AvgReviews({
//         this.clean,
//         this.comfort,
//         this.location,
//         this.facilities,
//         this.staff,
//         this.totalReviews,
//         this.overall,
//     });

//     int clean;
//     int comfort;
//     int location;
//     int facilities;
//     int staff;
//     String totalReviews;
//     int overall;

//     factory AvgReviews.fromJson(Map<String, dynamic> json) => AvgReviews(
//         clean: json["clean"],
//         comfort: json["comfort"],
//         location: json["location"],
//         facilities: json["facilities"],
//         staff: json["staff"],
//         totalReviews: json["totalReviews"],
//         overall: json["overall"],
//     );

//     Map<String, dynamic> toJson() => {
//         "clean": clean,
//         "comfort": comfort,
//         "location": location,
//         "facilities": facilities,
//         "staff": staff,
//         "totalReviews": totalReviews,
//         "overall": overall,
//     };
// }

// class FrontLocation {
//     FrontLocation({
//         this.id,
//         this.location,
//         this.thumbnail,
//         this.country,
//         this.property,
//         this.avgPrice,
//     });

//     String id;
//     String location;
//     String thumbnail;
//     Country country;
//     String property;
//     String avgPrice;

//     factory FrontLocation.fromJson(Map<String, dynamic> json) => FrontLocation(
//         id: json["id"],
//         location: json["location"],
//         thumbnail: json["thumbnail"],
//         country: countryValues.map[json["country"]],
//         property: json["property"],
//         // avgPrice: json["avgPrice"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "location": location,
//         "thumbnail": thumbnail,
//         "country": countryValues.reverse[country],
//         "property": property,
//         // "avgPrice": avgPrice,
//     };
// }

// class EnumValues<T> {
//     Map<String, T> map;
//     Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//         if (reverseMap == null) {
//             reverseMap = map.map((k, v) => new MapEntry(v, k));
//         }
//         return reverseMap;
//     }
// }
