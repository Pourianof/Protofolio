class Preference {
  final String currency;
  final String timeZone;
  final bool digitalCurrencySupportNotif;
  final bool merchanchOrderNotif;
  final bool recommendationNotif;

  Preference({
    required this.currency,
    required this.digitalCurrencySupportNotif,
    required this.merchanchOrderNotif,
    required this.recommendationNotif,
    required this.timeZone,
  });

  copyWith({
    String? newCurrency,
    String? newTimeZone,
    bool? newDigitalCurrencySupportNotif,
    bool? newMerchanchOrderNotif,
    bool? newRecommendationNotif,
  }) {
    return Preference(
      currency: newCurrency ?? currency,
      digitalCurrencySupportNotif:
          newDigitalCurrencySupportNotif ?? digitalCurrencySupportNotif,
      merchanchOrderNotif: newMerchanchOrderNotif ?? merchanchOrderNotif,
      recommendationNotif: newRecommendationNotif ?? recommendationNotif,
      timeZone: newTimeZone ?? timeZone,
    );
  }
}
