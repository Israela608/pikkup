import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/utils/unfocuser.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/config/themes/decorations.dart';
import 'package:pikkup/screens/page_screens/home_page_screens/schedule_delivery_pages_and_widgets/destination_address_page.dart';
import 'package:pikkup/screens/page_screens/home_page_screens/schedule_delivery_pages_and_widgets/pickup_address_page.dart';
import 'package:pikkup/screens/page_screens/home_page_screens/schedule_delivery_pages_and_widgets/product_information_page.dart';
import 'package:pikkup/screens/page_screens/home_page_screens/schedule_delivery_pages_and_widgets/receiver_information_page.dart';
import 'package:pikkup/view_models/home_page_view_models/send_a_package_view_model.dart';
import 'package:pikkup/widgets/standard_app_bar.dart';
import 'package:provider/provider.dart';

class SendAPackageScreen extends StatefulWidget {
  const SendAPackageScreen({Key? key}) : super(key: key);

  static const String id = 'send_a_package_screen';

  @override
  State<SendAPackageScreen> createState() => _SendAPackageScreenState();
}

class _SendAPackageScreenState extends State<SendAPackageScreen> {
  final pages = [
    ProductInformationPage(),
    PickupAddressPage(),
    DestinationAddressPage(),
    ReceiverInformationPage(),
  ];

  @override
  void initState() {
    super.initState();
    Provider.of<SendAPackageViewModel>(context, listen: false).initialize();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<SendAPackageViewModel>(context);

    return Unfocuser(
      child: Scaffold(
        backgroundColor: app_colors.background,
        appBar: StandardAppBar(
          title: 'Send a package',
          onBackPressed: () {
            model.currentPosition == 0
                ? Navigator.pop(context)
                : model.previousPage();
          },
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: kStandardPaddingSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
              const PageIndicator(),
              const SizedBox(height: 24),
              Expanded(
                child: PageView.builder(
                    //controller: PageController(),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: model.totalPages,
                    itemBuilder: (_, index) {
                      return IndexedStack(
                        //This will keep the state of the individual screens while switched
                        index: model.currentPosition.toInt(),
                        children: pages,
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PageIndicator extends StatelessWidget {
  const PageIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<SendAPackageViewModel>(context);

    const decorator = DotsDecorator(
      size: Size(71.0, 7.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
      ),
      color: app_colors.borderAsh,
      activeColor: app_colors.primaryBlue,
      activeSize: Size(71.0, 7.0),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
      ),
      spacing: EdgeInsets.all(0),
    );

    return DotsIndicator(
      dotsCount: model.totalPages,
      position: model.currentPosition,
      axis: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      decorator: decorator,
      /* onTap: (pos) {
        model.setCurrentPosition(currentPosition: pos);
      },*/
    );
  }
}
