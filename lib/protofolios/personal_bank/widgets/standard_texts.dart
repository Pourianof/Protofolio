import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/personal_bank/resources/app_colors.dart';

class MediumTitle extends StatelessWidget {
  final String text;
  const MediumTitle(this.text, {super.key, required});

  @override
  Widget build(BuildContext context) {
    return Text(
      style: Theme.of(context).textTheme.titleMedium,
      text,
    );
  }
}

class ActiveLink extends StatelessWidget {
  final String text;
  const ActiveLink(this.text, {super.key, required});

  @override
  Widget build(BuildContext context) {
    return Text(
      style: const TextStyle(
        color: AppColors.darkBlue,
        fontSize: 14,
      ),
      text,
    );
  }
}

class NonActiveLink extends StatelessWidget {
  final String text;
  const NonActiveLink(this.text, {super.key, required});

  @override
  Widget build(BuildContext context) {
    return Text(
      style: const TextStyle(
        color: AppColors.mainLightGrey,
        fontSize: 14,
      ),
      text,
    );
  }
}
