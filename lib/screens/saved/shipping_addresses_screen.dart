import 'package:flutter/material.dart';
import 'package:pikkup/components/address_card.dart';
import 'package:pikkup/utils/dimensions.dart';
import 'package:pikkup/view_models/settings_page_view_models/shipping_addresses_view_model.dart';
import 'package:pikkup/widgets/scaffolds/standard_scaffold.dart';
import 'package:provider/provider.dart';

class ShippingAddressesScreen extends StatelessWidget {
  ShippingAddressesScreen({Key? key}) : super(key: key);

  static const String id = '/shipping_addresses_screen';

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return StandardScaffold(
      title: 'Shipping addresses',
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: Dimensions.d20),
          Consumer<ShippingAddressesViewModel>(
            builder: (BuildContext context, model, Widget? child) {
              return ListView.builder(
                controller: scrollController,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: Dimensions.d4),
                    child: AddressCard(
                      text: model.shippingAddresses[index],
                      onPressed: () {},
                    ),
                  );
                },
                itemCount: model.shippingAddressesCount,
              );
            },
          ),
          SizedBox(height: Dimensions.d32),
        ],
      ),
    );
  }
}
