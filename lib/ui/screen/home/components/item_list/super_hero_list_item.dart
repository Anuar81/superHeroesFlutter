import 'package:flutter/material.dart';

class SuperHeroListItem extends StatelessWidget {
  final String thumbnail;
  final String extension;
  final String name;
  final VoidCallback onTap;

  const SuperHeroListItem({
    required this.thumbnail,
    required this.extension,
    required this.name,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(
          children: [
            Image.network(
              '${thumbnail}.${extension}',
              width: 50,
              height: 50,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                name,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}