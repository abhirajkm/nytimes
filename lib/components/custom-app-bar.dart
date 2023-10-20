import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Icon(Icons.vertical_split_outlined),
      title: Text(
        "NY Times Most Popular",
        style: Theme.of(context)
            .textTheme
            .headline6!
            .copyWith(color: Colors.white),
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 25,
            )),
        const Icon(Icons.more_vert)
      ],
    );
  }
}