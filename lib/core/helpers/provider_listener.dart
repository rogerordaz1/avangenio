import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderListener<T> extends StatelessWidget {
  final Widget Function(BuildContext context, T value) builder;
  final void Function(T value) listener;

  const ProviderListener({
    Key? key,
    required this.builder,
    required this.listener,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<T>(
      builder: (context, value, child) {
        listener(value);
        return builder(context, value);
      },
    );
  }
}