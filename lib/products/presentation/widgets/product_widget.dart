import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:route_flutter_task/core/utils/app_images.dart';
import 'package:route_flutter_task/products/data/models/ProductResponseDTO.dart';

class ProductWidget extends StatelessWidget {
  final Product product;

  const ProductWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
            color: const Color(0xff004182).withOpacity(.3), width: 2),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    product.thumbnail!,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.error),
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: SvgPicture.asset(Images.imagesFavouriteIcon),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 7),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${product.title}",
                    style: Theme.of(context).textTheme.bodyLarge),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      "EGP ${(product.price! - (product.price! * product.discountPercentage! / 100)).toStringAsFixed(2)}",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(width: 5),
                    Text("${product.price} EGP",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 11,
                            color: const Color(0xff004182).withOpacity(.6),
                            decoration: TextDecoration.lineThrough,
                            decorationColor:
                                const Color(0xff004182).withOpacity(.6))),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text("Review (${product.rating})",
                        style: Theme.of(context).textTheme.bodyLarge),
                    const SizedBox(width: 5),
                    SvgPicture.asset(Images.imagesStarIcon),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: SvgPicture.asset(Images.imagesAddIcon),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
