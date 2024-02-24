class Usermodel {
  String? uid;
  String? email;
  String? profilepic;
  String? fullname;

  Usermodel({this.uid, this.email, this.profilepic, this.fullname});

  Usermodel.fromMap(Map<String, dynamic> map) {
    uid = map["uid"];
    email = map["email"];
    profilepic = map["profilepic"];
    fullname = map["fullname"];
  }
  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "email": email,
      "profilepic": profilepic,
      "fullname": fullname,
    };
  }
}
