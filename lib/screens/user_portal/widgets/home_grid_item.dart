import 'package:flutter/material.dart';

class HomeGridItem extends StatelessWidget {
  const HomeGridItem(
      {super.key,
      required this.image,
      required this.text,
      required this.onPressed});
  final VoidCallback onPressed;
  final String image;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 150,
        width: 120,
        decoration: BoxDecoration(
            border: Border.all(width: 5, color: Color.fromARGB(55, 87, 83, 83)),
            borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                image,
                height: 50,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: const Color.fromARGB(255, 87, 83, 83)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
