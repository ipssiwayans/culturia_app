import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../core/app_export.dart';

class CustomRatingBar extends StatelessWidget {
  const CustomRatingBar({
    super.key,
    this.alignment,
    this.ignoreGestures,
    this.initialRating,
    this.itemsSize,
    this.itemCount,
    this.color,
    this.unselectedColor,
    this.onRatingUpdate
  });

  final Alignment? alignment;

  final bool? ignoreGestures;

  final double? initialRating;

  final double? itemsSize;

  final int? itemCount;

  final Color? color;

  final Color? unselectedColor;

  final Function(double)? onRatingUpdate;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
      alignment: alignment ?? Alignment.center, child: ratingBarWidget)
        : ratingBarWidget;
  }

  Widget get ratingBarWidget => RatingBar.builder(
    ignoreGestures: ignoreGestures ?? false,
    initialRating: initialRating ?? 0,
    minRating: 0,
    direction: Axis.horizontal,
    allowHalfRating: false,
    itemSize: itemsSize ?? 20.h,
    unratedColor: unselectedColor,
    itemCount: itemCount ?? 4,
    updateOnDrag: true,
    itemBuilder: (context, _) {
      return Icon(
        Icons.star,
        color: color,
      );
    },
    onRatingUpdate: (rating) {
      onRatingUpdate!.call(rating);
    },
  );
}