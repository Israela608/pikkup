import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:pikkup/components/spacer.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/screens/send/pages/destination_address_page.dart';
import 'package:pikkup/screens/send/pages/pickup_address_page.dart';
import 'package:pikkup/screens/send/pages/product_information_page.dart';
import 'package:pikkup/screens/send/pages/receiver_information_page.dart';
import 'package:pikkup/utils/dimensions.dart';
import 'package:pikkup/view_models/home_page_view_models/send_a_package_view_model.dart';
import 'package:pikkup/widgets/scaffolds/standard_scaffold.dart';
import 'package:provider/provider.dart';

class SendAPackageScreen extends StatefulWidget {
  const SendAPackageScreen({Key? key}) : super(key: key);

  static const String id = '/send_a_package_screen';

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

    return StandardScaffold(
      title: 'Send a package',
      isScrollable: false,
      onBackPressed: () {
        model.currentPosition == 0
            ? Navigator.pop(context)
            : model.previousPage();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const StandardSpacer(),
          const PageIndicator(),
          const StandardSpacer(),
          Expanded(
            child: PageView.builder(
                //controller: PageController(),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: model.totalPages,
                itemBuilder: (_, index) {
                  return SingleChildScrollView(
                    child: IndexedStack(
                      //This will keep the state of the individual screens while switched
                      index: model.currentPosition.toInt(),
                      children: pages,
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class PageIndicator extends StatelessWidget {
  const PageIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<SendAPackageViewModel>(context);

    final decorator = DotsDecorator(
      size: Size(Dimensions.d70 + Dimensions.d1, Dimensions.d7),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.d12),
      ),
      color: app_colors.borderAsh,
      activeColor: app_colors.primaryBlue,
      activeSize: Size(Dimensions.d70 + Dimensions.d1, Dimensions.d7),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.d12),
      ),
      spacing: const EdgeInsets.all(0),
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
