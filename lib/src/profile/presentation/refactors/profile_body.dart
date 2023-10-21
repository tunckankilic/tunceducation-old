// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tunceducation/core/common/app/providers/user_provider.dart';
import 'package:tunceducation/core/core.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, value, child) {
        final user = value.user;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: UserInfoCard(
                      infoThemeColor: Colours.neutralTextColour,
                      infoIcon: const Icon(
                        Icons.pages,
                        size: 24,
                      ),
                      infoTitle: "Courses",
                      infoValue: user!.enrolledCourseIds.length.toString()),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: UserInfoCard(
                      infoThemeColor: Colours.languageTileColour,
                      infoIcon: Image.asset(
                        MediaRes.scoreboard,
                        height: 24,
                        width: 24,
                      ),
                      infoTitle: "Score",
                      infoValue: user.points.toString()),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: UserInfoCard(
                      infoThemeColor: Colours.chemistryTileColour,
                      infoIcon: const Icon(
                        Icons.person,
                        size: 24,
                      ),
                      infoTitle: "Following",
                      infoValue: user.following.length.toString()),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: UserInfoCard(
                      infoThemeColor: Colours.biologyTileColour,
                      infoIcon: const Icon(Icons.person_outline_outlined),
                      infoTitle: "Followers",
                      infoValue: user.followers.length.toString()),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}

class UserInfoCard extends StatelessWidget {
  final Color infoThemeColor;
  final Widget infoIcon;
  final String infoTitle;
  final String infoValue;
  const UserInfoCard({
    Key? key,
    required this.infoThemeColor,
    required this.infoIcon,
    required this.infoTitle,
    required this.infoValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      width: 156,
      decoration: BoxDecoration(
        border: Border.all(
          color: infoThemeColor,
        ),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: infoThemeColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: infoIcon,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  infoTitle,
                  style: const TextStyle(fontSize: 12),
                ),
                Text(
                  infoValue,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}