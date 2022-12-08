import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:halal_scan/models/config.dart';
import 'package:halal_scan/utility/common_functions.dart';
import 'package:halal_scan/widgets/appbar.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:screenshot/screenshot.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../models/product.dart';

class CustomProductDetailPage extends StatefulWidget {
  final CustomProductModel model;
  const CustomProductDetailPage({super.key, required this.model});

  @override
  State<CustomProductDetailPage> createState() =>
      _CustomProductDetailPageState();
}

class _CustomProductDetailPageState extends State<CustomProductDetailPage> {
  bool isLiked = false;
  final ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: screenshotController,
      child: Scaffold(
          appBar: DetailAppBar(
            title: widget.model.name,
            name: CustomPageName.productDetails,
            screenshotController: screenshotController,
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 350,
                  decoration: BoxDecoration(
                    color: CustomColor.lightBackColor.withOpacity(0.5),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      Flexible(
                        flex: 2,
                        child: Row(children: [
                          Flexible(
                            flex: 3,
                            child: Container(
                              padding:
                                  const EdgeInsets.only(left: 30, bottom: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AutoSizeText(
                                    widget.model.company,
                                    maxLines: 1,
                                    style: titleMedium(),
                                  ),
                                  AutoSizeText(
                                    widget.model.name.toUpperCase(),
                                    maxLines: 2,
                                    style: titleLarge(),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Flexible(
                              flex: 2,
                              child: SizedBox.expand(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 30),
                                    child: AutoSizeText(
                                      timeago.format(
                                          widget.model.reviewedAt.toDate()),
                                      maxLines: 1,
                                      style: bodyLarge().copyWith(
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              )),
                        ]),
                      ),
                      Flexible(
                        flex: 4,
                        child: Row(
                          children: [
                            Flexible(
                              flex: 5,
                              child: Container(
                                margin: const EdgeInsets.only(
                                    bottom: 20, left: 30, right: 30),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                          color: getHalalColor(
                                              widget.model.status),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10.0),
                                            child: Image.asset(
                                              getHalalIcon(widget.model.status),
                                              height: 25,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          AutoSizeText(
                                            widget.model.status
                                                .toShortStatus()
                                                .toUpperCase(),
                                            maxLines: 1,
                                            style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'PRICE',
                                          style: bodyLarge(),
                                        ),
                                        Text(
                                          widget.model.price,
                                          style: const TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                      ),
                                      child: IconButton(
                                          iconSize: 35,
                                          onPressed: () => setState(() {
                                                isLiked = !isLiked;
                                              }),
                                          icon: Icon(
                                            isLiked
                                                ? CupertinoIcons.heart
                                                : CupertinoIcons.heart_fill,
                                            color: CustomColor.darkBackColor,
                                          )),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 6,
                              child: SizedBox.expand(
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: CustomColor.lightBackColor,
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomLeft: Radius.circular(20)),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomLeft: Radius.circular(20)),
                                    child: PhotoViewGallery.builder(
                                      itemCount: 2,
                                      builder: (context, index) {
                                        return PhotoViewGalleryPageOptions(
                                          imageProvider: NetworkImage(
                                            index == 0
                                                ? widget.model.faceUrl
                                                : widget.model.backUrl,
                                          ),
                                          minScale:
                                              PhotoViewComputedScale.contained *
                                                  0.8,
                                          maxScale:
                                              PhotoViewComputedScale.covered *
                                                  2,
                                        );
                                      },
                                      scrollPhysics:
                                          const BouncingScrollPhysics(),
                                      backgroundDecoration: BoxDecoration(
                                        color: CustomColor.lightBackColor,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20)),
                                      ),
                                      loadingBuilder: (context, event) =>
                                          Center(
                                        child:
                                            CircularProgressIndicator.adaptive(
                                          value: event == null
                                              ? 0
                                              : event.cumulativeBytesLoaded /
                                                  event.expectedTotalBytes!,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      top: 20, left: 30, right: 30, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Ingredients', style: bodyLarge()),
                      const SizedBox(height: 10),
                      Text(
                        'Lorem ipsum dolor sit amet consectetur. Consectetur venenatis lacus arcu nunc nunc. Tempor diam amet a sed mattis ultrices. Blandit faucibus ultrices lacus augue. Leo enim viverra cursus ultrices id vel. Faucibus ultrices neque at non quis fringilla dictum ac. Vitae.',
                        style: bodyMedium(),
                      ),
                      const SizedBox(height: 10),
                      Text('Why HARAM?', style: bodyLarge()),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 70,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: getHalalColor(widget.model.status),
                                borderRadius: BorderRadius.circular(100)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network(
                                  'https://cdn-icons-png.flaticon.com/512/3800/3800591.png',
                                  fit: BoxFit.contain),
                            ),
                          ),
                          Container(
                            height: 70,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: getHalalColor(widget.model.status),
                                borderRadius: BorderRadius.circular(100)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network(
                                  'https://cdn-icons-png.flaticon.com/512/1357/1357510.png',
                                  fit: BoxFit.contain),
                            ),
                          ),
                          Container(
                            height: 70,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: getHalalColor(widget.model.status),
                                borderRadius: BorderRadius.circular(100)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network(
                                  'https://cdn-icons-png.flaticon.com/512/1775/1775321.png',
                                  fit: BoxFit.contain),
                            ),
                          ),
                          Container(
                            height: 70,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: getHalalColor(widget.model.status),
                                borderRadius: BorderRadius.circular(100)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network(
                                  'https://cdn-icons-png.flaticon.com/512/892/892917.png',
                                  fit: BoxFit.fitHeight),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
