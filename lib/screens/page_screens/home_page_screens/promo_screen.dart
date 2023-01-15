import 'package:flutter/material.dart';
import 'package:pikkup/components/buttons/wide_button.dart';
import 'package:pikkup/components/buttons/wide_button_ash.dart';
import 'package:pikkup/components/texts/description_text_small.dart';
import 'package:pikkup/components/texts/header_text_small.dart';
import 'package:pikkup/utils/app_colors.dart' as app_colors;
import 'package:pikkup/utils/constants.dart';
import 'package:pikkup/view_models/home_page_view_models/promo_view_model.dart';
import 'package:pikkup/widgets/standard_app_bar.dart';
import 'package:provider/provider.dart';

class PromoScreen extends StatefulWidget {
  const PromoScreen({Key? key}) : super(key: key);

  static const String id = 'promo_screen';

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
    return Scaffold(
      backgroundColor: app_colors.background,
      appBar: StandardAppBar(label: 'Promos & Special offers'),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: kStandardPaddingSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            SizedBox(height: 32),
            Expanded(child: PromoList()),
            SizedBox(height: 38),
            ApplyOfferButton(),
            SizedBox(height: 17),
          ],
        ),
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
          margin: const EdgeInsets.only(bottom: 32),
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
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
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
                top: 16,
                right: 16,
                child: isSelected
                    ? const Image(
                        height: 24,
                        width: 24,
                        image: AssetImage('images/success_checkbox.png'),
                      )
                    : Container(),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: 28),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 107),
                    child: const Image(image: AssetImage('images/promo.png')),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 26),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HeaderTextSmall(text: label),
                        const SizedBox(height: 8),
                        DescriptionTextSmall(text: description)
                      ],
                    ),
                  ),
                  const SizedBox(height: 36.32),
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
                            borderRadius: BorderRadius.circular(7),
                            color:
                                app_colors.primaryBlueDarker.withOpacity(0.7)),
                        child: const Icon(
                          Icons.lock,
                          size: 64,
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
