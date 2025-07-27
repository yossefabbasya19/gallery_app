import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:gallery_app/core/my_routes/my_routes.dart';

class PhotoCard extends StatelessWidget {
  final String imageUrl;
  final double borderRadius;

  const PhotoCard({Key? key, required this.imageUrl, this.borderRadius = 16.0})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          MyRoutes.photoDetails,
          arguments: imageUrl,
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          placeholder: (context, url) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).hintColor,
              ),
            );
          },
          fadeInCurve: Curves.easeInBack,
          errorWidget: (context, url, error) => Container(
            height: 100,
            color: Theme.of(context).hintColor,
            child: Icon(Icons.error, color: Theme.of(context).primaryColor),
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
