import 'package:flutter/material.dart';

import '../../../../domain/entities/user.dart';
import '../../../../main.dart';
import '../../../routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        _init();
      },
    );
  }

  Future<void> _init() async {
    final Injector injector = Injector.of(context);
    final connectivityRepository = injector.connectivityRepository;
    bool hasInternet = await connectivityRepository.hasInternet;

    if (hasInternet) {
      final autenticationRepository = injector.autenticationRepository;
      bool isSignedIn = await autenticationRepository.isSignedIn;

      if (isSignedIn) {
        User? user = await autenticationRepository.getUserData();
        if (mounted) {
          (user != null) ? _goTo(Routes.home) : _goTo(Routes.signIn);
        }
      } else if (mounted) {
        _goTo(Routes.signIn);
      }
    } else {}
  }

  void _goTo(String routeName) {
    Navigator.pushReplacementNamed(
      context,
      routeName,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SizedBox(
          width: 50,
          height: 50,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
