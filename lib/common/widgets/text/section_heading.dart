import 'package:face_skin_detection_flutter/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TSectionHeading extends StatelessWidget {
  const TSectionHeading({
    super.key,
    this.textColor,
    required this.title,
    this.buttonTitle = 'View All',
    this.onPressed,
    this.showActionButton = true,
  });

  final Color? textColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: TSizes.defaultSpace),
      child: Row(
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: textColor),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          if (showActionButton)
            TextButton(onPressed: onPressed, child: Text(buttonTitle)),
        ],
      ),
    );
  }
}
