import 'dart:async';

import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:rxdart/rxdart.dart';

enum SnackbarStyle { error, success }

class InternetConnectionSnackbar extends StatefulWidget {
  const InternetConnectionSnackbar({super.key});

  @override
  State<InternetConnectionSnackbar> createState() =>
      _InternetConnectionSnackbarState();
}

class _InternetConnectionSnackbarState extends State<InternetConnectionSnackbar>
    with TickerProviderStateMixin {
  late bool isFirstShowing;
  late BehaviorSubject<SnackbarStyle> style;
  late final InternetConnectionChecker internet;
  late final StreamSubscription connectionSubscription;
  late final AnimationController animationController;
  late final Animation<double> animation;

  @override
  void initState() {
    isFirstShowing = true;
    style = BehaviorSubject();
    internet = InternetConnectionChecker();
    connectionSubscription = internet.onStatusChange.listen((status) async {
      if (!isFirstShowing ||
          (isFirstShowing && status == InternetConnectionStatus.disconnected)) {
        await animationController.reverse();
        style.add(
          status == InternetConnectionStatus.connected
              ? SnackbarStyle.success
              : SnackbarStyle.error,
        );
        animationController.forward();
      }
      isFirstShowing = false;
    });
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.fastOutSlowIn,
        reverseCurve: Curves.fastOutSlowIn,
      ),
    );
    animationController.addListener(_animationListener);
    super.initState();
  }

  @override
  void dispose() {
    style.close();
    connectionSubscription.cancel();
    animationController
      ..removeListener(_animationListener)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: SizeTransition(
        sizeFactor: animation,
        child: StreamBuilder(
          stream: style,
          builder: (context, snapshot) {
            final style = snapshot.data;
            return Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(
                top: 8 + MediaQuery.of(context).viewPadding.top,
                bottom: 8,
              ),
              decoration: BoxDecoration(
                color:
                    style == SnackbarStyle.success ? Colors.green : Colors.red,
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(8)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    style == SnackbarStyle.success
                        ? 'Connection restored'
                        : 'Retrying',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.white),
                  ),
                  if (style == SnackbarStyle.error) const SizedBox(width: 5),
                  if (style == SnackbarStyle.error)
                    const SizedBox(
                      width: 10,
                      height: 10,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _animationListener() async {
    final connection = await internet.hasConnection;
    if (connection && animationController.status == AnimationStatus.completed) {
      await Future.delayed(const Duration(milliseconds: 2500));
      animationController.reverse();
    } else if (animationController.status == AnimationStatus.completed) {
      await Future.delayed(const Duration(hours: 30000));
      animationController.reverse();
    }
  }
}
