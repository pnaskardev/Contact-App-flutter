class Contacts {
  String? name;
  String? phone;
  String? email;
  String? id;

  Contacts({this.name, this.phone, this.email, this.id});

  Contacts.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    id = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['phone'] = phone;
    data['email'] = email;
    data['_id'] = id;
    return data;
  }

  
}