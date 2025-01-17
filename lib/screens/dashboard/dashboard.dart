import 'package:bytebank/components/container.dart';
import 'package:bytebank/components/localization/i18n_container.dart';
import 'package:bytebank/components/localization/i18n_loading_view.dart';
import 'package:bytebank/components/localization/i18n_messages.dart';
import 'package:bytebank/models/name.dart';
import 'package:bytebank/screens/contacts_list.dart';
import 'package:bytebank/screens/dashboard/dashboard_feature_item.dart';
import 'package:bytebank/screens/dashboard/dashboard_i18n.dart';
import 'package:bytebank/screens/name.dart';
import 'package:bytebank/screens/transactions_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardView extends StatelessWidget {
  final DashboardViewLazyI18N _i18n;
  DashboardView(this._i18n);

  @override
  Widget build(BuildContext context) {
    final name = context.watch<NameCubit>().state;
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome $name'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('images/bytebank_logo.png'),
          ),
          SingleChildScrollView(
            child: Container(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  FeatureItem(
                    _i18n.transfer,
                    Icons.monetization_on,
                    onClick: () => _showContactsList(context),
                  ),
                  FeatureItem(
                    _i18n.transaction_feed,
                    Icons.description,
                    onClick: () => _showTransactionsList(context),
                  ),
                  FeatureItem(
                    _i18n.change_name,
                    Icons.person_outline,
                    onClick: () => _showChangeName(context),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showContactsList(BuildContext blocContext) {
    push(blocContext, ContactsListContainer());
  }

  _showTransactionsList(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => TransactionsList(),
      ),
    );
  }

  _showChangeName(BuildContext blocContext) {
    Navigator.of(blocContext).push(
      MaterialPageRoute(
        builder: (context) => BlocProvider.value(
          value: BlocProvider.of<NameCubit>(blocContext),
          child: NameContainer(),
        ),
      ),
    );
  }
}
