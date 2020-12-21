class User {
  //{"id":11,"email":"george.edwards@reqres.in","first_name":"George","last_name":"Edwards","avatar":"https://reqres.in/img/faces/11-image.jpg"},
  int id;
  String emailID;
  String firstName;
  String lastName;
  String avatarUrl;
  User(var data) {
    this.id=data['id'];
    this.emailID = data['email'];
    this.firstName = data['first_name'];
    this.lastName = data['last_name'];
    this.avatarUrl=data['avatar'];

  }
}
