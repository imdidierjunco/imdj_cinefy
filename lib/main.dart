import 'package:flutter/material.dart';

import 'data/repositories/autentication_repository_impl.dart';
import 'data/repositories/connectivity_repository_impl.dart';
import 'domain/repositories/autentication_repository.dart';
import 'domain/repositories/connectivity_repository.dart';
import 'my_app.dart';

void main() {
  runApp(
    Injector(
      autenticationRepository: AutenticationRepositoryImpl(),
      connectivityRepository: ConnectivityRepositoryImpl(),
      child: const MyApp(),
    ),
  );
}

class Injector extends InheritedWidget {
  const Injector({
    super.key,
    required super.child,
    required this.autenticationRepository,
    required this.connectivityRepository,
  });

  final ConnectivityRepository connectivityRepository;
  final AutenticationRepository autenticationRepository;

  @override
  // ignore: avoid_renaming_method_parameters
  bool updateShouldNotify(_) => false;

  static Injector of(BuildContext context) {
    final injector = context.dependOnInheritedWidgetOfExactType<Injector>();
    assert(injector != null, 'Injector could not be found');
    return injector!;
  }
}
