import 'dart:ui';

import 'package:ekrilli_app/components/description_viewer.dart';
import 'package:ekrilli_app/components/map_apps.dart';
import 'package:ekrilli_app/components/pictures_slider.dart';
import 'package:ekrilli_app/components/rating_widget.dart';
import 'package:ekrilli_app/components/stars_widget.dart';
import 'package:ekrilli_app/components/rooms_number_widget.dart';
import 'package:ekrilli_app/components/submit_button.dart';
import 'package:ekrilli_app/components/title_widget.dart';
import 'package:ekrilli_app/models/offer.dart';
import 'package:ekrilli_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:map_launcher/map_launcher.dart';

import '../components/custom_app_bar.dart';

class HouseDetailsScreen extends StatelessWidget {
  HouseDetailsScreen({
    Key? key,
    required this.offer,
    this.isPreview = false,
  }) : super(key: key);
  Offer offer;
  bool isPreview;
  EdgeInsets margin = EdgeInsets.symmetric(
    horizontal: Get.width * 0.03,
    vertical: Get.height * 0.01,
  );
  GlobalKey startChattingButton = GlobalKey();
  RxDouble startChattingButtonHeight = 0.0.obs;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((d) {
      startChattingButtonHeight.value =
          (startChattingButton.currentContext?.findRenderObject() as RenderBox)
              .size
              .height;
      print(startChattingButtonHeight);
    });
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            isPreview
                ? CustomAppBar(title: 'Preview')
                : CustomAppBar(
                    title: 'House',
                    backButton: true,
                    trailing: InkWell(
                      child: const Icon(
                        Icons.favorite_border,
                        color: Colors.black54,
                      ),
                      onTap: () {},
                    ),
                  ),
            Expanded(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: Get.width * 0.03,
                            vertical: Get.height * 0.02,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            offer.house?.title ?? '',
                            style: Get.theme.textTheme.headline5
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                        PicturesSlider(
                          pictures: offer.house?.pictures ?? [],
                        ),
                        SizedBox(height: Get.height * 0.03),
                        Container(
                          margin: margin,
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                  offer.house?.owner?.picture ?? '',
                                ),
                                radius: Get.width * 0.07,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                offer.house?.owner?.username ?? '',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(),
                              StarsWidget(
                                stars: offer.house?.stars ?? 0,
                                numReviews: offer.house?.numReviews ?? 1,
                                type: StarsWidgetType.digital,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: margin,
                          child: RoomsNumberWidget(
                            kitchens: offer.house?.kitchens ?? 1,
                            bathrooms: offer.house?.bathrooms ?? 1,
                            bedrooms: offer.house?.bedrooms ?? 1,
                            color: Colors.black54,
                            size: 25,
                            textStyle: Get.theme.textTheme.headline5,
                          ),
                        ),
                        Container(
                          margin: margin,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  if (offer.house!.locationLatitude != null &&
                                      offer.house!.locationLongitude != null) {
                                    Get.bottomSheet(
                                      MapApps(
                                        coords: Coords(
                                          offer.house!.locationLatitude!,
                                          offer.house!.locationLongitude!,
                                        ),
                                      ),
                                      elevation: 0,
                                      barrierColor: Colors.transparent,
                                    );
                                  }
                                },
                                child: Row(
                                  children: const [
                                    FaIcon(
                                      FontAwesomeIcons.locationDot,
                                      color: primaryColor,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      'Open Map',
                                      style: TextStyle(
                                        color: primaryColor,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  offer.pricePerDay.toString(),
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.end,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const Text(
                                'DA/Day',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        TitleWidget(
                          title: 'Description:',
                          margin: margin.copyWith(
                            bottom: 0,
                            top: Get.height * 0.04,
                          ),
                          textStyle: Get.textTheme.headline6?.copyWith(
                            color: Colors.black.withOpacity(0.7),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          margin: margin,
                          child: DescriptionViewer(
                              text: offer.house!.description ?? ''),
                        ),
                        RatingWidget(offer: offer),
                        Obx(
                          () => SizedBox(
                            height: startChattingButtonHeight.value,
                          ),
                        ),
                      ],
                    ),
                  ),
                  isPreview
                      ? const SizedBox()
                      : Positioned(
                          width: Get.width,
                          bottom: 0,
                          child: ClipRRect(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: 6,
                                sigmaY: 6,
                              ),
                              child: Center(
                                child: SubmitButton(
                                  key: startChattingButton,
                                  text: 'Start Chatting',
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 25,
                                  ),
                                  onTap: () {},
                                ),
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
