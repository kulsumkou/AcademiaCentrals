import 'package:academia_centrals/AppAssets/app_assets.dart';
import 'package:academia_centrals/AppColors/app_colors.dart';
import 'package:academia_centrals/Widgets/app_text.dart';
import 'package:flutter/material.dart';

class Read extends StatefulWidget {
  const Read({super.key});

  @override
  State<Read> createState() => _ReadState();
}

class _ReadState extends State<Read> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListTile(
            leading: Image.asset(
              AppAssets.feature,
            ),
            title: const AppText(
              text: 'Your Documents are verified for Medhaavi Engineerin ...',
              fontSize: 12,
            ),
            subtitle: const AppText(
              text: '9 hour ago',
              fontSize: 10,
              textColor: AppColors.greyColor,
            ),
            trailing: const Icon(
              Icons.more_vert,
              color: AppColors.greyColor,
            ),
          ),
        );
      },
    );
  }
}
