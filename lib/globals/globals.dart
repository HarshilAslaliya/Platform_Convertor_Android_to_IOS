import 'dart:io';

List<Map<String, dynamic>> allContacts = [
  {
    'id': 1,
    'name': 'Iron Man',
    'des': 'Tony Stark',
    'time': 'Now',
    'phone': '+91 97645 97867',
    'image': 'assets/images/iron.jpeg',
  },
  {
    'id': 2,
    'name': 'Captain America',
    'des': 'Steave Rogers',
    'time': '05:02 AM',
    'phone': '+91 97757 76465',
    'image': 'assets/images/captain.jpg',
  },
  {
    'id': 3,
    'name': 'Ant Man',
    'des': 'Mr Nobody',
    'time': 'Now',
    'phone': '+91 97785 97867',
    'image': 'assets/images/ant-man.jpg',
  },
  {
    'id': 4,
    'name': 'Black Panther',
    'des': 'Power of vibranium',
    'time': '3:02 PM',
    'phone': '+91 75845 97867',
    'image': 'assets/images/blackpanther.jpg',
  },
  {
    'id': 5,
    'name': 'Spider-Man',
    'des': 'Peter Parker',
    'time': '8:09 PM',
    'phone': '+91 97645 75788',
    'image': 'assets/images/spiderman.jpg',
  },
  {
    'id': 6,
    'name': 'Thor',
    'des': 'Superhumun strength',
    'time': 'yesterday',
    'phone': '+91 97645 97867',
    'image': 'assets/images/thor.jpg',
  },
  // {'id':7, 'name':'Iron Man','des':'Tony Stark','time':'11:02 AM','phone':'+91 97645 97867'},
];
List<Map<String, dynamic>> allContacts1 = [];

class Globals {
  static String? name;
  static String? description;
  static String? call;
  static File? image;

  static bool isIos= false;

}
