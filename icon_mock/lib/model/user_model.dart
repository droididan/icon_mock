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
final UserModel asi = UserModel(
  id: 1,
  firstName: 'אסי',
  lastName: 'עזר',
  userUrl: 'assets/asi.jpg',
);

final UserModel bar = UserModel(
  id: 2,
  firstName: 'בר',
  lastName: 'רפאלי',
  userUrl: 'assets/bar.jpg',
);
final UserModel rotem = UserModel(
  id: 3,
  firstName: 'רותם',
  lastName: 'סלע',
  userUrl: 'assets/rotam.jpg',
);
final UserModel guy = UserModel(
  id: 4,
  firstName: 'גיא',
  lastName: 'פינס',
  userUrl: 'assets/guy.jpg',
);
final UserModel eyal = UserModel(
  id: 5,
  firstName: 'אייל',
  lastName: 'גולן',
  userUrl: 'assets/eyal.jpg',
);

final UserModel eden = UserModel(
  id: 6,
  firstName: 'עדן',
  lastName: 'בן זקן',
  userUrl: 'assets/eden.jpeg',
);

final UserModel natali = UserModel(
  id: 7,
  firstName: 'נטלי',
  lastName: 'דדון',
  userUrl: 'assets/natali.jpeg',
);
