import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pikkup/components/address_progress_line.dart';
import 'package:pikkup/components/location_ring.dart';
import 'package:pikkup/components/product_status_box.dart';
import 'package:pikkup/components/texts/body_text.dart';
import 'package:pikkup/components/texts/header_text.dart';
import 'package:pikkup/config/themes/app_colors.dart' as app_colors;
import 'package:pikkup/config/themes/decorations.dart';
import 'package:pikkup/screens/history/full_history_card_screen.dart';
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
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: kStandardPaddingSize),
        child: History(history: true),
      ),
    );
  }
}

class NoHistory extends StatelessWidget {
  const NoHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 0.12 * screenHeight),
        Flexible(
          child: Image(
            height: 0.218 * screenHeight,
            image: const AssetImage('images/no_transactions.png'),
          ),
        ),
        SizedBox(height: 0.0403 * screenHeight),
        const HeaderText(
          text: 'You haven’t made any delivery yet',
          headerTextSize: HeaderTextSize.small,
          isCentered: true,
        ),
        SizedBox(height: 0.005924 * screenHeight),
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
                preferredSize: const Size.fromHeight(37),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border:
                        Border.all(color: app_colors.primaryBlueDark, width: 1),
                  ),
                  child: TabBar(
                    //indicatorPadding: const EdgeInsets.symmetric(vertical: 12),
                    labelPadding: const EdgeInsets.symmetric(vertical: 11),
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: app_colors.primaryWhite,
                    labelStyle: const TextStyle(
                      fontSize: 12,
                      fontFamily: 'Inter',
                    ),
                    unselectedLabelColor: app_colors.textAsh,
                    unselectedLabelStyle: const TextStyle(
                      fontSize: 12,
                      fontFamily: 'Inter',
                    ),
                    controller: _tabController,
                    isScrollable: false,
                    indicator: BoxDecoration(
                      color: app_colors.primaryBlue,
                      borderRadius: BorderRadius.circular(3),
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
        margin: const EdgeInsets.only(bottom: 24),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: app_colors.tileBlue,
            border: Border.all(
                width: 1, color: app_colors.primaryBlue.withOpacity(0.15)),
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                offset: const Offset(0, 0),
                color: Colors.grey.withOpacity(0.3),
              )
            ]),
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
            const SizedBox(height: 16),
            const SendingToBox(goods: 'Samsung TV', receiver: 'Adamu James'),
            const SizedBox(height: 24),
            const AddressBox(
                pickupAddress: '36, Idris Jibowu Street, Ajah',
                destinationAddress: '93 Ofada Rd, Mowe 110113, Loburo'),
            const SizedBox(height: 24),
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
        SizedBox(width: 0.185 * MediaQuery.of(context).size.width),
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
          style: const TextStyle(
            fontSize: 10,
            fontFamily: 'Sora',
            color: app_colors.textGrey,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 13,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            color: app_colors.primaryBlack,
          ),
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
              children: const [
                LocationRing(
                  locationRingType: LocationRingType.pickup,
                  locationRingSize: LocationRingSize.normal,
                ),
                SizedBox(height: 2),
                AddressProgressLine(),
              ],
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Pickup address',
                  style: TextStyle(
                    fontSize: 10,
                    fontFamily: 'Sora',
                    color: app_colors.textGrey,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  pickupAddress,
                  style: const TextStyle(
                    fontSize: 13,
                    fontFamily: 'Inter',
                    color: app_colors.primaryBlack,
                  ),
                ),
              ],
            )
          ],
        ),
        const SizedBox(height: 2),

        //Destination Section
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LocationRing(
              locationRingType: LocationRingType.destination,
              locationRingSize: LocationRingSize.normal,
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Destination',
                  style: TextStyle(
                    fontSize: 10,
                    fontFamily: 'Sora',
                    color: app_colors.textGrey,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  destinationAddress,
                  style: const TextStyle(
                    fontSize: 13,
                    fontFamily: 'Inter',
                    color: app_colors.primaryBlack,
                  ),
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
      padding: const EdgeInsets.symmetric(vertical: 5.7),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Delivery Price',
            style: TextStyle(
              fontSize: 8.5,
              fontFamily: 'Sora',
              color: app_colors.textGrey,
            ),
          ),
          const SizedBox(height: 8),
          RichText(
            text: TextSpan(
              children: [
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Text(
                    currencySymbol,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      //fontFamily: 'Inter',
                      color: app_colors.primaryBlue,
                    ),
                  ),
                ),
                const WidgetSpan(child: SizedBox(width: 2.01)),
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Text(
                    deliveryPrice,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Sora',
                      color: app_colors.primaryBlue,
                    ),
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
