import 'package:flutter/material.dart';
import 'package:pikkup/components/buttons/wide_button.dart';
import 'package:pikkup/components/buttons/wide_button_ash.dart';
import 'package:pikkup/components/texts/body_text.dart';
import 'package:pikkup/components/texts/header_text.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/utils/dimensions.dart';
import 'package:pikkup/utils/ui_parameters.dart';
import 'package:pikkup/view_models/home_page_view_models/promo_view_model.dart';
import 'package:pikkup/widgets/scaffolds/standard_scaffold.dart';
import 'package:provider/provider.dart';

class PromoScreen extends StatefulWidget {
  const PromoScreen({Key? key}) : super(key: key);

  static const String id = '/promo_screen';

  @override
  State<PromoScreen> createState() => _PromoScreenState();
}

class _PromoScreenState extends State<PromoScreen> {
  @override
  void initState() {
    Provider.of<PromoViewModel>(context, listen: false).instantiate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StandardScaffold(
      title: 'Promos & Special Offers',
      isScrollable: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: Dimensions.d32),
          const Expanded(child: PromoList()),
          SizedBox(height: Dimensions.d30 + Dimensions.d8),
          const ApplyOfferButton(),
          SizedBox(height: Dimensions.d10 + Dimensions.d7),
        ],
      ),
    );
  }
}

class PromoList extends StatelessWidget {
  const PromoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<PromoViewModel>(context);
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(bottom: Dimensions.d32),
          child: PromoCard(
            unlocked: model.promos[index].isUnlocked,
            onPressed: () => model.setSelectedPromo(index: index),
            isSelected: model.isSelected(index: index),
            label: model.promos[index].label,
            description: model.promos[index].description,
          ),
        );
      },
      itemCount: model.promoCount,
    );
  }
}

class PromoCard extends StatelessWidget {
  const PromoCard(
      {Key? key,
      required this.unlocked,
      required this.onPressed,
      required this.isSelected,
      required this.label,
      required this.description})
      : super(key: key);
  final bool unlocked;
  final dynamic onPressed;
  final bool isSelected;
  final String label;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: app_colors.primaryWhite,
      borderRadius: UIParameters.standardBorderRadius,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: UIParameters.standardBorderRadius,
            color: Colors.transparent,
            border: Border.all(
                width: 1,
                color: isSelected
                    ? app_colors.primaryBlueDark
                    : app_colors.primaryBlue.withOpacity(0.15)),
          ),
          child: Stack(
            children: [
              Positioned(
                top: Dimensions.standardPaddingSize,
                right: Dimensions.standardPaddingSize,
                child: isSelected
                    ? Image(
                        height: Dimensions.standardSpacing,
                        width: Dimensions.standardSpacing,
                        image: AssetImage('images/success_checkbox.png'),
                      )
                    : Container(),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: Dimensions.d20 + Dimensions.d8),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.d100 + Dimensions.d7),
                    child: const Image(image: AssetImage('images/promo.png')),
                  ),
                  SizedBox(height: Dimensions.d20),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: Dimensions.d26),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HeaderText(
                          text: label,
                          headerTextSize: HeaderTextSize.small,
                        ),
                        SizedBox(height: Dimensions.smallPaddingSize),
                        BodyText(
                          text: description,
                          isSmall: true,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: Dimensions.d36 + (Dimensions.d1 * 0.32)),
                ],
              ),
              !unlocked
                  ? Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.d7),
                            color:
                                app_colors.primaryBlueDarker.withOpacity(0.7)),
                        child: Icon(
                          Icons.lock,
                          size: Dimensions.d60 + Dimensions.d4,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}

class ApplyOfferButton extends StatelessWidget {
  const ApplyOfferButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<PromoViewModel>(context);
    return !model.isApplyButtonActivated
        ? const WideButtonAsh(label: 'Apply offer')
        : WideButton(
            label: 'Apply offer',
            onPressedCallback: () {
              /*model.selectedPromoType == DeliveryType.instant
                  ? Navigator.pushNamed(context, SendAPackageScreen.id)
                  : Navigator.pushNamed(context, ScheduleDeliveryScreen.id);
              model.setPromoTypeAsNull();
              model.instantiate();
              model.notifyListeners();*/
            },
          );
  }
}
