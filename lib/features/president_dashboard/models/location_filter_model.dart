// To parse this JSON data, do
//
//     final locatioFilter = locatioFilterFromJson(jsonString);

import 'dart:convert';

LocationFilter locationFilterFromJson(String str) =>
    LocationFilter.fromJson(json.decode(str));

String locationFilterToJson(LocationFilter data) => json.encode(data.toJson());

class LocationFilter {
  int userTypeId;
  int userId;
  List<FilterDatum> filterData;

  LocationFilter({
    this.userTypeId = 0,
    this.userId = 0,
    List<FilterDatum>? filterData,
  }) : filterData = filterData ?? [];

  factory LocationFilter.fromJson(Map<String, dynamic> json) => LocationFilter(
        userTypeId: json["UserTypeId"],
        userId: json["UserId"],
        filterData: List<FilterDatum>.from(
            json["FilterData"].map((x) => FilterDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "UserTypeId": userTypeId,
        "UserId": userId,
        "FilterData": List<dynamic>.from(filterData.map((x) => x.toJson())),
      };
}

class FilterDatum {
  int id;
  String code;
  String name;
  int isSelected;
  String parentLocationId;
  String type;
  String parentType;
  String childType;
  String locationId;

  FilterDatum({
    this.id = 0,
    this.code = "",
    this.name = "",
    this.isSelected = 0,
    this.parentLocationId = "",
    this.type = "",
    this.parentType = "",
    this.childType = "",
    this.locationId = "",
  });

  factory FilterDatum.fromJson(Map<String, dynamic> json) => FilterDatum(
        id: json["Id"],
        code: json["Code"],
        name: json["Name"],
        isSelected: json["IsSelected"],
        parentLocationId: json["ParentLocationId"],
        type: json["Type"],
        parentType: json["ParentType"],
        childType: json["ChildType"],
        locationId: json["LocationId"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Code": code,
        "Name": name,
        "IsSelected": isSelected,
        "ParentLocationId": parentLocationId,
        "Type": type,
        "ParentType": parentType,
        "ChildType": childType,
        "LocationId": locationId,
      };
}
