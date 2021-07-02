import '../models/movieDetails.dart';
import 'package:flutter/material.dart';

class WatchProvidersSection extends StatelessWidget {
  WatchProvidersSection({required this.watchProviders});

  final List<WatchProviders> watchProviders;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: watchProviders.map((provider) => Text(provider.name)).toList(),
    );
  }
}
