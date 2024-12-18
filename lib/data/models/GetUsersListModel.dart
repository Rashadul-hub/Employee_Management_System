/// id : 8
/// userName : "Dr Abhijit Saha"
/// contactNo : "+8801711201907"
/// email : "asaha@iubat.edu"
/// designation : "professor & coordinator"
/// extension : "615"
/// userRoles : "551b95bab9a827ce991f9f81747e890a45b28db90d320016d470826557c8772c5ad8cdcdb800a635112c70c856ec93a22448ac7eb61819e09189d2348d6fc76945d8079dd7d0bcbb8e2c031de79093f7e3c41c75207eb5f09f2b92dd1ea5f823"

class GetUsersListModel {
  GetUsersListModel({
      num? id, 
      String? userName, 
      String? contactNo, 
      String? email, 
      String? designation, 
      String? extension, 
      String? userRoles,}){
    _id = id;
    _userName = userName;
    _contactNo = contactNo;
    _email = email;
    _designation = designation;
    _extension = extension;
    _userRoles = userRoles;
}

  GetUsersListModel.fromJson(dynamic json) {
    _id = json['id'];
    _userName = json['userName'];
    _contactNo = json['contactNo'];
    _email = json['email'];
    _designation = json['designation'];
    _extension = json['extension'];
    _userRoles = json['userRoles'];
  }
  num? _id;
  String? _userName;
  String? _contactNo;
  String? _email;
  String? _designation;
  String? _extension;
  String? _userRoles;
GetUsersListModel copyWith({  num? id,
  String? userName,
  String? contactNo,
  String? email,
  String? designation,
  String? extension,
  String? userRoles,
}) => GetUsersListModel(  id: id ?? _id,
  userName: userName ?? _userName,
  contactNo: contactNo ?? _contactNo,
  email: email ?? _email,
  designation: designation ?? _designation,
  extension: extension ?? _extension,
  userRoles: userRoles ?? _userRoles,
);
  num? get id => _id;
  String? get userName => _userName;
  String? get contactNo => _contactNo;
  String? get email => _email;
  String? get designation => _designation;
  String? get extension => _extension;
  String? get userRoles => _userRoles;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['userName'] = _userName;
    map['contactNo'] = _contactNo;
    map['email'] = _email;
    map['designation'] = _designation;
    map['extension'] = _extension;
    map['userRoles'] = _userRoles;
    return map;
  }

}