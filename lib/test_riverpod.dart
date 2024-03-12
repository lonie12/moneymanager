// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:moneymanager/main.dart';

// // Consume Provider Using CusumerWidget
// class TestRiverpodProvider extends ConsumerWidget {
//   const TestRiverpodProvider({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final name = ref.watch(nameProvider);
//     return Scaffold(
//       body: Center(
//         child: Text(name),
//       ),
//     );
//   }
// }

// // Consume Provider Using Stateless or Statelful Widget
// class TestRiverPodProviderStateless extends StatelessWidget {
//   const TestRiverPodProviderStateless({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Consumer(
//           builder: (context, ref, child) {
//             final name = ref.watch(nameProvider);
//             return Text(name);
//           },
//         ),
//       ),
//     );
//   }
// }

// // Consume and update values whit StateProvider
// class TestRiverpodStateProvider extends StatelessWidget {
//   const TestRiverpodStateProvider({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Center(
//           child: Consumer(
//             builder: (context, ref, child) {
//               final count = ref.watch(countProvider);
//               return Column(
//                 children: [
//                   Text(
//                     count.toString(),
//                     style: const TextStyle(fontSize: 50),
//                   ),
//                   ElevatedButton(
//                     onPressed: () => ref.read(countProvider.notifier).update(
//                           (state) => state + 1,
//                         ),
//                     child: const Icon(Icons.add),
//                   )
//                 ],
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// // Consume and update values whit StateProvider
// class TestRiverpodStateNotifier extends StatelessWidget {
//   const TestRiverpodStateNotifier({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Center(
//           child: Consumer(
//             builder: (context, ref, child) {
//               final user = ref.watch(userProvider);
//               return Column(
//                 children: [
//                   Text(
//                     user.name,
//                     style: const TextStyle(fontSize: 50),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       ref.read(userProvider.notifier).updateName("Rachid");
//                     },
//                     child: const Icon(Icons.add),
//                   )
//                 ],
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// // Consume and update values whit StateProvider
// class TestRiverpodFuturerProvider extends ConsumerWidget {
//   const TestRiverpodFuturerProvider({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     var user = ref.watch(fetchUserData);
//     return Scaffold(
//       body: SafeArea(
//         child: user.when(
//           data: (data) {
//             return Text(data.email);
//           },
//           error: (error, stackTrace) {
//             return Text(error.toString());
//           },
//           loading: () => const CircularProgressIndicator(),
//         ),
//       ),
//     );
//   }
// }
