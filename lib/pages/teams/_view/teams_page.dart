import 'package:flutter/material.dart';

import '../../../common/utils/app_localizations_ext.dart';

class TeamsPage extends StatelessWidget {
  const TeamsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(context.l10n.teams),
    );
  }
}
