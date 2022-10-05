
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

CachedNetworkImage cachedNetworkImage(String image, {required imagePath,double width=double.infinity,double height=double.infinity}) {
  return CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: imagePath ,
      placeholder: (context, url) => Center(
              child: Image.asset(
            "assets/images/foodloading.gif",
            fit: BoxFit.cover,
            height:height ?? double.infinity,
            width: width ?? double.infinity,
          )),
      errorWidget: (context, url, error) {
        return Center(
            child: Image.asset(
          "assets/images/food.png",
          fit: BoxFit.cover,
          height: height ?? double.infinity,
          width: width ?? double.infinity,
        ));
      });
}

