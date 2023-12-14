class LocationsModel {
  List<String>? locations;

  LocationsModel({this.locations});

  LocationsModel.fromJson(Map<String, dynamic> json) {
    locations = json['locations'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['locations'] = this.locations;
    return data;
  }
}