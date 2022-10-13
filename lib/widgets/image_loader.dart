import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ImageLoader extends StatelessWidget {

  final String? urlImage;
  final double? heightContainer;
  final double? sizeLoader;

  const ImageLoader({Key? key, this.urlImage, this.heightContainer, this.sizeLoader}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return urlImage != null ? 

      Stack(
        children: [
          Center(child: 
            SizedBox(
              width: sizeLoader,
              height: sizeLoader,
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.secondary,
              ),
            )
          ),
          FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: urlImage!,
            fit: BoxFit.cover,
            height: heightContainer,
            
          ),
        ]
      ) 

      :

      Container(
        color: const Color.fromARGB(255, 64, 63, 63),
        child: const Center(
          child: Icon(Icons.newspaper_outlined),
        ),
      );


  }
}