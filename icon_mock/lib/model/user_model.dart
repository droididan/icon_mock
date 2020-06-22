class UserModel {
  int id;
  String firstName;
  String lastName;
  int age;
  String userUrl;
  UserType type;

  String get fullName => '$firstName $lastName';

  UserModel({
    this.firstName,
    this.lastName,
    this.age,
    this.userUrl,
    this.type,
    this.id,
  });
}

enum UserType { user, celeb }

UserModel userState = UserModel();

// USERS
final UserModel greg = UserModel(
  id: 1,
  firstName: 'אסי',
  userUrl: 'assets/asi.jpg',
);

final UserModel bar = UserModel(
  id: 2,
  firstName: 'בר',
  userUrl: 'assets/bar.jpg',
);
final UserModel john = UserModel(
  id: 3,
  firstName: 'רותם',
  userUrl: 'assets/rotam.jpg',
);
final UserModel guy = UserModel(
  id: 4,
  firstName: 'גיא',
  userUrl: 'assets/guy.jpg',
);
final UserModel eyal = UserModel(
  id: 5,
  firstName: 'אייל',
  userUrl: 'assets/eyal.jpg',
);
