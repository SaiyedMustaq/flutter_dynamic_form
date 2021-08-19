/// id : "01"
/// name : "Food & beverage"
/// String : "13.5%"

class AddVatModel {
  String _id;
  String _name;
  String _vat;

  String get id => _id;
  String get name => _name;
  String get vat => _vat;

  AddVatModel({
      String id,
      String name,
      String vat}){
    _id = id;
    _name = name;
    _vat = vat;
}

  AddVatModel.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
    _vat = json["vat"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    map["vat"] = _vat;
    return map;
  }

}

