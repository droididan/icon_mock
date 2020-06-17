class UserModel {
  final String name;
  final int age;
  final String userUrl;
  final UserType type;

  UserModel(this.name, this.age, this.userUrl, this.type);
}


enum UserType {
  user, celeb
}