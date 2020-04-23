

class User{
  int id;
  String name, email, username,phone;

  User(int id, String name, String email, String phone, String username){
    this.id=id;
    this.name=name;
    this.email=email;
    this.phone=phone;
    this.username=username;
  }

  User.fromJson(Map json)
      : id = json['id'],
        name = json['name'],
        email = json['email'],
        phone = json['phone'],
        username=json['username'];

  Map toJson(){
    return {'id': id, 'name':name, 'email': email, 'phone':phone, 'username':username };
  }
}