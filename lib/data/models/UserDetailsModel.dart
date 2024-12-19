/// id : 5
/// userName : "Shariful Islam"
/// designation : "administrative officer"
/// contactNo : "+8801744865088"
/// email : "shariful.ao@iubat.edu"
/// userRoles : {"admin":true,"designation":"administrative officer","faculty":false,"AO":false}
/// IEBRoles : {"read":true,"write":false,"modify":false}
/// OBERoles : {"read":true,"write":false,"modify":false}
/// extension : "409"

class UserDetailsModel {
  UserDetailsModel({
      num? id, 
      String? userName, 
      String? designation, 
      String? contactNo, 
      String? email, 
      UserRoles? userRoles, 
      IebRoles? iEBRoles, 
      ObeRoles? oBERoles, 
      String? extension,}){
    _id = id;
    _userName = userName;
    _designation = designation;
    _contactNo = contactNo;
    _email = email;
    _userRoles = userRoles;
    _iEBRoles = iEBRoles;
    _oBERoles = oBERoles;
    _extension = extension;
}

  UserDetailsModel.fromJson(dynamic json) {
    _id = json['id'];
    _userName = json['userName'];
    _designation = json['designation'];
    _contactNo = json['contactNo'];
    _email = json['email'];
    _userRoles = json['userRoles'] != null ? UserRoles.fromJson(json['userRoles']) : null;
    _iEBRoles = json['IEBRoles'] != null ? IebRoles.fromJson(json['IEBRoles']) : null;
    _oBERoles = json['OBERoles'] != null ? ObeRoles.fromJson(json['OBERoles']) : null;
    _extension = json['extension'];
  }
  num? _id;
  String? _userName;
  String? _designation;
  String? _contactNo;
  String? _email;
  UserRoles? _userRoles;
  IebRoles? _iEBRoles;
  ObeRoles? _oBERoles;
  String? _extension;
UserDetailsModel copyWith({  num? id,
  String? userName,
  String? designation,
  String? contactNo,
  String? email,
  UserRoles? userRoles,
  IebRoles? iEBRoles,
  ObeRoles? oBERoles,
  String? extension,
}) => UserDetailsModel(  id: id ?? _id,
  userName: userName ?? _userName,
  designation: designation ?? _designation,
  contactNo: contactNo ?? _contactNo,
  email: email ?? _email,
  userRoles: userRoles ?? _userRoles,
  iEBRoles: iEBRoles ?? _iEBRoles,
  oBERoles: oBERoles ?? _oBERoles,
  extension: extension ?? _extension,
);
  num? get id => _id;
  String? get userName => _userName;
  String? get designation => _designation;
  String? get contactNo => _contactNo;
  String? get email => _email;
  UserRoles? get userRoles => _userRoles;
  IebRoles? get iEBRoles => _iEBRoles;
  ObeRoles? get oBERoles => _oBERoles;
  String? get extension => _extension;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['userName'] = _userName;
    map['designation'] = _designation;
    map['contactNo'] = _contactNo;
    map['email'] = _email;
    if (_userRoles != null) {
      map['userRoles'] = _userRoles?.toJson();
    }
    if (_iEBRoles != null) {
      map['IEBRoles'] = _iEBRoles?.toJson();
    }
    if (_oBERoles != null) {
      map['OBERoles'] = _oBERoles?.toJson();
    }
    map['extension'] = _extension;
    return map;
  }

}
class ObeRoles {
  ObeRoles({
      bool? read, 
      bool? write, 
      bool? modify,}){
    _read = read;
    _write = write;
    _modify = modify;
}

  ObeRoles.fromJson(dynamic json) {
    _read = json['read'];
    _write = json['write'];
    _modify = json['modify'];
  }
  bool? _read;
  bool? _write;
  bool? _modify;
ObeRoles copyWith({  bool? read,
  bool? write,
  bool? modify,
}) => ObeRoles(  read: read ?? _read,
  write: write ?? _write,
  modify: modify ?? _modify,
);
  bool? get read => _read;
  bool? get write => _write;
  bool? get modify => _modify;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['read'] = _read;
    map['write'] = _write;
    map['modify'] = _modify;
    return map;
  }

}

class IebRoles {
  IebRoles({
      bool? read, 
      bool? write, 
      bool? modify,}){
    _read = read;
    _write = write;
    _modify = modify;
}

  IebRoles.fromJson(dynamic json) {
    _read = json['read'];
    _write = json['write'];
    _modify = json['modify'];
  }
  bool? _read;
  bool? _write;
  bool? _modify;
IebRoles copyWith({  bool? read,
  bool? write,
  bool? modify,
}) => IebRoles(  read: read ?? _read,
  write: write ?? _write,
  modify: modify ?? _modify,
);
  bool? get read => _read;
  bool? get write => _write;
  bool? get modify => _modify;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['read'] = _read;
    map['write'] = _write;
    map['modify'] = _modify;
    return map;
  }

}

class UserRoles {
  UserRoles({
      bool? admin, 
      String? designation, 
      bool? faculty, 
      bool? ao,}){
    _admin = admin;
    _designation = designation;
    _faculty = faculty;
    _ao = ao;
}

  UserRoles.fromJson(dynamic json) {
    _admin = json['admin'];
    _designation = json['designation'];
    _faculty = json['faculty'];
    _ao = json['AO'];
  }
  bool? _admin;
  String? _designation;
  bool? _faculty;
  bool? _ao;
UserRoles copyWith({  bool? admin,
  String? designation,
  bool? faculty,
  bool? ao,
}) => UserRoles(  admin: admin ?? _admin,
  designation: designation ?? _designation,
  faculty: faculty ?? _faculty,
  ao: ao ?? _ao,
);
  bool? get admin => _admin;
  String? get designation => _designation;
  bool? get faculty => _faculty;
  bool? get ao => _ao;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['admin'] = _admin;
    map['designation'] = _designation;
    map['faculty'] = _faculty;
    map['AO'] = _ao;
    return map;
  }

}