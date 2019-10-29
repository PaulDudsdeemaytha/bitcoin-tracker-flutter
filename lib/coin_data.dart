import 'dart:convert';
import 'package:http/http.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const bitcoinURL = 'https://apiv2.bitcoinaverage.com/indices/global/ticker';

class CoinData {
  Future getCoinData(chosenCurrency) async {
    String requestURL = '$bitcoinURL/BTC$chosenCurrency';
    Response response = await get(requestURL);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      var lastPrice = decodedData['last'];
      return lastPrice;
    } else {
      print(response.statusCode);
    }
  }
}
