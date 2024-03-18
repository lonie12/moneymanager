import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SingleSkeleton extends StatelessWidget {
  final double? height;
  final double? width;
  final double? borderRadius;

  const SingleSkeleton({Key? key, this.height, this.width, this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Shimmer.fromColors(
        baseColor: Colors.black.withOpacity(0.05),
        highlightColor: Colors.black.withOpacity(0.4),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 0),
            ),
          ),
        ),
      ),
    );
  }
}

class CircleSkeleton extends StatelessWidget {
  final double size;

  const CircleSkeleton({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Shimmer.fromColors(
        baseColor: Colors.black.withOpacity(0.05),
        highlightColor: Colors.black.withOpacity(0.4),
        child: Container(
          width: size,
          height: size,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white, // Couleur du cercle
          ),
        ),
      ),
    );
  }
}
