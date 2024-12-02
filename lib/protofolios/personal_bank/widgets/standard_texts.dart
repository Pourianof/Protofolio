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

class LargeTitle extends StatelessWidget {
  final String text;
  const LargeTitle(this.text, {super.key, required});

  @override
  Widget build(BuildContext context) {
    return Text(
      style: Theme.of(context).textTheme.titleLarge,
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
      ).apply(fontFamily: 'Sahel'),
      text,
    );
  }
}

class NonActiveLink extends StatelessWidget {
  final String text;
  final TextStyle? style;
  const NonActiveLink(this.text, {super.key, required, this.style});

  @override
  Widget build(BuildContext context) {
    TextStyle style;
    if (this.style != null) {
      style = this.style!.copyWith(
            color: AppColors.mainLightGrey,
          );
    } else {
      style = const TextStyle(
        color: AppColors.mainLightGrey,
        fontSize: 14,
      ).apply(fontFamily: 'Sahel');
    }
    return Text(
      style: style,
      text,
    );
  }
}

class SubtitledLabel extends StatelessWidget {
  final String title;
  final String subtitle;
  const SubtitledLabel(
      {super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold)
              .apply(fontFamily: 'Sahel'),
        ),
        const SizedBox(
          height: 5,
        ),
        NonActiveLink(subtitle),
      ],
    );
  }
}
