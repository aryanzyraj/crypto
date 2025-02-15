import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/custom_auth/auth_util.dart';
import '../app_constants.dart';

String? displayMonth(String createdat) {
  // Parse the date string to a DateTime object
  DateTime dateTime = DateTime.parse(createdat);
  // Format the date to get just the month and day
  String formattedDate =
      DateFormat('MM-dd').format(dateTime); // '11-19' for November 19th

  return formattedDate;
}

String? monthDayYear(String createdat) {
  // Parse the date string to a DateTime object
  DateTime dateTime = DateTime.parse(createdat);
  // Format the date to get the month, day, and year
  String formattedDate = DateFormat('yyyy-MM-dd')
      .format(dateTime); // '11-19-2023' for November 19th, 2023

  return formattedDate;
}

int stakeinterestRateByDuration(
  String id,
  List<dynamic> jsonDurations,
) {
  for (var duration in jsonDurations) {
    if (duration['id'] == id) {
      return duration['interestRate'];
    }
  }
  return -1; // or any other default value you prefer
}

String? customSympole(String? currencyCode) {
  // Default symbol if the currency code is null or not found in the map.
  const defaultSymbol = '\$';

  // A map of more currency codes to their respective symbols.
  const currencySymbols = {
    'AED': 'د.إ', // United Arab Emirates Dirham
    'AFN': '؋', // Afghan Afghani
    'ALL': 'L', // Albanian Lek
    'AMD': '֏', // Armenian Dram
    'ANG': 'ƒ', // Netherlands Antillean Guilder
    'AOA': 'Kz', // Angolan Kwanza
    'ARS': '\$', // Argentine Peso
    'AUD': 'A\$', // Australian Dollar
    'AWG': 'ƒ', // Aruban Florin
    'AZN': '₼', // Azerbaijani Manat
    'BAM': 'KM', // Bosnia-Herzegovina Convertible Mark
    'BBD': 'Bds\$', // Barbadian Dollar
    'BDT': '৳', // Bangladeshi Taka
    'BGN': 'лв', // Bulgarian Lev
    'BHD': '.د.ب', // Bahraini Dinar
    'BIF': 'FBu', // Burundian Franc
    'BMD': 'BD\$', // Bermudian Dollar
    'BND': 'B\$', // Brunei Dollar
    'BOB': 'Bs.', // Bolivian Boliviano
    'BRL': 'R\$', // Brazilian Real
    'BSD': 'B\$', // Bahamian Dollar
    'BTN': 'Nu.', // Bhutanese Ngultrum
    'BWP': 'P', // Botswanan Pula
    'BYN': 'Br', // New Belarusian Ruble
    'BZD': 'BZ\$', // Belize Dollar
    'CAD': 'C\$', // Canadian Dollar
    'CDF': 'FC', // Congolese Franc
    'CHF': 'Fr.', // Swiss Franc
    'CLF': 'UF', // Chilean Unit of Account (UF)
    'CLP': '\$', // Chilean Peso
    'CNY': '¥', // Chinese Yuan
    'COP': 'Col\$', // Colombian Peso
    'CRC': '₡', // Costa Rican Colón
    'CUC': 'CUC\$', // Cuban Convertible Peso
    'CUP': '₱', // Cuban Peso
    'CVE': 'Esc', // Cape Verdean Escudo
    'CZK': 'Kč', // Czech Republic Koruna
    'DJF': 'Fdj', // Djiboutian Franc
    'DKK': 'kr.', // Danish Krone
    'DOP': 'RD\$', // Dominican Peso
    'DZD': 'دج', // Algerian Dinar
    'EGP': '£', // Egyptian Pound
    'ERN': 'Nfk', // Eritrean Nakfa
    'ETB': 'Br', // Ethiopian Birr
    'EUR': '€', // Euro
    'FJD': 'FJ\$', // Fijian Dollar
    'FKP': '£', // Falkland Islands Pound
    'GBP': '£', // British Pound Sterling
    'GEL': '₾', // Georgian Lari
    'GGP': '£', // Guernsey Pound
    'GHS': 'GH₵', // Ghanaian Cedi
    'GIP': '£', // Gibraltar Pound
    'GMD': 'D', // Gambian Dalasi
    'GNF': 'FG', // Guinean Franc
    'GTQ': 'Q', // Guatemalan Quetzal
    'GYD': 'G\$', // Guyanaese Dollar
    'HKD': 'HK\$', // Hong Kong Dollar
    'HNL': 'L', // Honduran Lempira
    'HRK': 'kn', // Croatian Kuna
    'HTG': 'G', // Haitian Gourde
    'HUF': 'Ft', // Hungarian Forint
    'IDR': 'Rp', // Indonesian Rupiah
    'ILS': '₪', // Israeli New Shekel
    'IMP': '£', // Manx pound
    'INR': '₹', // Indian Rupee
    'IQD': 'ع.د', // Iraqi Dinar
    'IRR': '﷼', // Iranian Rial
    'ISK': 'kr', // Icelandic Króna
    'JEP': '£', // Jersey Pound
    'JMD': 'J\$', // Jamaican Dollar
    'JOD': 'د.ا', // Jordanian Dinar
    'JPY': '¥', // Japanese Yen
    'KES': 'KSh', // Kenyan Shilling
    'KGS': 'сом', // Kyrgystani Som
    'KHR': '៛', // Cambodian Riel
    'KMF': 'CF', // Comorian Franc
    'KPW': '₩', // North Korean Won
    'KRW': '₩', // South Korean Won
    'KWD': 'د.ك', // Kuwaiti Dinar
    'KYD': 'CI\$', // Cayman Islands Dollar
    'KZT': '₸', // Kazakhstani Tenge
    'LAK': '₭', // Laotian Kip
    'LBP': 'ل.ل', // Lebanese Pound
    'LKR': '₨', // Sri Lankan Rupee
    'LRD': 'L\$', // Liberian Dollar
    'LSL': 'L', // Lesotho Loti
    'LYD': 'ل.د', // Libyan Dinar
    'MAD': 'د.م.', // Moroccan Dirham
    'MDL': 'L', // Moldovan Leu
    'MGA': 'Ar', // Malagasy Ariary
    'MKD': 'ден', // Macedonian Denar
    'MMK': 'K', // Myanma Kyat
    'MNT': '₮', // Mongolian Tugrik
    'MOP': 'MOP\$', // Macanese Pataca
    'MRU': 'UM', // Mauritanian Ouguiya
    'MUR': '₨', // Mauritian Rupee
    'MVR': 'Rf', // Maldivian Rufiyaa
    'MWK': 'MK', // Malawian Kwacha
    'MXN': 'Mex\$', // Mexican Peso
    'MYR': 'RM', // Malaysian Ringgit
    'MZN': 'MT', // Mozambican Metical
    'NAD': 'N\$', // Namibian Dollar
    'NGN': '₦', // Nigerian Naira
    'NIO': 'C\$', // Nicaraguan Córdoba
    'NOK': 'kr', // Norwegian Krone
    'NPR': '₨', // Nepalese Rupee
    'NZD': 'NZ\$', // New Zealand Dollar
    'OMR': 'ر.ع.', // Omani Rial
    'PAB': 'B/.', // Panamanian Balboa
    'PEN': 'S/.', // Peruvian Sol
    'PGK': 'K', // Papua New Guinean Kina
    'PHP': '₱', // Philippine Peso
    'PKR': '₨', // Pakistani Rupee
    'PLN': 'zł', // Polish Złoty
    'PYG': '₲', // Paraguayan Guarani
    'QAR': 'ر.ق', // Qatari Rial
    'RON': 'lei', // Romanian Leu
    'RSD': 'дин', // Serbian Dinar
    'RUB': '₽', // Russian Ruble
    'RWF': 'RF', // Rwandan Franc
    'SAR': 'ر.س', // Saudi Riyal
    'SBD': 'SI\$', // Solomon Islands Dollar
    'SCR': '₨', // Seychellois Rupee
    'SDG': 'ج.س', // Sudanese Pound
    'SEK': 'kr', // Swedish Krona
    'SGD': 'S\$', // Singapore Dollar
    'SHP': '£', // Saint Helena Pound
    'SLL': 'Le', // Sierra Leonean Leone
    'SOS': 'Sh.So.', // Somali Shilling
    'SRD': 'SR\$', // Surinamese Dollar
    'SSP': 'SS£', // South Sudanese Pound
    'STN': 'Db', // São Tomé and Príncipe Dobra
    'SYP': '£S', // Syrian Pound
    'SZL': 'E', // Swazi Lilangeni
    'THB': '฿', // Thai Baht
    'TJS': 'SM', // Tajikistani Somoni
    'TMT': 'T', // Turkmenistani Manat
    'TND': 'د.ت', // Tunisian Dinar
    'TOP': 'T\$', // Tongan Paʻanga
    'TRY': '₺', // Turkish Lira
    'TTD': 'TT\$', // Trinidad and Tobago Dollar
    'TWD': 'NT\$', // New Taiwan Dollar
    'TZS': 'Sh', // Tanzanian Shilling
    'UAH': '₴', // Ukrainian Hryvnia
    'UGX': 'USh', // Ugandan Shilling
    'USD': '\$', // United States Dollar
    'UYU': '\$U', // Uruguayan Peso
    'UZS': 'лв', // Uzbekistani Som
    'VES': 'Bs', // Venezuelan Bolívar Soberano
    'VND': '₫', // Vietnamese Dong
    'VUV': 'VT', // Vanuatu Vatu
    'WST': 'WS\$', // Samoan Tala
    'XAF': 'FCFA', // CFA Franc BEAC
    'XCD': 'EC\$', // East Caribbean Dollar
    'XOF': 'CFA', // CFA Franc BCEAO
    'XPF': 'CFP', // CFP Franc
    'YER': '﷼', // Yemeni Rial
    'ZAR': 'R', // South African Rand
    'ZMW': 'ZK', // Zambian Kwacha
    'ZWL': 'Z\$', // Zimbabwean Dollar
  };

  // Look up the symbol for the given currency code or return the default symbol.
  return currencySymbols[currencyCode] ?? defaultSymbol;
}

double calculateIncome(List<dynamic> transactions) {
  // If transactions is null, return 0.0
  if (transactions == null) {
    return 0.0;
  }

  // Filter the transactions for 'DEPOSIT' and 'COMPLETED' status
  // Then sum up the amounts, subtracting any fees
  return transactions
      .where((t) => t['type'] == 'DEPOSIT' && t['status'] == 'COMPLETED')
      .fold(0.0, (total, current) {
    // Ensure that 'amount' and 'fee' are not null before attempting to use them
    var amount = current['amount'] ?? 0.0;
    var fee = current['fee'] ?? 0.0;
    return total + amount - fee;
  });
}

double? calculateExpenses(List<dynamic>? transactions) {
// If transactions is null, return 0.0
  if (transactions == null) {
    return 0.0;
  }

  // Filter the transactions for 'WITHDRAW' and 'COMPLETED' status
  // Then sum up the amounts, including any fees since they contribute to the expense
  return transactions
      .where((t) => t['type'] == 'WITHDRAW' && t['status'] == 'COMPLETED')
      .fold(0.0, (total, current) {
    // Ensure that 'amount' and 'fee' are not null before attempting to use them
    var amount = current['amount'] ?? 0.0;
    var fee = current['fee'] ?? 0.0;
    // Add both amount and fee for expenses
    return total! + amount + fee;
  });
}

double? calculateDepositCompletionRate(List<dynamic>? transactions) {
  if (transactions == null || transactions.isEmpty) {
    return 0.0;
  }

  int totalDeposits = transactions.where((t) => t['type'] == 'DEPOSIT').length;
  int completedDeposits = transactions
      .where((t) => t['type'] == 'DEPOSIT' && t['status'] == 'COMPLETED')
      .length;

  if (totalDeposits == 0) {
    return 0.0;
  }

  return (completedDeposits / totalDeposits) * 100;
}

double? calculateWithdrawalCompletionRate(List<dynamic>? transactions) {
  if (transactions == null || transactions.isEmpty) {
    return 0.0;
  }

  int totalWithdrawals =
      transactions.where((t) => t['type'] == 'WITHDRAW').length;
  int completedWithdrawals = transactions
      .where((t) => t['type'] == 'WITHDRAW' && t['status'] == 'COMPLETED')
      .length;

  if (totalWithdrawals == 0) {
    return 0.0;
  }

  return (completedWithdrawals / totalWithdrawals) * 100;
}

double? calculatetotalDeposit(
  String? amount,
  String? fixedfee,
  String? percentageFee,
) {
  // I need to calculate the total like this: amount + fixedFee + (amount * (percentageFee / 100))
  if (amount == null || fixedfee == null || percentageFee == null) {
    return null;
  }
  double parsedAmount = double.tryParse(amount) ?? 0.0;
  double parsedFixedFee = double.tryParse(fixedfee) ?? 0.0;
  double parsedPercentageFee = double.tryParse(percentageFee) ?? 0.0;
  double total = parsedAmount +
      parsedFixedFee +
      (parsedAmount * (parsedPercentageFee / 100));
  return total;
}

String? generateImageUrl(String? currencyName) {
  String lowerCaseCurrencyName = currencyName!.toLowerCase();
  return '${FFAppConstants.Domain}/img/crypto/$lowerCaseCurrencyName.webp';
}

String? inputsToString(List<dynamic>? inputs) {
// Create an empty string to store the result
  String result = '';

  // Check if there are any inputs
  if (inputs!.isNotEmpty) {
    // Loop through the dynamic inputs and concatenate them to the result string
    for (var input in inputs) {
      result += '$input, ';
    }

    // Remove the trailing comma and space from the result string
    result = result.substring(0, result.length - 2);
  } else {
    // Handle the case when there are no inputs
    result = 'No inputs provided';
  }

  return result;
}

String? calculateSpotEstimatedBalance(String? jsonBalances) {
  if (jsonBalances == null) {
    return null;
  }

  // Parse the JSON string into a list of doubles
  List<double> balances;
  try {
    balances = List<double>.from(
        jsonDecode(jsonBalances).map((item) => item.toDouble()));
  } catch (e) {
    // Handle parsing error
    print("Error parsing JSON: $e");
    return null;
  }

  // Calculate the total balance
  double totalBalance = balances.fold(0.0, (sum, item) => sum + item);

  // Return the total balance formatted to 2 decimal places
  return totalBalance.toStringAsFixed(2);
}

bool doesSpotCurrencyExist(
  String currency,
  String? jsonString,
) {
// Print the received arguments
  print('Received currency: $currency');
  print('Received jsonString: $jsonString');

  // Check if jsonString is null or not a String
  if (jsonString == null) {
    print('jsonString is null');
    return false; // If jsonString is null, immediately return false
  }

  // Check if jsonString is an empty string
  if (jsonString.isEmpty) {
    print('jsonString is empty');
    return false; // If jsonString is empty, there are no currencies to check against
  }

  // Attempt to fix an incorrectly formatted JSON string by adding double quotes around the elements
  // This is a simple heuristic that might not work for all cases
  String fixedJsonString = jsonString.replaceAllMapped(
      RegExp(r'\b(\w+)\b'), (match) => '"${match.group(0)}"');
  print('Fixed jsonString: $fixedJsonString');

  // Parse the JSON string into a List of Strings
  List<dynamic> currencies;
  try {
    // jsonDecode expects a string that starts with a '[' or '{'
    // So we make sure the string is wrapped with '[' and ']' if it's not already a list or object
    if (!fixedJsonString.startsWith('[') && !fixedJsonString.startsWith('{')) {
      fixedJsonString = '[$fixedJsonString]';
    }
    currencies = jsonDecode(fixedJsonString);
    // Print the decoded list
    print('Decoded currencies: $currencies');
  } catch (e) {
    // Handle any JSON decoding error
    print('Error decoding JSON: $e');
    return false; // If there's an error decoding JSON, return false
  }

  // Check if the currency exists in the list
  bool exists = currencies.contains(currency);
  // Print the result of the check
  print('Currency exists in list: $exists');

  return exists;
}

double getSpotCurrencyBalance(
  String currency,
  dynamic jsonResponse,
) {
  // Check if jsonResponse is null or not a List
  if (jsonResponse == null || jsonResponse is! List) {
    print('jsonResponse is null or not a List');
    return 0.00; // Return 0.0 if jsonResponse is null or not a List
  }

  for (var item in jsonResponse) {
    if (item != null && item['currency'] == currency) {
      // Convert balance to a double, if item or item['balance'] is null, default to 0.0
      double balance =
          double.tryParse(item['balance']?.toString() ?? '') ?? 0.00;
      // Format it to two decimal places
      return double.parse(balance.toStringAsFixed(2));
    }
  }

  // Return 0.0 if the currency is not found
  return 0.00;
}

List<String> displalyAdressessKeys(dynamic jsonString) {
  print('Received jsonString: $jsonString');

  Map<String, dynamic> jsonMap;

  // Check if jsonString is already a Map or needs to be decoded
  if (jsonString is Map<String, dynamic>) {
    jsonMap = jsonString;
  } else if (jsonString is String) {
    try {
      jsonMap = json.decode(jsonString);
    } on FormatException catch (e) {
      print('FormatException: ${e.message}');
      return ['Invalid JSON format'];
    }
  } else {
    print('Invalid type for jsonString');
    return ['Invalid input type'];
  }

  try {
    final Map<String, dynamic> addresses =
        jsonMap['data']['addresses'] as Map<String, dynamic>;
    return addresses.keys.toList();
  } catch (e) {
    print('Error processing data: ${e.toString()}');
    return ['Error processing data'];
  }
}

String displalyAdresseFromAdressess(
  dynamic jsonString,
  String key,
) {
  print('Received jsonString: $jsonString');
  print('Received key: $key');

  Map<String, dynamic> jsonMap;

  // Check if jsonString is already a Map or needs to be decoded
  if (jsonString is Map<String, dynamic>) {
    jsonMap = jsonString;
  } else if (jsonString is String) {
    try {
      jsonMap = json.decode(jsonString);
    } on FormatException catch (e) {
      print('FormatException: ${e.message}');
      return 'Invalid JSON format';
    }
  } else {
    print('Invalid type for jsonString');
    return 'Invalid input type';
  }

  try {
    final Map<String, dynamic> addresses =
        jsonMap['data']['addresses'] as Map<String, dynamic>;

    if (addresses.containsKey(key)) {
      return addresses[key]['address'];
    } else {
      return 'Key not found';
    }
  } catch (e) {
    print('Error processing data: ${e.toString()}');
    return 'Error processing data';
  }
}

dynamic getCurrencyExchangeDetail(
  dynamic jsonData,
  String currency,
) {
// Check if the 'data' key exists in JSON
  if (jsonData['data'] != null) {
    // Loop through each item in 'data'
    for (var item in jsonData['data']) {
      // Check if the currency matches
      if (item['currency'] == currency) {
        // Return the matching currency details
        return item;
      }
    }
  }

  // Return null if currency is not found
  return null;
}

dynamic getCurrencyExchangeChainDetail(
  dynamic jsonResult,
  String network,
) {
  // Check if the 'chains' key exists in JSON result
  if (jsonResult['chains'] != null) {
    // Loop through each item in 'chains'
    for (var chain in jsonResult['chains']) {
      // Check if the network matches
      if (chain['network'] == network) {
        // Return the matching network details
        return chain;
      }
    }
  }

  // Return null if network is not found
  return null;
}

int convertToINT(String? value) {
  if (value == null || value.isEmpty) {
    return 0; // or throw an exception if you prefer
  }

  return int.tryParse(value) ?? double.tryParse(value)?.round() ?? 0;
}

List<dynamic> sortTickers(
  String firstJson,
  String secondJson,
) {
  // Parse the first JSON string
  List<dynamic> firstJsonData = json.decode(firstJson);

  // Extract symbols from the first JSON
  Set<String> symbols = {};
  for (var entry in firstJsonData) {
    symbols.add(entry['symbol']);
  }

  // Parse the second JSON string
  Map<String, dynamic> secondJsonData = json.decode(secondJson)['data'];

  // Filter the second JSON data based on the extracted symbols
  List<dynamic> filteredData = [];
  for (var symbol in symbols) {
    if (secondJsonData.containsKey(symbol)) {
      filteredData.add(secondJsonData[symbol]);
    }
  }

  return filteredData;
}

List<dynamic> exchangeLosers(dynamic data) {
  if (data == null || data is! Map<String, dynamic>) return [];

  // Convert the JSON object to a list of maps with symbol included
  List<Map<String, dynamic>> tickerList = data.entries.map((entry) {
    Map<String, dynamic> ticker = Map.from(entry.value);
    ticker['symbol'] = entry.key;
    return ticker;
  }).toList();

  // Filter out entries where 'change' is null
  tickerList = tickerList.where((item) => item['change'] != null).toList();

  // Sort the list by 'change' in ascending order (for losers)
  tickerList.sort((a, b) {
    double changeA = a['change'];
    double changeB = b['change'];
    return changeA.compareTo(changeB);
  });

  // Determine the number of elements to take (up to 10, or less if the list is smaller)
  int numberOfElementsToTake = math.min(10, tickerList.length);

  // Take the top losers from the sorted list
  List<Map<String, dynamic>> topLosers =
      tickerList.take(numberOfElementsToTake).toList();

  return topLosers;
}

bool statusResponse(dynamic json) {
  final Map<String, dynamic> decodedJson =
      json is String ? jsonDecode(json) : json;

  // Check if the 'status' key exists and is a boolean.
  // If so, return its value; otherwise return false.
  if (decodedJson.containsKey('status') && decodedJson['status'] is bool) {
    return decodedJson['status'];
  }

  // If the 'status' key is not found or not a boolean, return false.
  return false;
}

String ecommerceReviews(List<dynamic>? reviews) {
  int reviewCount = 0;
  double totalRating = 0.0;

  if (reviews != null) {
    reviewCount = reviews.length;
    for (var review in reviews) {
      if (review['rating'] != null) {
        totalRating += review['rating']
            as num; // Cast rating to num to handle both int and double
      }
    }
  }

  // Calculate average rating, converting to int for final result
  int averageRating = reviewCount > 0 ? (totalRating / reviewCount).round() : 0;

  return '$reviewCount/$averageRating';
}

String formatDatatoyearmonthday(String createdAt) {
  DateTime dateTime;
  try {
    dateTime = DateTime.parse(createdAt);
  } catch (FormatException) {
    // If there's an error, try removing milliseconds and parsing again.
    final noMillis = createdAt.replaceAll(RegExp(r'\.\d+Z$'), 'Z');
    dateTime = DateTime.parse(noMillis);
  }

  // Include the year in the formatter pattern
  final DateFormat formatter = DateFormat('EEE. MMMM d, y');
  String formattedDate = formatter.format(dateTime);
  int dayNum = dateTime.day;

  // Map of day suffixes
  final Map<int, String> daySuffixes = {
    1: 'st',
    2: 'nd',
    3: 'rd',
    21: 'st',
    22: 'nd',
    23: 'rd',
    31: 'st',
  };
  // Default to 'th' if day is not in the map
  final String suffix = daySuffixes[dayNum] ?? 'th';

  // Replace the day component with the day and its suffix
  return formattedDate.replaceAll(RegExp(r' \d+,'), ' $dayNum$suffix,');
}

int icoTimeLeft(String endDate) {
  final now = DateTime.now().toUtc();
  final end = DateTime.parse(endDate).toUtc();
  final difference = end.difference(now);
  return difference.inSeconds;
}

int stakeDurationId(
  String duration,
  List<dynamic> jsonDurations,
) {
// Convert the duration string to an integer for comparison.
  final int searchDuration = int.tryParse(duration) ?? -1;

  // Search for the duration in the list.
  for (var durationEntry in jsonDurations) {
    if (durationEntry['duration'] == searchDuration) {
      return durationEntry['id'];
    }
  }

  // If no matching duration is found, return -1.
  return -1;
}

String timeAgo(String time) {
  DateTime dateTime;

  try {
    // Try parsing the input string directly (handles ISO 8601 with offset).
    dateTime = DateTime.parse(time);
  } catch (e) {
    try {
      // If the direct parsing fails, try using different DateFormat patterns.
      DateFormat format = DateFormat('M/d/yyyy, h:mm:ss a');
      dateTime = format.parseStrict(time);
    } catch (e) {
      // Handle other date formats or throw an error
      // You could add more catch blocks for other date formats if necessary
      throw FormatException('Date format is not recognized: $time');
    }
  }

  // Use the timeago package to get the time elapsed.
  final String result = timeago.format(dateTime, allowFromNow: true);

  return result;
}

String htmlConvert(String content) {
  final String strippedContent =
      content.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), ' ');

  // Replace escaped newline characters with actual newlines
  String cleanContent = strippedContent.replaceAll(r'\\n', '\n');

  // Replace double backslashes with single backslashes
  cleanContent = cleanContent.replaceAll(r'\\', r'\');

  // Remove extra whitespace, including multiple spaces and empty lines
  cleanContent = cleanContent
      .split('\n')
      .map((line) => line.trim())
      .where((line) => line.isNotEmpty)
      .join('\n');

  // Trim and return the final result
  return cleanContent.trim();
}

int blogStringtoInt(
  List<dynamic> data,
  String name,
) {
  for (var item in data) {
    if (item['name'] == name) {
      return item['id'];
    }
  }
  return -1; // Return -1 or some error code if the name is not found.
}

String extractFUNDINGWalletUUID(
  List<dynamic> wallets,
  String currency,
) {
  for (var wallet in wallets) {
    if (wallet['currency'] == currency) {
      return wallet['contract'];
    }
  }
  return 'Currency not found';
}

List<int> blogListSTRtoListINT(
  List<dynamic> data,
  List<String> tags,
) {
  List<int> ids = [];

  for (var name in tags) {
    for (var item in data) {
      if (item['name'] == name) {
        ids.add(item['id']);
        break; // Break the inner loop if the match is found.
      }
    }
  }

  return ids;
}

List<FFUploadedFile> listUPLOAD(FFUploadedFile file) {
  // Create a new list of FFUploadedFile
  List<FFUploadedFile> fileList = [];

  // Add the single file to the list
  fileList.add(file);

  // Return the list with the file
  return fileList;
}

double ratingCF(List<int>? rates) {
  if (rates == null) {
    return 0.0;
  }

  // Filter out null values and calculate the sum of ratings
  int sum = rates
      .where((rate) => rate != null)
      .fold(0, (previous, current) => previous + current);

  // Calculate the number of non-null ratings
  int count = rates.where((rate) => rate != null).length;

  // If there are no valid ratings, return 0
  if (count == 0) {
    return 0.0;
  }

  // Calculate the average rating and ensure it does not exceed 5
  double average = sum / count;
  return average > 5 ? 5.0 : average;
}

bool nulvalue(String? value) {
  return value != null;
}

dynamic alwaysReturnNull() {
  return null;
}

List<dynamic> p2pMessages(
  List<dynamic> json,
  bool isSeller,
) {
  // Determine the type of messages to filter for
  final String typeFilter = isSeller ? 'seller' : 'buyer';
  // Filter the messages based on the type
  final List<dynamic> filteredMessages = [];

  for (var message in json) {
    if (message['type'] == typeFilter) {
      filteredMessages.add(message);
    }
  }

  return filteredMessages;
}

int kycMaxlevel(dynamic dataOption) {
  int maxLevel = 0;

  // Parse the JSON strings
  Map<String, dynamic> options = json.decode(dataOption['options']);
  Map<String, dynamic> customOptions = json.decode(dataOption['customOptions']);

  // Process the 'options' map
  options.forEach((key, value) {
    if (value is Map) {
      int currentLevel = int.tryParse(value['level'].toString()) ?? 0;
      maxLevel = math.max(maxLevel, currentLevel);
    }
  });

  // Process the 'customOptions' map
  customOptions.forEach((key, value) {
    if (value is Map) {
      int currentLevel = int.tryParse(value['level'].toString()) ?? 0;
      maxLevel = math.max(maxLevel, currentLevel);
    }
  });

  return maxLevel;
}

int investmentTimeLeftInSecond(
  String createdAt,
  int duration,
) {
  final DateTime startTime = DateTime.parse(createdAt);

  // Calculate the end time by adding the duration in days to the start time
  final DateTime endTime = startTime.add(Duration(days: duration));

  // Get the current time
  final DateTime currentTime = DateTime.now().toUtc();

  // Calculate the difference in seconds
  final int timeLeftInSeconds = endTime.difference(currentTime).inSeconds;

  // Return the time left in seconds
  // If the time is negative, which means the duration has passed, return 0
  return math.max(0, timeLeftInSeconds);
}

double investmentProgress(
  String createdAt,
  int duration,
) {
// Parse the 'createdAt' string into a DateTime object.
  DateTime startTime = DateTime.parse(createdAt);

  // Get the current time.
  DateTime now = DateTime.now();

  // Calculate the difference in seconds between the current time and 'createdAt'.
  int timePassedInSeconds = now.difference(startTime).inSeconds;

  // Convert the 'duration' from days to seconds.
  int durationInSeconds = duration * 24 * 60 * 60;

  // Calculate the progress.
  double progress = timePassedInSeconds / durationInSeconds;

  // Ensure the progress does not exceed 1.
  progress = (progress > 1) ? 1.0 : progress;

  progress = double.parse(progress.toStringAsFixed(4));

  return progress;
}

List<dynamic> searchSpotWallet(
  String search,
  List<dynamic> jsonData,
) {
  List<dynamic> searchResults = [];

  // Convert the search string to lowercase for case-insensitive search
  String searchLower = search.toLowerCase();

  for (var item in jsonData) {
    String currencyLower = item['currency'].toLowerCase();
    String nameLower = item['name'].toLowerCase();

    // Check if the currency or name contains the search term
    if (currencyLower.contains(searchLower) ||
        nameLower.contains(searchLower)) {
      searchResults.add(item);
    }
  }

  return searchResults;
}

List<dynamic> blogFilterByNameANDCat(
  List<dynamic> blogPosts,
  String? firstName,
  String? lastName,
  String? categoryName,
) {
  List<dynamic> filteredPosts = [];

  // Helper function to check for non-null, non-empty, non-whitespace strings.
  bool isStringNotEmptyAndNotNull(String? s) {
    return s?.trim().isNotEmpty ?? false;
  }

  for (var post in blogPosts) {
    bool matchesFirstName = !isStringNotEmptyAndNotNull(firstName) ||
        (post['author'] != null &&
            post['author']['user']['first_name']
                .toString()
                .toLowerCase()
                .contains(firstName!.trim().toLowerCase()));

    bool matchesLastName = !isStringNotEmptyAndNotNull(lastName) ||
        (post['author'] != null &&
            post['author']['user']['last_name']
                .toString()
                .toLowerCase()
                .contains(lastName!.trim().toLowerCase()));

    bool matchesCategoryName = !isStringNotEmptyAndNotNull(categoryName) ||
        (post['category'] != null &&
            post['category']['name']
                .toString()
                .toLowerCase()
                .contains(categoryName!.trim().toLowerCase()));

    if (matchesFirstName && matchesLastName && matchesCategoryName) {
      filteredPosts.add(post);
    }
  }

  return filteredPosts;
}

bool ecommerceWishlist(
  String productName,
  List<dynamic> productList,
) {
  for (var product in productList) {
    if (product['name'] == productName) {
      return true;
    }
  }
  return false;
}

List<String> forexSelectPlan(List<dynamic> durations) {
  List<String> plans = [];

  for (var durationEntry in durations) {
    if (durationEntry['duration'] != null &&
        durationEntry['timeframe'] != null) {
      int durationValue = durationEntry['duration'] as int;
      String timeframe = (durationEntry['timeframe'] as String).toLowerCase();
      plans.add('$durationValue $timeframe');
    }
  }

  return plans;
}

int forexDurationID(
  String time,
  List<dynamic> durations,
) {
  for (var durationMap in durations) {
    final duration = durationMap['duration'];
    final durationValue = duration['duration'].toString();
    final timeframe = duration['timeframe'].toString().toLowerCase();
    if (time == "$durationValue $timeframe") {
      return duration['id'];
    }
  }
  return -1; // Return -1 or any other appropriate value if not found
}

double decrementOne(double? value) {
  if (value == null || value == 0) {
    return 0.0;
  }

  // Find the smallest place value in the number
  String valueAsString = value.toString();
  int decimalPlace = valueAsString.contains('.')
      ? (valueAsString.length - valueAsString.indexOf('.') - 1)
      : 0;
  double decrementValue = math.pow(10, -decimalPlace).toDouble();

  // If the number is less than 1 but greater than 0, decrement by the smallest decimal place
  // Otherwise, decrement by 1
  double decrementAmount = value < 1 ? decrementValue : 1;

  // Perform the decrement and ensure the result is not negative
  double result = value - decrementAmount;
  return result >= 0 ? result : 0.0;
}

double forexProgress(
  String createdAt,
  String endDate,
) {
// Parse the 'createdAt' string into a DateTime object.
  DateTime startTime = DateTime.parse(createdAt);

  // Parse the 'endDate' string into a DateTime object.
  DateTime endTime = DateTime.parse(endDate);

  // Get the current time.
  DateTime now = DateTime.now();

  // Calculate the difference in seconds between now and 'createdAt', and between 'endDate' and 'createdAt'.
  int timePassedInSeconds = now.difference(startTime).inSeconds;
  int totalDurationInSeconds = endTime.difference(startTime).inSeconds;

  // Calculate the progress.
  double progress = (timePassedInSeconds / totalDurationInSeconds).clamp(0, 1);

  progress =
      double.parse(progress.toStringAsFixed(4)); // Format to 4 decimal places

  return progress;
}

int forexTimeLeftInSecond(
  String createdAt,
  String endDate,
) {
  final DateTime startTime = DateTime.parse(createdAt);
  final DateTime endTime = DateTime.parse(endDate);

  // Get the current time in UTC to match the format of 'createdAt' and 'endDate'
  final DateTime currentTime = DateTime.now().toUtc();

  // Calculate the difference in seconds
  final int timeLeftInSeconds = endTime.difference(currentTime).inSeconds;

  // Return the time left in seconds
  // If the time is negative, which means the end date has passed, return 0
  return math.max(0, timeLeftInSeconds);
}

bool kycCustomFieldVisibility(
  List<String> levelsList,
  int level,
) {
  String levelStr = level.toString(); // Convert the integer level to a string
  return levelsList.contains(levelStr);
}

double kycProgressBar(
  int maxLevel,
  int? kycLevel,
  String? kycStatus,
) {
// Check for any null values first
  if (kycLevel == null || kycStatus == null) return 0.0;

  double progress = 0.0;
  // Calculate progress based on kycLevel and kycStatus
  switch (kycStatus.toUpperCase()) {
    case "APPROVED":
      progress = kycLevel / maxLevel;
      break;
    case "PENDING":
    case "REJECTED":
      // For PENDING or REJECTED, set progress based on the kycLevel
      if (kycLevel < maxLevel) {
        progress = (kycLevel - 1) / maxLevel;
      } else if (kycLevel == maxLevel && kycStatus.toUpperCase() == "PENDING") {
        progress = (maxLevel - 1) / maxLevel;
      }
      // No additional progress for REJECTED at maxLevel
      break;
    default:
      return 0.0; // Return 0.0 for any unspecified status
  }

  return progress;
}

bool kycContainerLevel(
  int maxLevel,
  String containerLevel,
  int? kycLevel,
  String? kycStatus,
) {
// Check for any null values first
  if (kycLevel == null || kycStatus == null) {
    return false;
  }

  // Determine container level index for comparison
  int containerIndex;
  switch (containerLevel.toLowerCase()) {
    case 'first':
      containerIndex = 1;
      break;
    case 'second':
      containerIndex = 2;
      break;
    case 'third':
      containerIndex = 3;
      break;
    default:
      return false; // Invalid container level
  }

  // If KYC status is not approved, only the first level can potentially be true
  if (kycStatus.toUpperCase() != 'APPROVED') {
    return kycLevel >= containerIndex && containerIndex == 1;
  }

  // If KYC status is approved, check if the kycLevel and maxLevel accommodate the container level
  return kycLevel >= containerIndex && maxLevel >= containerIndex;
}

String kycSubmitBTN(
  int maxLevel,
  String? kycStatus,
  int? kycLevel,
) {
// Check for null values or pending status
  if (kycLevel == null ||
      kycStatus == null ||
      kycStatus.toUpperCase() == 'PENDING') {
    return kycStatus?.toUpperCase() == 'PENDING' ? 'Pending' : 'Submit Level 1';
  }

  // Handling based on KYC status and levels
  if (kycStatus.toUpperCase() == 'APPROVED') {
    if (kycLevel < maxLevel) {
      return 'Submit Level ${kycLevel + 1}';
    } else {
      return 'KYC Completed';
    }
  } else if (kycStatus.toUpperCase() == 'REJECTED') {
    if (kycLevel < maxLevel) {
      return 'Submit Level ${kycLevel}';
    } else {
      // Even if the last level is rejected, prompt to submit it again
      return 'Submit Level $kycLevel';
    }
  }

  // Default return, mainly to satisfy the Dart analyzer
  return 'Submit Level 1';
}

bool kycMainFieldsVisibility(
  dynamic jsonBody,
  int level,
) {
  final String levelStr = level.toString();

  // Parse the JSON strings
  Map<String, dynamic> options = json.decode(jsonBody['options']);
  Map<String, dynamic> customOptions = json.decode(jsonBody['customOptions']);

  // Remove specific keys and the 'custom_fields' array from options
  options.remove('documentPassport');
  options.remove('documentDriversLicense');
  options.remove('documentIdCard');

  // Check the level for each remaining field in options
  for (var field in options.entries) {
    if (field.value['enabled'] == true && field.value['level'] == levelStr) {
      return true; // Return true if any enabled field matches the level
    }
  }

  // Check the level for each field in customOptions
  for (var customField in customOptions.entries) {
    if (customField.value['required'] == true &&
        customField.value['level'] == levelStr) {
      return true; // Return true if any required custom field matches the level
    }
  }

  return false; // Return false if no matching fields are found
}

String exchangeUpDown(
  List<dynamic> listData,
  dynamic data,
  String key,
) {
  // Find the matching entry in listData based on the symbol
  var matchingEntry = listData.firstWhere(
    (element) => element['symbol'] == data['symbol'],
    orElse: () => null,
  );

  // If no matching entry is found, return a default response
  if (matchingEntry == null) {
    return "Symbol not found";
  }

  // Extract the previous and current values based on the key
  var previousValue = matchingEntry[key];
  var currentValue = data[key];

  // Compare the values and return the result
  if (currentValue > previousValue) {
    return "up";
  } else if (currentValue < previousValue) {
    return "down";
  } else {
    return "same";
  }
}

List<dynamic> exchangeSearch(
  String? value,
  dynamic dataList,
) {
// Check if the search value is null or empty
  // Check if the search value is null or empty, or if dataList is not a Map
  if (value == null || value.isEmpty || dataList is! Map<String, dynamic>) {
    return [];
  }

  // Convert the search value to lower case for case-insensitive comparison
  String searchValueLower = value.toLowerCase();

  // Filter the dataList to find matches based on the symbol
  List<Map<String, dynamic>> filteredList = dataList.entries
      .where((entry) => entry.key.toLowerCase().contains(searchValueLower))
      .map((entry) {
    Map<String, dynamic> ticker = Map.from(entry.value);
    ticker['symbol'] = entry.key;
    return ticker;
  }).toList();

  return filteredList;
}

List<dynamic> exchangeFilterTicker(
  List<String>? symbols,
  dynamic data,
) {
  // If either input is null, return an empty list
  if (symbols == null || data == null) {
    return [];
  }

  // Ensure data is a Map<String, dynamic>
  if (data is! Map<String, dynamic>) {
    return [];
  }

  // Filter and transform the data
  List<Map<String, dynamic>> filteredData = [];

  for (String symbol in symbols) {
    for (String key in data.keys) {
      if (key.startsWith(symbol)) {
        Map<String, dynamic> tickerData = Map.from(data[key]);
        tickerData['symbol'] = key; // Add the symbol to the ticker data
        filteredData.add(tickerData);
        break; // Move to the next symbol
      }
    }
  }

  return filteredData;
}

List<dynamic> exchangeGainers(dynamic data) {
  if (data == null || data is! Map<String, dynamic>) return [];

  // Convert the JSON object to a list of maps with symbol included
  List<Map<String, dynamic>> tickerList = data.entries.map((entry) {
    Map<String, dynamic> ticker = Map.from(entry.value);
    ticker['symbol'] = entry.key;
    return ticker;
  }).toList();

  // Filter out entries where 'change' is null
  tickerList = tickerList.where((item) => item['change'] != null).toList();

  // Sort the list by 'change' in descending order
  tickerList.sort((a, b) {
    double changeA = a['change'];
    double changeB = b['change'];
    return changeB.compareTo(changeA);
  });

  // Determine the number of elements to take (up to 10, or less if the list is smaller)
  int numberOfElementsToTake = math.min(10, tickerList.length);

  // Take the top gainers from the sorted list
  List<Map<String, dynamic>> topGainers =
      tickerList.take(numberOfElementsToTake).toList();

  return topGainers;
}

String exchangeSoloUpDown(
  double previousValue,
  double currentValue,
) {
  if (currentValue > previousValue) {
    return 'up';
  } else if (currentValue < previousValue) {
    return 'down';
  } else {
    return 'same';
  }
}

List<dynamic> exchangeMapHistorical(dynamic historicalData) {
  List<dynamic> mappedData = [];

  for (var e in historicalData) {
    var entry = {
      'time': e[0].toInt(),
      'open': e[1].toDouble(),
      'high': e[2].toDouble(),
      'low': e[3].toDouble(),
      'close': e[4].toDouble(),
      'vol': e[5].toDouble(),
    };
    mappedData.add(entry);
  }

  return mappedData;
}

List<String>? exchangeProvidertimes(String provider) {
  const Map<String, Map<String, String>> intervals = {
    'binance': {
      '1': '1m',
      '3': '3m',
      '5': '5m',
      '15': '15m',
      '30': '30m',
      '60': '1h',
      '120': '2h',
      '240': '4h',
      '360': '6h',
      '480': '8h',
      '720': '12h',
      'D': '1d',
    },
    'binanceus': {
      '1': '1m',
      '3': '3m',
      '5': '5m',
      '15': '15m',
      '30': '30m',
      '60': '1h',
      '120': '2h',
      '240': '4h',
      '360': '6h',
      '480': '8h',
      '720': '12h',
      'D': '1d',
    },
    'kucoin': {
      '1': '1m',
      '5': '5m',
      '15': '15m',
      '30': '30m',
      '60': '1h',
      '240': '4h',
      '1D': '1d',
    },
    'bitget': {
      '1': '1m',
      '5': '5m',
      '15': '15m',
      '30': '30m',
      '60': '1h',
      '240': '4h',
      '360': '6h',
      '720': '12h',
      '1D': '1d',
    },
  };

  // Check if the provider is recognized and return the durations, else return null
  if (intervals.containsKey(provider)) {
    return intervals[provider]!.values.toList();
  } else {
    return null;
  }
}

int exchangeDurationIntervals(String time) {
  const Map<String, int> intervalDurations = {
    '1m': 86400000,
    '3m': 259200000,
    '5m': 432000000,
    '15m': 1296000000,
    '30m': 2592000000,
    '1h': 5184000000,
    '2h': 10368000000,
    '4h': 20736000000,
    '6h': 31104000000,
    '8h': 41472000000,
    '12h': 62208000000,
    '1d': 124416000000,
  };

  // Return the duration for the given time interval, or 0 if not found
  return intervalDurations[time] ?? 0;
}

int exchangeCalculateFromTimestamp(String interval) {
  const Map<String, int> intervalDurations = {
    '1m': 60 * 1000,
    '3m': 3 * 60 * 1000,
    '5m': 5 * 60 * 1000,
    '15m': 15 * 60 * 1000,
    '30m': 30 * 60 * 1000,
    '1h': 60 * 60 * 1000,
    '2h': 2 * 60 * 60 * 1000,
    '4h': 4 * 60 * 60 * 1000,
    '6h': 6 * 60 * 60 * 1000,
    '8h': 8 * 60 * 60 * 1000,
    '12h': 12 * 60 * 60 * 1000,
    '1d': 24 * 60 * 60 * 1000,
  };

  // Get the current time in milliseconds since the Unix epoch
  int now = DateTime.now().millisecondsSinceEpoch;

  // Get the duration for the given interval
  int intervalDuration = intervalDurations[interval] ??
      60 * 60 * 1000; // Default to 1h if interval not found

  // Calculate the 'from' timestamp by subtracting (72 * interval duration) from the current time
  int fromTimestamp = now - (72 * intervalDuration);

  return fromTimestamp;
}

String siteSetting(
  List<dynamic> dataList,
  String key,
) {
  for (var item in dataList) {
    if (item['key'] == key) {
      return item['value'] ?? ''; // Returns an empty string if value is null
    }
  }
  return 'Key not found'; // Returns this if the key is not found in the list
}

String forexGenerateMetaTraderURL(dynamic accountData) {
  if (accountData == null || accountData['status'] != true) {
    return 'Invalid account data';
  }

  // Extracting necessary information from accountData
  String broker = accountData['broker'] ?? '';
  String accountType =
      accountData['type'] == 'DEMO' ? 'open_demo' : 'open_trade';
  int mtVersion = accountData['mt'] ?? 4; // Assuming default is MT4
  String accountId = accountData['account_id'] ?? '';
  String password = accountData['password'] ?? '';
  int leverage = accountData['leverage'] ?? 100;
  String lang = 'EN';
  String savePassword = 'on';

  // Generating the URL
  String url = 'https://metatraderweb.app/trade?servers=$broker'
      '&trade_server=$broker&startup_mode=$accountType'
      '&startup_version=$mtVersion&lang=$lang&save_password=$savePassword'
      '&login=$accountId&password=$password&leverage=$leverage';

  return url;
}

String extractWalletUUID(
  List<dynamic> wallets,
  String currency,
) {
  for (var wallet in wallets) {
    if (wallet['currency'] == currency) {
      return wallet['uuid'];
    }
  }
  return 'Currency not found';
}

List<dynamic> exchangeOrderAsksandBids(
  List<dynamic> data,
  bool isAskList,
) {
  var formattedList = data
      .map((entry) => {
            'price': entry[0],
            'amount': entry[1],
            'cumulative': 0.0, // Initialize cumulative amount
          })
      .toList();

  // Calculate the cumulative amounts.
  double highestCumulativeAmount = 0.0;
  if (isAskList) {
    // For asks, cumulative amount calculation starts from the last element.
    for (int i = formattedList.length - 1; i >= 0; i--) {
      highestCumulativeAmount += formattedList[i]['amount'];
      formattedList[i]['cumulative'] = highestCumulativeAmount;
    }
  } else {
    // For bids, cumulative amount calculation starts from the first element.
    for (int i = 0; i < formattedList.length; i++) {
      highestCumulativeAmount += formattedList[i]['amount'];
      formattedList[i]['cumulative'] = highestCumulativeAmount;
    }
  }

  // Assign widths based on the cumulative amount, ensuring it doesn't exceed 39.
  for (var entry in formattedList) {
    double widthRatio = entry['cumulative'] / highestCumulativeAmount;
    int width = (widthRatio * 120).round();
    entry['width'] = width > 120
        ? 120
        : width; // Ensure width does not exceed 39 and is an int
    // When assigning to a Flutter property that expects a double, explicitly cast it
    entry['width'] =
        entry['width'].toDouble(); // Explicitly cast width to double
  }

  // Create a new list without the cumulative key.
  var resultList = formattedList
      .map((entry) => {
            'price': entry['price'],
            'amount': entry['amount'],
            'width': entry['width'], // Already converted to double
          })
      .toList();

  return resultList;
}

double incrementOne(double? value) {
  double val = value ?? 0.1;
  // Convert to string for manipulation
  String valStr = val.toString();

  // Find the position of the decimal point
  int decimalIndex = valStr.indexOf('.');
  // If there is no decimal point, just add 1 to the value
  if (decimalIndex == -1) {
    return val + 1;
  } else {
    // Count the number of digits after the decimal
    int numOfDecimals = valStr.length - decimalIndex - 1;
    // Calculate the smallest increment
    double increment = math.pow(10, -numOfDecimals) as double;
    return val + increment;
  }
}

double exchangeTakerMakerFee(
  String symbol,
  List<dynamic> data,
  bool taker,
) {
// Split the symbol into currency and pair
  List<String> symbolParts = symbol.split('/');
  if (symbolParts.length != 2) {
    return 0.0; // Invalid symbol format
  }

  String currency = symbolParts[0];
  String pair = symbolParts[1];

  // Iterate over the data list to find the entry with the matching currency and pair
  for (var entry in data) {
    if (entry["currency"] == currency && entry["pair"] == pair) {
      // When found, return either the taker or maker fee based on the taker flag
      return taker ? entry["metadata"]["taker"] : entry["metadata"]["maker"];
    }
  }

  // If the symbol is not found, return 0
  return 0.0;
}

dynamic exchangeBidsAsksPercent(
  List<dynamic>? bids,
  List<dynamic>? asks,
) {
  if (bids == null || asks == null || bids.isEmpty || asks.isEmpty) {
    return {
      'asks': 50.0,
      'bids': 50.0,
    };
  }

  // Extract the 'amount' from each bid and ask, then calculate total amounts
  double totalAsks =
      asks.fold(0.0, (sum, current) => sum + (current['amount'] as double));
  double totalBids =
      bids.fold(0.0, (sum, current) => sum + (current['amount'] as double));

  // Calculate the total volume of both asks and bids
  double totalVolume = totalAsks + totalBids;

  // Calculate the percentage of the total for asks and bids
  double asksPercentage = 0.0;
  double bidsPercentage = 0.0;

  if (totalVolume > 0) {
    // Avoid division by zero
    asksPercentage = (totalAsks / totalVolume) * 100;
    bidsPercentage = (totalBids / totalVolume) * 100;
  }

  // Round the percentages to one decimal place and ensure they always have one decimal
  asksPercentage = double.parse((asksPercentage).toStringAsFixed(1));
  bidsPercentage = double.parse((bidsPercentage).toStringAsFixed(1));

  // Return the percentages in a map format
  return {
    'asks': asksPercentage,
    'bids': bidsPercentage,
  };
}

String exchangeConvertToMillions(double value) {
  // Check the size of the value and convert accordingly
  if (value >= 1000000000) {
    // Billion case
    return (value / 1000000000).toStringAsFixed(3) + 'B';
  } else if (value >= 1000000) {
    // Million case
    return (value / 1000000).toStringAsFixed(3) + 'M';
  } else if (value >= 1000) {
    // Thousand case
    return (value / 1000).toStringAsFixed(2) + 'K';
  } else {
    // Less than a thousand case
    return value.toString();
  }
}

double? calculateTradeCost(
  bool isBuy,
  double? price,
  double? amount,
  double? fee,
) {
  if (price == null || amount == null || fee == null) {
    return 0.000;
  }

  // Calculate the fee
  double feeAmount = (amount * price * fee) / 100;

  // Calculate and return the cost
  if (isBuy) {
    // For a buy, cost includes the amount times the price plus the fee
    return (amount * price) + feeAmount;
  } else {
    // For a sell, cost is just the amount times the price
    return amount * price;
  }
}

List<dynamic> demoTickers(String? filter) {
  const allSymbols = [
    "BTC/USDT",
    "ETH/USDT",
    "BNB/USDT",
    "LTC/USDT",
    "QTUM/USDT",
    "ADA/USDT",
    "EOS/USDT",
    "TRX/USDT",
    "ETC/USDT",
    "ICX/USDT",
    "VET/USDT",
    "LINK/USDT",
    "WAVES/USDT",
    "ZIL/USDT",
    "XMR/USDT",
    "ZEC/USDT",
    "CELR/USDT",
    "DASH/USDT",
    "OMG/USDT",
    "THETA/USDT",
    "ENJ/USDT",
    "MATIC/USDT",
    "ATOM/USDT",
    "ONE/USDT",
    "ANKR/USDT",
    "COS/USDT",
    "MTL/USDT",
    "BAND/USDT",
    "XTZ/USDT",
    "RVN/USDT",
    "STX/USDT",
    "KAVA/USDT",
    "ARPA/USDT",
    "RLC/USDT",
    "BCH/USDT",
    "VITE/USDT",
    "FTT/USDT",
    "EUR/USDT",
    "WRX/USDT",
    "LSK/USDT",
    "BNT/USDT",
    "STPT/USDT",
    "DATA/USDT",
    "SOL/USDT",
    "MDT/USDT",
    "KNC/USDT",
    "COMP/USDT",
    "ZEN/USDT",
    "SNX/USDT",
    "DGB/USDT",
    "GBP/USDT",
    "SXP/USDT",
    "DCR/USDT",
    "BAL/USDT",
    "IRIS/USDT",
    "JST/USDT",
    "ANT/USDT",
    "CRV/USDT",
    "NMR/USDT",
    "DOT/USDT",
    "LUNA/USDT",
    "RSR/USDT",
    "WNXM/USDT",
    "TRB/USDT",
    "SUSHI/USDT",
    "KSM/USDT",
    "EGLD/USDT",
    "DIA/USDT",
    "RUNE/USDT",
    "UMA/USDT",
    "BEL/USDT",
    "WING/USDT",
    "UNI/USDT",
    "AVAX/USDT",
    "ORN/USDT",
    "XVS/USDT",
    "NEAR/USDT",
    "FIL/USDT",
    "INJ/USDT",
    "AUDIO/USDT",
    "CTK/USDT",
    "AXS/USDT",
    "STRAX/USDT",
    "UNFI/USDT",
    "AVA/USDT",
    "JUV/USDT",
    "PSG/USDT",
    "1INCH/USDT",
    "OG/USDT",
    "ATM/USDT",
    "ASR/USDT",
    "CELO/USDT",
    "FIRO/USDT",
    "LIT/USDT",
    "DODO/USDT",
    "CAKE/USDT",
    "BADGER/USDT",
    "POND/USDT",
    "DEGO/USDT",
    "ALICE/USDT",
    "LINA/USDT",
    "PERP/USDT",
    "TKO/USDT",
    "PUNDIX/USDT",
    "FORTH/USDT",
    "BAKE/USDT",
    "BURGER/USDT",
    "ICP/USDT",
    "AR/USDT",
    "POLS/USDT",
    "MDX/USDT",
    "MASK/USDT",
    "LPT/USDT",
    "GTC/USDT",
    "ERN/USDT",
    "KLAY/USDT",
    "BOND/USDT",
    "MLN/USDT",
    "DEXE/USDT",
    "C98/USDT",
    "CLV/USDT",
    "QNT/USDT",
    "FLOW/USDT",
    "MINA/USDT",
    "RAY/USDT",
    "FARM/USDT",
    "ALPACA/USDT",
    "MBOX/USDT",
    "GHST/USDT",
    "GNO/USDT",
    "ELF/USDT",
    "DYDX/USDT",
    "IDEX/USDT",
    "ILV/USDT",
    "YGG/USDT",
    "FIDA/USDT",
    "CVP/USDT",
    "AGLD/USDT",
    "RAD/USDT",
    "RARE/USDT",
    "LAZIO/USDT",
    "CHESS/USDT",
    "AUCTION/USDT",
    "BNX/USDT",
    "MOVR/USDT",
    "CITY/USDT",
    "ENS/USDT",
    "KP3R/USDT",
    "PORTO/USDT",
    "VGX/USDT",
    "JASMY/USDT",
    "PLA/USDT",
    "PYR/USDT",
    "RNDR/USDT",
    "ALCX/USDT",
    "SANTOS/USDT",
    "BICO/USDT",
    "FLUX/USDT",
    "FXS/USDT",
    "VOXEL/USDT",
    "HIGH/USDT",
    "CVX/USDT",
    "PEOPLE/USDT",
    "JOE/USDT",
    "IMX/USDT",
    "GLMR/USDT",
    "LOKA/USDT",
    "SCRT/USDT",
    "API3/USDT",
    "ACA/USDT",
    "XNO/USDT",
    "WOO/USDT",
    "ALPINE/USDT",
    "T/USDT",
    "ASTR/USDT",
    "GMT/USDT",
    "KDA/USDT",
    "APE/USDT",
    "BSW/USDT",
    "MULTI/USDT",
    "STEEM/USDT",
    "MOB/USDT",
    "NEXO/USDT",
    "REI/USDT",
    "GAL/USDT",
    "LDO/USDT",
    "OP/USDT",
    "STG/USDT",
    "LUNC/USDT",
    "GMX/USDT",
    "POLYX/USDT",
    "APT/USDT",
    "OSMO/USDT",
    "HFT/USDT",
    "HOOK/USDT",
    "MAGIC/USDT",
    "HIFI/USDT",
    "RPL/USDT",
    "GNS/USDT",
    "SYN/USDT",
    "SSV/USDT",
    "LQTY/USDT",
    "GAS/USDT",
    "GLM/USDT",
    "PROM/USDT",
    "ARB/USDT",
    "WBTC/USDT",
    "SUI/USDT",
    "COMBO/USDT",
    "PENDLE/USDT",
    "WBETH/USDT",
    "WLD/USDT",
    "SEI/USDT",
    "CYBER/USDT",
    "CREAM/USDT",
    "NTRN/USDT",
    "BNB/USDC",
    "BTC/USDC",
    "ETH/USDC",
    "BTC/TUSD",
    "ETH/TUSD",
    "BNB/TUSD",
    "ADA/TUSD",
    "LINK/TUSD",
    "LTC/TUSD",
    "BCH/TUSD",
    "ARB/TUSD",
    "LDO/TUSD",
    "MATIC/TUSD",
    "OP/TUSD",
    "SOL/TUSD",
    "SSV/TUSD",
    "SUI/TUSD",
    "PENDLE/TUSD",
    "AVAX/TUSD",
    "COMP/TUSD",
    "CYBER/TUSD",
    "SEI/TUSD",
    "RUNE/TUSD"
  ];

  // Function to create a Map with zeroed values for a given symbol
  Map<String, dynamic> zeroedTicker(String symbol) {
    return {
      "symbol": symbol,
      "bid": 0.0,
      "ask": 0.0,
      "close": 0.0,
      "last": 0.0,
      "change": 0.0,
      "baseVolume": 0.0,
      "quoteVolume": 0.0,
    };
  }

  // Create a list of zeroed tickers for all symbols or filtered by the filter argument
  List<dynamic> tickers = allSymbols
      .where((symbol) =>
          filter == null ||
          filter.toLowerCase() == 'all' ||
          symbol.contains(filter))
      .map((symbol) => zeroedTicker(symbol))
      .toList();

  return tickers;
}

List<dynamic> demoHistorical(
  double? open,
  double? high,
  double? low,
  double? close,
  double? vol,
) {
  final currentTimeUTC = DateTime.now().toUtc();
  final currentTimeMillis = currentTimeUTC.millisecondsSinceEpoch;

  // Create two demo historical data points with the current time in UTC and values either as specified or defaulting to zero
  final List<Map<String, dynamic>> demoData = [
    {
      'time': currentTimeMillis,
      'open': open ?? 0.0,
      'high': high ?? 0.0,
      'low': low ?? 0.0,
      'close': close ?? 0.0,
      'vol': vol ?? 0.0,
    },
    {
      'time': currentTimeMillis +
          1000, // Adding 1 millisecond to differentiate the two demo points
      'open': open ?? 0.0,
      'high': high ?? 0.0,
      'low': low ?? 0.0,
      'close': close ?? 0.0,
      'vol': vol ?? 0.0,
    },
  ];

  return demoData;
}

dynamic saveChatHistory(
  dynamic chatHistory,
  String newChat,
) {
  Map<String, dynamic> chatMap = json.decode(newChat);

  // Check if chatHistory is a List<Map<String, dynamic>>, and add chatMap to it
  if (chatHistory is List<Map<String, dynamic>>) {
    chatHistory.add(chatMap);
  } else {
    chatHistory = <Map<String, dynamic>>[chatMap];
  }
  return chatHistory;
}

dynamic convertToJSON(String prompt) {
  // take the prompt and return a JSON with form [{"role": "user", "content": prompt}]
  return json.encode({"role": "user", "content": prompt});
}

double exchangeHighLow(
  List<dynamic>? jsonData,
  int value,
) {
  if (jsonData == null || jsonData.isEmpty) {
    return 0.0;
  }

  double globalHigh = double.negativeInfinity;
  double globalLow = double.infinity;

  for (List<dynamic> dataSet in jsonData) {
    // Use the .toDouble() method to ensure the values are treated as doubles
    double high =
        (dataSet[2] is int) ? (dataSet[2] as int).toDouble() : dataSet[2];
    double low =
        (dataSet[3] is int) ? (dataSet[3] as int).toDouble() : dataSet[3];

    globalHigh = math.max(globalHigh, high);
    globalLow = math.min(globalLow, low);
  }

  if (value == 1) {
    return globalHigh;
  } else if (value == 2) {
    return globalLow;
  } else {
    throw ArgumentError(
        'Invalid value parameter. Use 1 for high and 2 for low.');
  }
}

List<dynamic> announsment() {
  List<dynamic> announcements = [
    {
      'date': '2024-04-14',
      'info': 'NordicX updates: AI chat assistant development complete.',
      'time': '12:00 PM',
      'link': ' '
    },
    {
      'date': '2024-04-10',
      'info':
          'NordicLabs partners with CONVAI AI to bring NordicWorld users extremely immersive and realistic gameplay.',
      'time': '10:00 AM',
      'link': ' '
    },
    {
      'date': '2024-04-08',
      'info':
          'NordicAI (NRDC) price is now being tracked on Metamask, Coinbase, and Coingecko.',
      'time': '02:00 PM',
      'link': ' '
    },
    {
      'date': '2024-04-07',
      'info':
          'NordicWorld updates: New Assets added to maps and level streaming setup begins. Projected BETA launch date: July 4th 2024.',
      'time': '04:30 PM',
      'link': ' '
    },
    {
      'date': '2024-04-06',
      'info': 'NordicAI (NRDC) gets listed on Coingecko.',
      'time': '09:00 AM',
      'link': 'https://www.coingecko.com/en/coins/nordic-ai'
    },
    {
      'date': '2024-04-04',
      'info': 'NordicAI (NRDC) gets listed on MEXC! - Buy NRDC now on MEXC.com',
      'time': '11:00 AM',
      'link': ' '
    },
    {
      'date': '2024-03-28',
      'info':
          'NordicAI (NRDC) partners with REV3AL Web3 cybersecurity firm. More information coming soon.',
      'time': '05:00 PM',
      'link': ' '
    },
    {
      'date': '2024-03-10',
      'info': 'NordicLabs partners with Unreal Engine 5 and Epic Games',
      'time': '03:00 PM',
      'link': ' '
    }
  ];

  return announcements;
}

bool? kycFieldRequirAndLevel(
  dynamic jsonBody,
  String name,
  int level,
) {
  // Parse the JSON strings
  Map<String, dynamic> options = json.decode(jsonBody['options']);
  Map<String, dynamic> customOptions = json.decode(jsonBody['customOptions']);

  // Check the 'options' map
  if (options.containsKey(name)) {
    Map<String, dynamic> field = options[name];
    int fieldLevel = int.tryParse(field['level'].toString()) ?? -1;
    if (fieldLevel == level) {
      return true;
    } else {
      return false;
    }
  }

  // Check the 'customOptions' map
  if (customOptions.containsKey(name)) {
    Map<String, dynamic> customField = customOptions[name];
    int customFieldLevel = int.tryParse(customField['level'].toString()) ?? -1;
    if (customFieldLevel == level) {
      return true;
    } else {
      return false;
    }
  }

  // If the field name is not found in both options and customOptions
  return false;
}

List<dynamic> kycGetCustomOptionNames(dynamic templateJson) {
  // Parse the customOptions JSON string
  Map<String, dynamic> customOptions =
      json.decode(templateJson['customOptions']);

  // Extract the details of the custom options and format them
  List<Map<String, dynamic>> customOptionDetails =
      customOptions.entries.map((entry) {
    return {
      'title': entry.key,
      'type': entry.value['type'],
      'level': entry.value['level'],
    };
  }).toList();

  return customOptionDetails;
}

dynamic kycPostApplication(
  dynamic templateJson,
  List<String>? customOptionValues,
  String? firstName,
  String? lastName,
  String? email,
  String? phone,
  String? address,
  String? city,
  String? state,
  String? country,
  String? zip,
  DateTime? dob,
  int? ssn,
  String? documentPassportFront,
  String? documentPassportSelfie,
  String? documentDriversLicenseFront,
  String? documentDriversLicenseSelfie,
  String? documentIdCardBack,
  String? documentIdCardFront,
  String? documentIdCardSelfie,
  String? templateID,
  int? level,
) {
  Map<String, dynamic> templateData =
      (templateJson is String) ? jsonDecode(templateJson) : templateJson;

  // Extract options and customOptions from the templateJson
  Map<String, dynamic> options = jsonDecode(templateData['options']);
  Map<String, dynamic> customOptions =
      jsonDecode(templateData['customOptions']);

  // Generate the payload using the provided parameters
  Map<String, dynamic> payload = {
    'templateId': templateID ?? templateData['id'],
    'fields': {
      if (firstName != null && firstName.isNotEmpty) 'firstName': firstName,
      if (lastName != null && lastName.isNotEmpty) 'lastName': lastName,
      if (email != null && email.isNotEmpty) 'email': email,
      if (phone != null && phone.isNotEmpty) 'phone': phone,
      if (address != null && address.isNotEmpty) 'address': address,
      if (city != null && city.isNotEmpty) 'city': city,
      if (state != null && state.isNotEmpty) 'state': state,
      if (country != null && country.isNotEmpty) 'country': country,
      if (zip != null && zip.isNotEmpty) 'zip': zip,
      if (dob != null) 'dob': dob.toIso8601String(),
      if (ssn != null) 'ssn': ssn,
      'documents': {
        if (documentPassportFront != null || documentPassportSelfie != null)
          'documentPassport': {
            if (documentPassportFront != null) 'front': documentPassportFront,
            if (documentPassportSelfie != null)
              'selfie': documentPassportSelfie,
          },
        if (documentDriversLicenseFront != null ||
            documentDriversLicenseSelfie != null)
          'documentDriversLicense': {
            if (documentDriversLicenseFront != null)
              'front': documentDriversLicenseFront,
            if (documentDriversLicenseSelfie != null)
              'selfie': documentDriversLicenseSelfie,
          },
        if (documentIdCardFront != null ||
            documentIdCardBack != null ||
            documentIdCardSelfie != null)
          'documentIdCard': {
            if (documentIdCardFront != null) 'front': documentIdCardFront,
            if (documentIdCardBack != null) 'back': documentIdCardBack,
            if (documentIdCardSelfie != null) 'selfie': documentIdCardSelfie,
          },
      },
    },
    'level': level ?? 0,
  };

  // Handle custom options if provided
  if (customOptionValues != null && customOptionValues.isNotEmpty) {
    List<String> customOptionKeys = customOptions.keys.toList();
    for (int i = 0; i < customOptionKeys.length; i++) {
      if (i < customOptionValues.length &&
          customOptionValues[i] != null &&
          customOptionValues[i].isNotEmpty) {
        payload['fields'][customOptionKeys[i]] = customOptionValues[i];
      }
    }
  }

  // Remove any null or empty values from the payload
  payload['fields'].removeWhere(
      (key, value) => value == null || (value is String && value.isEmpty));
  payload['fields']['documents'].removeWhere(
      (key, value) => value == null || (value is Map && value.isEmpty));

  // Return the final payload
  return payload;
}

List<String> investmentDurationList(dynamic json) {
  List<String> durations = [];

  // Check if input is a Map (for a single investment plan) or List (for multiple investment plans)
  if (json is Map<String, dynamic>) {
    if (json.containsKey('durations') && json['durations'] is List) {
      for (var duration in json['durations']) {
        if (duration is Map<String, dynamic>) {
          String durationString =
              '${duration['duration']} ${duration['timeframe']}';
          durations.add(durationString);
        }
      }
    }
  } else if (json is List) {
    for (var item in json) {
      if (item is Map<String, dynamic> &&
          item.containsKey('durations') &&
          item['durations'] is List) {
        for (var duration in item['durations']) {
          if (duration is Map<String, dynamic>) {
            String durationString =
                '${duration['duration']} ${duration['timeframe']}';
            durations.add(durationString);
          }
        }
      }
    }
  } else {
    throw ArgumentError('Expected a List or Map but got ${json.runtimeType}');
  }

  return durations;
}

List<dynamic> walletMethodsCustomFields(String fields) {
  // Decode the string once to get the actual JSON string
  String decodedString = json.decode(fields);

  // Parse the actual JSON string into a List
  List<dynamic> customFields = json.decode(decodedString);

  // Extract the details of the custom fields and format them
  List<Map<String, dynamic>> customFieldDetails = customFields.map((field) {
    return {
      'title': field['title'],
      'type': field['type'],
      'required': field['required'],
    };
  }).toList();

  return customFieldDetails;
}

bool? extensionsVisibility(
  List<String> list,
  String value,
) {
  return list.contains(value);
}

String? stakingEndDate(
  String createdAt,
  int? durationDays,
) {
  if (createdAt == null || durationDays == null) {
    return null;
  }

  // Parse the createdAt date
  DateTime createdDate = DateTime.parse(createdAt);

  // Add the duration in days
  DateTime endDate = createdDate.add(Duration(days: durationDays));

  // Format the end date
  String formattedEndDate = DateFormat('d MMM yyyy HH:mm').format(endDate);

  return formattedEndDate;
}

bool supportAttachment(dynamic data) {
  if (data is Map<String, dynamic>) {
    return data.containsKey('attachment') &&
        data['attachment'] != null &&
        data['attachment'].toString().isNotEmpty;
  }
  return false;
}

dynamic uploadImage(
  String dir,
  FFUploadedFile file,
  int height,
  int width,
) {
  if (file == null) {
    return null;
  }

  // Convert the file to base64
  String base64File = base64Encode(file.bytes!);

  // Determine the content type based on the file extension
  String contentType = 'application/octet-stream'; // default
  if (file.name != null) {
    final extension = file.name!.split('.').last.toLowerCase();
    switch (extension) {
      case 'png':
        contentType = 'image/png';
        break;
      case 'jpg':
      case 'jpeg':
        contentType = 'image/jpeg';
        break;
      case 'gif':
        contentType = 'image/gif';
        break;
      // Add more cases as needed
    }
  }

  // Create the request body
  Map<String, dynamic> requestBody = {
    "file": "data:$contentType;base64,$base64File",
    "dir": dir,
    "height": height,
    "width": width,
  };

  return requestBody;
}

List<String> p2pManageStructure(
  dynamic body,
  String key,
) {
  if (body == null || body is! Map || !body.containsKey('get')) {
    return [];
  }

  List<dynamic> getList = body['get'] as List;
  if (getList.isEmpty || getList[0] is! List) {
    return [];
  }

  List<dynamic> firstGroup = getList[0] as List;
  Map<String, dynamic>? currencyField;

  for (var field in firstGroup) {
    if (field is Map && field['name'] == 'currency') {
      currencyField = field as Map<String, dynamic>;
      break;
    }
  }

  if (currencyField == null || !currencyField.containsKey('conditions')) {
    return [];
  }

  Map<String, dynamic>? walletTypeConditions =
      currencyField['conditions']['walletType'] as Map<String, dynamic>?;
  if (walletTypeConditions == null || !walletTypeConditions.containsKey(key)) {
    return [];
  }

  List<dynamic> currencies = walletTypeConditions[key] as List;
  return currencies.map((currency) => currency['value'].toString()).toList();
}

List<dynamic> walletGatwayAndMethodes(dynamic jsonBody) {
  List<dynamic> result = [];

  if (jsonBody is Map<String, dynamic>) {
    // Handle gateways
    if (jsonBody.containsKey('gateways')) {
      List<dynamic> gateways = jsonBody['gateways'];
      for (var gateway in gateways) {
        result.add({
          'type': 'gateway',
          'id': gateway['id'],
          'name': gateway['name'],
          'title': gateway['title'],
          'description': gateway['description'],
          'image': gateway['image'],
          'alias': gateway['alias'],
          'fixedFee': gateway['fixedFee'],
          'percentageFee': gateway['percentageFee'],
          'minAmount': gateway['minAmount'],
          'maxAmount': gateway['maxAmount'],
          'status': gateway['status'],
          'currencies': gateway['currencies'],
        });
      }
    }

    // Handle methods
    if (jsonBody.containsKey('methods')) {
      List<dynamic> methods = jsonBody['methods'];
      for (var method in methods) {
        Map<String, dynamic> methodMap = {
          'type': 'method',
          'id': method['id'],
          'title': method['title'],
          'instructions': method['instructions'],
          'image': method['image'],
          'fixedFee': method['fixedFee'],
          'percentageFee': method['percentageFee'],
          'minAmount': method['minAmount'],
          'maxAmount': method['maxAmount'],
          'status': method['status'],
        };

        // Handle custom fields
        if (method.containsKey('customFields')) {
          List<dynamic> customFields = jsonDecode(method['customFields']);
          List<Map<String, dynamic>> mappedCustomFields = [];
          for (var field in customFields) {
            mappedCustomFields.add({
              'title': field['title'],
              'type': field['type'],
            });
          }
          methodMap['customFields'] = mappedCustomFields;
        }

        result.add(methodMap);
      }
    }
  }

  return result;
}

List<dynamic> exchangeMAPTickers(dynamic body) {
  final Map<String, dynamic> data = body is String ? json.decode(body) : body;

  // Transform the data into the desired format
  List<Map<String, dynamic>> result = [];

  data.forEach((symbol, details) {
    result.add({
      'symbol': symbol,
      ...details,
    });
  });

  return result;
}

List<String> marketCombinList(
  List<String> currency,
  List<String> pair,
) {
  // Create a new list to store the combined strings
  List<String> result = [];

  // Determine the length of the shorter list
  int length = math.min(currency.length, pair.length);

  // Combine the strings from both lists
  for (int i = 0; i < length; i++) {
    result.add('${currency[i]}/${pair[i]}');
  }

  return result;
}

dynamic fiatDepostCustomFields(
  List<dynamic>? customFieldsJson,
  List<String>? values,
) {
// Check if inputs are valid
  if (customFieldsJson == null ||
      values == null ||
      customFieldsJson.isEmpty ||
      values.isEmpty) {
    return {};
  }

  // Create a map to store the result
  Map<String, String> result = {};

  // Iterate through the customFieldsJson list
  for (int i = 0; i < customFieldsJson.length; i++) {
    // Get the current custom field
    Map<String, dynamic> field = customFieldsJson[i];

    // Extract the title from the custom field
    String title = field['title'];

    // Get the corresponding value from the values list
    // If there's no matching value, use an empty string
    String value = i < values.length ? values[i] : '';

    // Add the title-value pair to the result map
    result[title] = value;
  }

  // Return the result as a dynamic object
  return result;
}

dynamic p2pChatMessage(
  String id,
  String userId,
  String attachment,
  String text,
  String type,
) {
  // Get the current UTC time and format it
  final now = DateTime.now().toUtc();
  final formattedTime = now.toIso8601String();

  // Construct the message object
  final message = {
    'payload': {
      'id': id,
      'message': {
        'type': type,
        'text': text,
        'time': formattedTime,
        'attachment': attachment,
        'userId': userId,
      },
    },
  };

  // Convert the message to a JSON string and then parse it back to a dynamic object
  // This ensures that the returned value is of type 'dynamic'
  return json.decode(json.encode(message));
}

bool gatewaysVisibilty(
  dynamic jsonData,
  String currency,
) {
// Check if jsonData is a Map (JSON object)
  if (jsonData is Map<String, dynamic>) {
    // Check if the 'currencies' key exists and is a List
    if (jsonData.containsKey('currencies') && jsonData['currencies'] is List) {
      // Cast the 'currencies' value to a List<dynamic>
      List<dynamic> currencies = jsonData['currencies'] as List<dynamic>;

      // Check if the given currency exists in the list
      // We use toUpperCase() to make the comparison case-insensitive
      return currencies
          .any((c) => c.toString().toUpperCase() == currency.toUpperCase());
    }
  }

  // If jsonData is not in the expected format or currency is not found, return false
  return false;
}

List<dynamic> recentTradeInfo(List<dynamic> recentTrades) {
  if (recentTrades == null || recentTrades.isEmpty) {
    return [];
  }

  // Process Recent Trades to find top large buy or sell orders
  List<Map<String, dynamic>> processedRecentTrades = recentTrades.map((trade) {
    return {
      'info': trade['info'],
      'timestamp': trade['timestamp'],
      'datetime': trade['datetime'],
      'symbol': trade['symbol'],
      'id': trade['id'],
      'side': trade['side'],
      'price': trade['price'],
      'amount': trade['amount'],
      'cost': trade['price'] * trade['amount'], // Ensure cost is calculated
      'fees': trade['fees'],
      'formattedTime': trade['formattedTime'],
    };
  }).toList();

  // Sort trades by cost to find the largest trades
  processedRecentTrades.sort((a, b) => b['cost'].compareTo(a['cost']));

  // Get the top 10 trades
  List<Map<String, dynamic>> topTrades =
      processedRecentTrades.take(10).toList();

  // Format the top trades for output
  List<Map<String, dynamic>> formattedTopTrades = topTrades.map((trade) {
    return {
      'time': trade['formattedTime'],
      'type': trade['side'] == 'buy'
          ? 'Large buy order placed'
          : 'Large sell order filled',
      'price': trade['price'],
      'amount': trade['amount'],
      'cost': trade['cost'],
    };
  }).toList();

  return formattedTopTrades;
}

dynamic chartAnalysis(
  dynamic ticker,
  dynamic historical,
  List<dynamic>? bids,
  List<dynamic>? asks,
  List<dynamic> trades,
) {
  // Ensure we have valid data
  if (ticker == null || historical == null || bids == null || asks == null) {
    return null;
  }

  // Helper function to round to 1 decimal place
  double roundToOneDecimal(double value) {
    return (value * 10).round() / 10;
  }

  // Extract relevant data from ticker
  double currentPrice = roundToOneDecimal(ticker['last'] ?? 0.0);
  double high24h = roundToOneDecimal(ticker['high'] ?? 0.0);
  double low24h = roundToOneDecimal(ticker['low'] ?? 0.0);
  double priceChange24h = roundToOneDecimal(ticker['change'] ?? 0.0);
  double volumeQuote = ticker['quoteVolume'] ?? 0.0;

  // Process trades data
  int buyTrades = 0;
  int sellTrades = 0;
  double buyVolume = 0.0;
  double sellVolume = 0.0;

  for (var trade in trades) {
    if (trade['side'] == 'buy') {
      buyTrades++;
      buyVolume += trade['cost'] ?? 0.0;
    } else if (trade['side'] == 'sell') {
      sellTrades++;
      sellVolume += trade['cost'] ?? 0.0;
    }
  }

  // Calculate total trades and volume
  int totalTrades = buyTrades + sellTrades;
  double totalVolume = buyVolume + sellVolume;

  // Calculate trader ratio (percentage of buyers)
  double traderRatio = totalTrades > 0 ? (buyTrades / totalTrades) * 100 : 50.0;
  traderRatio = roundToOneDecimal(traderRatio);

  // Calculate buy percentages and round to one decimal
  double buySellTraders = roundToOneDecimal(
      totalTrades > 0 ? (buyTrades / totalTrades) * 100 : 50.0);
  double buySellVolume = roundToOneDecimal(
      totalVolume > 0 ? (buyVolume / totalVolume) * 100 : 50.0);

  // Determine trading trend
  String tradingTrend = priceChange24h >= 0 ? "Buy" : "Sell";

  // Calculate Greed Index components
  double priceChangeComponent =
      ((currentPrice - low24h) / (high24h - low24h)) * 100;
  double volumeComponent = buySellVolume;
  double traderComponent = traderRatio;

  // Calculate Greed Index (simple average of components)
  double greedIndex =
      (priceChangeComponent + volumeComponent + traderComponent) / 3;
  greedIndex = greedIndex.clamp(0, 100); // Ensure it's between 0 and 100
  greedIndex = roundToOneDecimal(greedIndex);

  return {
    "priceRange": {
      "low": low24h,
      "high": high24h,
      "current": currentPrice,
    },
    "traderRatio": traderRatio,
    "trading_trend": tradingTrend,
    "buy_sell_traders": buySellTraders,
    "buy_sell_volume": buySellVolume,
    "volume_24h": volumeQuote,
    "greed_index": greedIndex,
  };
}

String? tradeViewUrl(
  bool isDarkMood,
  String pair,
  bool useLocalTimezone,
) {
  String symbol = pair.replaceAll('/', '');

  // Set the theme based on isDarkMood
  String theme = isDarkMood ? 'dark' : 'light';

  // Set the timezone
  String timezone = useLocalTimezone ? 'exchange' : 'Etc%2FUTC';

  // Construct the URL
  String url = 'https://s.tradingview.com/widgetembed/' +
      '?frameElementId=tradingview_76d87' +
      '&symbol=$symbol' +
      '&interval=1H' + // Always set to 1 hour
      '&symboledit=0' + // Disable symbol editing
      '&saveimage=1' +
      '&toolbarbg=F1F3F6' +
      '&studies=[]' +
      '&theme=$theme' +
      '&style=1' +
      '&timezone=$timezone' +
      '&studies_overrides={}' +
      '&overrides={}' +
      '&enabled_features=[]' +
      '&disabled_features=[]' +
      '&locale=en' +
      '&hideideas=1' +
      '&hidevolume=0' +
      '&hide_side_toolbar=0' +
      '&allow_symbol_change=0' + // Disable symbol change
      '&details=false' +
      '&hotlist=false' +
      '&calendar=false' +
      '&toolbar_bg=f4f7f9';

  return url;
}

List<dynamic>? aiInvestmentDuration(
  String? id,
  List<dynamic>? plans,
) {
  // Check if id or plans are null
  if (id == null || plans == null) {
    return [];
  }

  // Find the plan with the matching id
  final plan = plans.firstWhere(
    (plan) => plan['id'] == id,
    orElse: () => null,
  );

  // If no matching plan is found, return an empty list
  if (plan == null) {
    return [];
  }

  // Get the durations from the plan
  final durations = plan['durations'] as List<dynamic>?;

  // If durations is null or empty, return an empty list
  if (durations == null || durations.isEmpty) {
    return [];
  }

  // Process the durations
  return durations.map((duration) {
    final durationValue = duration['duration'];
    final timeframe = duration['timeframe'];
    String name = '$durationValue ${timeframe.toLowerCase()}';

    // Add 's' to the timeframe if duration is not 1
    if (durationValue != 1) {
      name += 's';
    }

    return {
      'id': duration['id'],
      'Name': name,
    };
  }).toList();
}

List<String> transferReturnValue(
  String value,
  bool isValue,
) {
  Map<String, List<Map<String, String>>> options = {
    'SPOT': [
      {'label': 'Fiat', 'value': 'FIAT'},
      {'label': 'Funding', 'value': 'ECO'},
    ],
    'FIAT': [
      {'label': 'Spot', 'value': 'SPOT'},
      {'label': 'Funding', 'value': 'ECO'},
    ],
    'ECO': [
      {'label': 'Fiat', 'value': 'FIAT'},
      {'label': 'Spot', 'value': 'SPOT'},
      {'label': 'Futures', 'value': 'FUTURES'},
    ],
    'FUTURES': [
      {'label': 'Funding', 'value': 'ECO'},
    ],
  };

  List<String> result = [];
  if (options.containsKey(value.toUpperCase())) {
    result = options[value.toUpperCase()]!
        .map((item) => isValue ? item['value']! : item['label']!)
        .toList();
  }

  return result;
}

List<dynamic> walletEcoMapChains(List<dynamic> data) {
  return data.map((item) {
    // Create a new map to store the processed item
    Map<String, dynamic> processedItem = Map<String, dynamic>.from(item);

    // Parse the 'limits' JSON string
    if (processedItem['limits'] != null) {
      try {
        processedItem['limits'] = json.decode(processedItem['limits']);
      } catch (e) {
        print('Error parsing limits: $e');
        processedItem['limits'] = {};
      }
    }

    // Parse the 'fee' JSON string
    if (processedItem['fee'] != null) {
      try {
        processedItem['fee'] = json.decode(processedItem['fee']);
      } catch (e) {
        print('Error parsing fee: $e');
        processedItem['fee'] = {};
      }
    }

    return processedItem;
  }).toList();
}

dynamic walletEcoMapAddress(String data) {
  if (data.isEmpty) {
    return null;
  }

  try {
    // Replace escaped quotes with actual quotes
    String cleanedData = data.replaceAll('\\"', '"');

    // Parse the cleaned input string
    Map<String, dynamic> parsedData = json.decode(cleanedData);

    // Extract the chain (currency) name
    String chain = parsedData.keys.first;

    // Extract the address information
    Map<String, dynamic> addressInfo = parsedData[chain];

    // Create the new structure
    return {
      'chain': chain,
      'address': {
        'address': addressInfo['address'],
        'network': addressInfo['network'],
        'balance': addressInfo['balance'],
      },
    };
  } catch (e) {
    print('Error parsing input data: $e');
    return null;
  }
}
