import 'package:flutter/material.dart';

class SelectedCard extends StatelessWidget {
  const SelectedCard(
      {Key? key,
      required this.imagePath,
      required this.textTitle,
      required this.selected,
      required this.showImage,
      required this.onPressed})
      : super(key: key);
  final String imagePath;
  final String textTitle;
  final bool selected;

  final bool showImage;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 90,
      child: Stack(
        children: [
          if (showImage == true)
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Image.asset(
                  imagePath,
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.7,
                  alignment: Alignment.bottomCenter,
                  color: selected
                      ? Theme.of(context).colorScheme.secondary
                      : Theme.of(context).textTheme.caption?.color,
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
            child: OutlinedButton(
              onPressed: onPressed,
              style: OutlinedButton.styleFrom(
                  minimumSize: Size(343, 80),
                  side: BorderSide(
                      width: 1,
                      color: selected
                          ? Theme.of(context).colorScheme.secondary
                          : Theme.of(context).colorScheme.outline)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    textTitle,
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        color: selected
                            ? Theme.of(context).colorScheme.secondary
                            : null,
                       ),
                  ),
                ],
              ),
            ),
          ),
          if (selected)
            Align(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.verified,
                size: 20,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
        ],
      ),
    );
  }
}
