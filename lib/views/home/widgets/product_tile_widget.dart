import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductTile extends StatefulWidget {
  final String id;
  final String name;
  final String category;
  final String price;
  final String image;
  final String rating;

  const ProductTile({
    Key? key,
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.image,
    required this.rating,
  }) : super(key: key);

  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  bool isAddedToWishlist = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Column(
          children: [
            Container(
              width: size.width / 5,
              height: size.height / 8,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    image: NetworkImage(widget.image),
                    fit: BoxFit.cover,
                  )),
            ),
            SizedBox(
              height: size.height / 60,
            ),
            Text(
              widget.name,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                    letterSpacing: .5,
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w900),
              ),
            ),
            SizedBox(
              height: size.height / 150,
            ),
            Text(
              widget.category,
              maxLines: 1,
              overflow: TextOverflow.clip,
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                    letterSpacing: .5,
                    fontSize: 12,
                    color: Colors.black54,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: size.height / 150,
            ),
            Text(
              "₹${widget.price}.00",
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                    letterSpacing: .5,
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w900),
              ),
            ),
          ],
        ),
        Positioned(
          left: size.width / 3.5,
          top: size.height / 10,
          child: Container(
            height: size.height / 35,
            width: size.width / 9,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: size.width / 120),
                  child: Text(
                    widget.rating,
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        letterSpacing: .5,
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.star,
                  color: Colors.white,
                  size: 15,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
