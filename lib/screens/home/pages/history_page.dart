import 'package:flutter/material.dart';
import 'package:pikkup/components/address_progress_line.dart';
import 'package:pikkup/components/location_ring.dart';
import 'package:pikkup/components/product_status_box.dart';
import 'package:pikkup/components/spacer.dart';
import 'package:pikkup/components/texts/body_text.dart';
import 'package:pikkup/components/texts/header_text.dart';
import 'package:pikkup/components/texts/plain_text.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/config/themes/decorations.dart';
import 'package:pikkup/config/themes/styles.dart';
import 'package:pikkup/screens/history/full_history_card_screen.dart';
import 'package:pikkup/utils/dimensions.dart';
import 'package:pikkup/utils/ui_parameters.dart';
import 'package:pikkup/widgets/scaffolds/standard_scaffold.dart';

enum CardType { pending, completed }

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StandardScaffold(
      title: 'History',
      isScrollable: false,
      isBackButtonPresent: false,
      child: History(history: true),
    );
  }
}

class NoHistory extends StatelessWidget {
  const NoHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 0.12 * Dimensions.screenHeight),
        Flexible(
          child: Image(
            height: 0.218 * Dimensions.screenHeight,
            image: const AssetImage('images/no_transactions.png'),
          ),
        ),
        SizedBox(height: 0.0403 * Dimensions.screenHeight),
        const HeaderText(
          text: 'You haven’t made any delivery yet',
          headerTextSize: HeaderTextSize.small,
          isCentered: true,
        ),
        SizedBox(height: 0.005924 * Dimensions.screenHeight),
        const BodyText(
          text: 'Send a package, your orders will appear here..',
          isCentered: true,
        ),
      ],
    );
  }
}

class History extends StatefulWidget {
  History({Key? key, required this.history}) : super(key: key);
  final bool history;

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _tabController = TabController(
        length: 3, vsync: this); //3 tabs. This class provides the ticker mixin
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.history) {
      return const NoHistory();
    } else {
      return NestedScrollView(
        //headerSliverBuilder is the tab bar. body is the content that displays at the bottom of the tab bar, when you click on an item in the tab bar
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool isScroll) {
          return [
            SliverAppBar(
              pinned: true,
              //The tab always stay pinned at the top and does not leave the screen, when the NestedScroll View is scrolled
              backgroundColor: app_colors.background,
              bottom: PreferredSize(
                //preferredSize: const Size.fromHeight(50),
                preferredSize: Size.fromHeight(Dimensions.d30 + Dimensions.d7),
                child: Container(
                  margin: EdgeInsets.symmetric(
                      vertical: Dimensions.standardSpacing),
                  decoration: BoxDecoration(
                    borderRadius: UIParameters.smallBorderRadius,
                    border: Border.all(
                        color: app_colors.primaryBlueDark,
                        width: Dimensions.d1),
                  ),
                  child: TabBar(
                    //indicatorPadding: const EdgeInsets.symmetric(vertical: 12),
                    labelPadding:
                        EdgeInsets.symmetric(vertical: Dimensions.d10),
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: app_colors.primaryWhite,
                    labelStyle: TextStyle(
                      fontSize: Dimensions.standardTextSize,
                      fontFamily: 'Inter',
                    ),
                    unselectedLabelColor: app_colors.textAsh,
                    unselectedLabelStyle: TextStyle(
                      fontSize: Dimensions.standardTextSize,
                      fontFamily: 'Inter',
                    ),
                    controller: _tabController,
                    isScrollable: false,
                    indicator: BoxDecoration(
                      color: app_colors.primaryBlue,
                      borderRadius: BorderRadius.circular(Dimensions.d3),
                    ),
                    //The items of the tab
                    tabs: const [
                      Text('All'),
                      Text('Pending'),
                      Text('Completed')
                    ],
                  ),
                ),
              ),
            )
          ];
        },

        body: TabBarView(
          controller: _tabController,
          physics: const NeverScrollableScrollPhysics(),
          //Also place the tabController here
          children: [
            //For 'All' tab
            ListView.builder(
              //itemCount: books.length,
              itemCount: 4,
              itemBuilder: (_, index) {
                return index.isEven
                    ? const HistoryCard(cardType: CardType.pending)
                    : const HistoryCard(cardType: CardType.completed);
              },
            ),

            //For 'Pending' tab
            ListView.builder(
              //itemCount: books.length,
              itemCount: 4,
              itemBuilder: (_, index) {
                return const HistoryCard(cardType: CardType.pending);
              },
            ),

            //For 'Completed' tab
            ListView.builder(
              //itemCount: books.length,
              itemCount: 4,
              itemBuilder: (_, index) {
                return const HistoryCard(cardType: CardType.completed);
              },
            ),
          ],
        ),
      );
    }
  }
}

class HistoryCard extends StatelessWidget {
  const HistoryCard({Key? key, required this.cardType}) : super(key: key);
  final CardType cardType;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(context, MaterialPageRoute(builder: (context){
        //   return AudioPage(bookData: books, index: index);
        // }));
        Navigator.pushNamed(context, FullHistoryCardScreen.id);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: Dimensions.standardSpacing),
        padding: UIParameters.standardPadding,
        decoration: smallShadowedBorderedCardDecoration,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                cardType == CardType.pending
                    ? const ProductStatusBox()
                    : const ProductStatusBox(isCompleted: true),
                const BodyText(
                  text: '23/02/2022',
                  isSmall: true,
                  color: app_colors.textGrey,
                ),
              ],
            ),
            SizedBox(height: Dimensions.standardPaddingSize),
            const SendingToBox(goods: 'Samsung TV', receiver: 'Adamu James'),
            const StandardSpacer(),
            const AddressBox(
                pickupAddress: '36, Idris Jibowu Street, Ajah',
                destinationAddress: '93 Ofada Rd, Mowe 110113, Loburo'),
            const StandardSpacer(),
            const DeliveryPriceBox(currencySymbol: '₦', deliveryPrice: '2,300'),
          ],
        ),
      ),
    );
  }
}

class SendingToBox extends StatelessWidget {
  const SendingToBox({Key? key, required this.goods, required this.receiver})
      : super(key: key);
  final String goods;
  final String receiver;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TitleValueBox(title: 'Sending?', value: goods),
        SizedBox(width: 0.185 * Dimensions.screenWidth),
        TitleValueBox(title: 'To', value: receiver),
      ],
    );
  }
}

class TitleValueBox extends StatelessWidget {
  const TitleValueBox({Key? key, required this.title, required this.value})
      : super(key: key);
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: soraSmallSubtitleText.copyWith(color: app_colors.textGrey),
        ),
        SizedBox(height: Dimensions.d4),
        Text(
          value,
          style: interNormalText.copyWith(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

class AddressBox extends StatelessWidget {
  const AddressBox(
      {Key? key, required this.pickupAddress, required this.destinationAddress})
      : super(key: key);
  final String pickupAddress;
  final String destinationAddress;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Pickup Address Section
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                const LocationRing(
                  locationRingType: LocationRingType.pickup,
                  locationRingSize: LocationRingSize.normal,
                ),
                SizedBox(height: Dimensions.d2),
                const AddressProgressLine()
              ],
            ),
            SizedBox(width: Dimensions.d12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pickup address',
                  style: soraSmallSubtitleText.copyWith(
                      color: app_colors.textGrey),
                ),
                const TitleBodySpacer(),
                PlainText(
                  text: pickupAddress,
                  isBlackColor: true,
                ),
              ],
            )
          ],
        ),
        SizedBox(height: Dimensions.d2),

        //Destination Section
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LocationRing(
              locationRingType: LocationRingType.destination,
              locationRingSize: LocationRingSize.normal,
            ),
            SizedBox(width: Dimensions.d12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Destination',
                  style: soraSmallSubtitleText.copyWith(
                      color: app_colors.textGrey),
                ),
                const TitleBodySpacer(),
                PlainText(
                  text: destinationAddress,
                  isBlackColor: true,
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}

class DeliveryPriceBox extends StatelessWidget {
  const DeliveryPriceBox(
      {Key? key, required this.currencySymbol, required this.deliveryPrice})
      : super(key: key);
  final String currencySymbol;
  final String deliveryPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.symmetric(vertical: Dimensions.d5 + (Dimensions.d1 * 0.7)),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Delivery Price',
              style: soraSmallSubtitleText.copyWith(
                color: app_colors.textGrey,
                fontSize: Dimensions.d10 + (Dimensions.d1 * 0.46),
              )),
          const TitleBodySpacer(),
          RichText(
            text: TextSpan(
              children: [
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Text(
                    currencySymbol,
                    style: currencyVerSmallText,
                  ),
                ),
                const WidgetSpan(child: SizedBox(width: 2.01)),
                WidgetSpan(
                    child: SizedBox(
                        width: Dimensions.d2 + (Dimensions.d1 * 0.01))),
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Text(
                    deliveryPrice,
                    style: moneyVerSmallText,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
