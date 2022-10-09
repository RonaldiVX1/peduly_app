import 'package:intl/intl.dart';

String formatNumberToThousandAsString(int total) {
  var formatter = NumberFormat.currency(locale: "id-ID");
  return formatter.format(total).substring(3);
}

double getPercentFromTotalAndDonationTarget({int total, int target}) {
  if (target!=0) {
    double result = (total * 100) / target * 0.01;
    return result;
  } else {
    return 0;
  }
  
}
