class Contacts {
  String? name;
  String? phone;
  String? email;
  String? sId;

  Contacts({this.name, this.phone, this.email, this.sId});

  Contacts.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['_id'] = this.sId;
    return data;
  }
}