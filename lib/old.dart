
// class User {
//   final String name;
//   final String email;

//   User({required this.name, required this.email});

//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       email: json["email"],
//       name: json["name"],
//     );
//   }
// }

// final nameProvider = Provider<String>((ref) {
//   return "Abdou Rachid";
// });

// final countProvider = StateProvider<int>((ref) {
//   return 0;
// });

// class UserNotifier extends StateNotifier<User> {
//   UserNotifier(
//     super.state,
//   ); //Indicating that a state is required as an argument
//   //Properties
//   void updateName(String n) {
//     state = User(
//       name: n,
//       email: state.email,
//     );
//     // copywith(name: n);
//   }

//   void updateEmail(String e) {
//     state = User(
//       name: state.name,
//       email: e,
//     );
//   }
// }

// //                                            class  , state
// final userProvider = StateNotifierProvider<UserNotifier, User>((ref) {
//   return UserNotifier(User(name: "initialName", email: "rbatoulime@gmail.com"));
// //                      passing the initial state
// });

// final fetchUserData = FutureProvider<User>(
//   (ref) {
//     const url = 'https://jsonplaceholder.typicode.com/users/2';
//     return http
//         .get(Uri.parse(url))
//         .then((value) => User.fromJson(json.decode(value.body)));
//   },
// );