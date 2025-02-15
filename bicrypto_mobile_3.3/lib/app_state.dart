import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _csrftoken = prefs.getString('ff_csrftoken') ?? _csrftoken;
    });
    _safeInit(() {
      _sessionId = prefs.getString('ff_sessionId') ?? _sessionId;
    });
    _safeInit(() {
      _accesstoken = prefs.getString('ff_accesstoken') ?? _accesstoken;
    });
    _safeInit(() {
      _firstName = prefs.getString('ff_firstName') ?? _firstName;
    });
    _safeInit(() {
      _lastName = prefs.getString('ff_lastName') ?? _lastName;
    });
    _safeInit(() {
      _avatar = prefs.getString('ff_avatar') ?? _avatar;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_allTickersApi')) {
        try {
          _allTickersApi =
              jsonDecode(prefs.getString('ff_allTickersApi') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _isCacheOverride =
          prefs.getBool('ff_isCacheOverride') ?? _isCacheOverride;
    });
    _safeInit(() {
      _darkModeSet = prefs.getBool('ff_darkModeSet') ?? _darkModeSet;
    });
    _safeInit(() {
      _userID = prefs.getString('ff_userID') ?? _userID;
    });
    _safeInit(() {
      _isTradeView = prefs.getBool('ff_isTradeView') ?? _isTradeView;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _csrftoken = '';
  String get csrftoken => _csrftoken;
  set csrftoken(String value) {
    _csrftoken = value;
    prefs.setString('ff_csrftoken', value);
  }

  String _sessionId = '';
  String get sessionId => _sessionId;
  set sessionId(String value) {
    _sessionId = value;
    prefs.setString('ff_sessionId', value);
  }

  String _accesstoken = '';
  String get accesstoken => _accesstoken;
  set accesstoken(String value) {
    _accesstoken = value;
    prefs.setString('ff_accesstoken', value);
  }

  String _newsurl = '';
  String get newsurl => _newsurl;
  set newsurl(String value) {
    _newsurl = value;
  }

  String _firstName = '';
  String get firstName => _firstName;
  set firstName(String value) {
    _firstName = value;
    prefs.setString('ff_firstName', value);
  }

  String _lastName = '';
  String get lastName => _lastName;
  set lastName(String value) {
    _lastName = value;
    prefs.setString('ff_lastName', value);
  }

  String _avatar = '';
  String get avatar => _avatar;
  set avatar(String value) {
    _avatar = value;
    prefs.setString('ff_avatar', value);
  }

  bool _isWebSocketOpen = false;
  bool get isWebSocketOpen => _isWebSocketOpen;
  set isWebSocketOpen(bool value) {
    _isWebSocketOpen = value;
  }

  List<dynamic> _listWSData = [];
  List<dynamic> get listWSData => _listWSData;
  set listWSData(List<dynamic> value) {
    _listWSData = value;
  }

  void addToListWSData(dynamic value) {
    listWSData.add(value);
  }

  void removeFromListWSData(dynamic value) {
    listWSData.remove(value);
  }

  void removeAtIndexFromListWSData(int index) {
    listWSData.removeAt(index);
  }

  void updateListWSDataAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    listWSData[index] = updateFn(_listWSData[index]);
  }

  void insertAtIndexInListWSData(int index, dynamic value) {
    listWSData.insert(index, value);
  }

  List<String> _FiatCF = [];
  List<String> get FiatCF => _FiatCF;
  set FiatCF(List<String> value) {
    _FiatCF = value;
  }

  void addToFiatCF(String value) {
    FiatCF.add(value);
  }

  void removeFromFiatCF(String value) {
    FiatCF.remove(value);
  }

  void removeAtIndexFromFiatCF(int index) {
    FiatCF.removeAt(index);
  }

  void updateFiatCFAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    FiatCF[index] = updateFn(_FiatCF[index]);
  }

  void insertAtIndexInFiatCF(int index, String value) {
    FiatCF.insert(index, value);
  }

  dynamic _allTickersApi = jsonDecode(
      '{\"BTC/USDT\":{\"symbol\":\"BTC/USDT\",\"bid\":67543.64,\"ask\":67543.65,\"close\":67543.65,\"last\":67543.65,\"change\":-1.242,\"baseVolume\":55894.05466,\"quoteVolume\":3782946312.951341}}');
  dynamic get allTickersApi => _allTickersApi;
  set allTickersApi(dynamic value) {
    _allTickersApi = value;
    prefs.setString('ff_allTickersApi', jsonEncode(value));
  }

  dynamic _singleTicker = jsonDecode('null');
  dynamic get singleTicker => _singleTicker;
  set singleTicker(dynamic value) {
    _singleTicker = value;
  }

  List<dynamic> _filterTicker = [
    jsonDecode(
        '{\"symbol\":\"BTC/USDT\",\"bid\":67876,\"ask\":67876.01,\"close\":67876.01,\"last\":67876.01,\"change\":-0.214,\"baseVolume\":55524.28292,\"quoteVolume\":3756722729.771315}'),
    jsonDecode(
        '{\"symbol\":\"ETH/USDT\",\"bid\":3529.68,\"ask\":3529.69,\"close\":3529.69,\"last\":3529.69,\"change\":-2.376,\"baseVolume\":567291.6013,\"quoteVolume\":2016219106.523125}'),
    jsonDecode(
        '{\"symbol\":\"BNB/USDT\",\"bid\":555.8,\"ask\":555.9,\"close\":555.9,\"last\":555.9,\"change\":-2.113,\"baseVolume\":2280318.574,\"quoteVolume\":1277691657.584}'),
    jsonDecode(
        '{\"symbol\":\"LTC/USDT\",\"bid\":87.08,\"ask\":87.09,\"close\":87.08,\"last\":87.08,\"change\":2.411,\"baseVolume\":997714.898,\"quoteVolume\":84130393.60012}')
  ];
  List<dynamic> get filterTicker => _filterTicker;
  set filterTicker(List<dynamic> value) {
    _filterTicker = value;
  }

  void addToFilterTicker(dynamic value) {
    filterTicker.add(value);
  }

  void removeFromFilterTicker(dynamic value) {
    filterTicker.remove(value);
  }

  void removeAtIndexFromFilterTicker(int index) {
    filterTicker.removeAt(index);
  }

  void updateFilterTickerAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    filterTicker[index] = updateFn(_filterTicker[index]);
  }

  void insertAtIndexInFilterTicker(int index, dynamic value) {
    filterTicker.insert(index, value);
  }

  List<dynamic> _Setting = [];
  List<dynamic> get Setting => _Setting;
  set Setting(List<dynamic> value) {
    _Setting = value;
  }

  void addToSetting(dynamic value) {
    Setting.add(value);
  }

  void removeFromSetting(dynamic value) {
    Setting.remove(value);
  }

  void removeAtIndexFromSetting(int index) {
    Setting.removeAt(index);
  }

  void updateSettingAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    Setting[index] = updateFn(_Setting[index]);
  }

  void insertAtIndexInSetting(int index, dynamic value) {
    Setting.insert(index, value);
  }

  String _kycStatus = '';
  String get kycStatus => _kycStatus;
  set kycStatus(String value) {
    _kycStatus = value;
  }

  List<dynamic> _bids = [];
  List<dynamic> get bids => _bids;
  set bids(List<dynamic> value) {
    _bids = value;
  }

  void addToBids(dynamic value) {
    bids.add(value);
  }

  void removeFromBids(dynamic value) {
    bids.remove(value);
  }

  void removeAtIndexFromBids(int index) {
    bids.removeAt(index);
  }

  void updateBidsAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    bids[index] = updateFn(_bids[index]);
  }

  void insertAtIndexInBids(int index, dynamic value) {
    bids.insert(index, value);
  }

  List<dynamic> _asks = [];
  List<dynamic> get asks => _asks;
  set asks(List<dynamic> value) {
    _asks = value;
  }

  void addToAsks(dynamic value) {
    asks.add(value);
  }

  void removeFromAsks(dynamic value) {
    asks.remove(value);
  }

  void removeAtIndexFromAsks(int index) {
    asks.removeAt(index);
  }

  void updateAsksAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    asks[index] = updateFn(_asks[index]);
  }

  void insertAtIndexInAsks(int index, dynamic value) {
    asks.insert(index, value);
  }

  bool _isOrderBookOpen = false;
  bool get isOrderBookOpen => _isOrderBookOpen;
  set isOrderBookOpen(bool value) {
    _isOrderBookOpen = value;
  }

  List<dynamic> _tradeBids = [];
  List<dynamic> get tradeBids => _tradeBids;
  set tradeBids(List<dynamic> value) {
    _tradeBids = value;
  }

  void addToTradeBids(dynamic value) {
    tradeBids.add(value);
  }

  void removeFromTradeBids(dynamic value) {
    tradeBids.remove(value);
  }

  void removeAtIndexFromTradeBids(int index) {
    tradeBids.removeAt(index);
  }

  void updateTradeBidsAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    tradeBids[index] = updateFn(_tradeBids[index]);
  }

  void insertAtIndexInTradeBids(int index, dynamic value) {
    tradeBids.insert(index, value);
  }

  List<dynamic> _tradeAsks = [];
  List<dynamic> get tradeAsks => _tradeAsks;
  set tradeAsks(List<dynamic> value) {
    _tradeAsks = value;
  }

  void addToTradeAsks(dynamic value) {
    tradeAsks.add(value);
  }

  void removeFromTradeAsks(dynamic value) {
    tradeAsks.remove(value);
  }

  void removeAtIndexFromTradeAsks(int index) {
    tradeAsks.removeAt(index);
  }

  void updateTradeAsksAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    tradeAsks[index] = updateFn(_tradeAsks[index]);
  }

  void insertAtIndexInTradeAsks(int index, dynamic value) {
    tradeAsks.insert(index, value);
  }

  List<dynamic> _allTickers = [];
  List<dynamic> get allTickers => _allTickers;
  set allTickers(List<dynamic> value) {
    _allTickers = value;
  }

  void addToAllTickers(dynamic value) {
    allTickers.add(value);
  }

  void removeFromAllTickers(dynamic value) {
    allTickers.remove(value);
  }

  void removeAtIndexFromAllTickers(int index) {
    allTickers.removeAt(index);
  }

  void updateAllTickersAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    allTickers[index] = updateFn(_allTickers[index]);
  }

  void insertAtIndexInAllTickers(int index, dynamic value) {
    allTickers.insert(index, value);
  }

  String _interval = '1h';
  String get interval => _interval;
  set interval(String value) {
    _interval = value;
  }

  DateTime? _lastCacheTime;
  DateTime? get lastCacheTime => _lastCacheTime;
  set lastCacheTime(DateTime? value) {
    _lastCacheTime = value;
  }

  bool _isCacheOverride = true;
  bool get isCacheOverride => _isCacheOverride;
  set isCacheOverride(bool value) {
    _isCacheOverride = value;
    prefs.setBool('ff_isCacheOverride', value);
  }

  dynamic _depthAsks;
  dynamic get depthAsks => _depthAsks;
  set depthAsks(dynamic value) {
    _depthAsks = value;
  }

  dynamic _depthBids;
  dynamic get depthBids => _depthBids;
  set depthBids(dynamic value) {
    _depthBids = value;
  }

  bool _darkModeSet = false;
  bool get darkModeSet => _darkModeSet;
  set darkModeSet(bool value) {
    _darkModeSet = value;
    prefs.setBool('ff_darkModeSet', value);
  }

  List<dynamic> _marketTrade = [];
  List<dynamic> get marketTrade => _marketTrade;
  set marketTrade(List<dynamic> value) {
    _marketTrade = value;
  }

  void addToMarketTrade(dynamic value) {
    marketTrade.add(value);
  }

  void removeFromMarketTrade(dynamic value) {
    marketTrade.remove(value);
  }

  void removeAtIndexFromMarketTrade(int index) {
    marketTrade.removeAt(index);
  }

  void updateMarketTradeAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    marketTrade[index] = updateFn(_marketTrade[index]);
  }

  void insertAtIndexInMarketTrade(int index, dynamic value) {
    marketTrade.insert(index, value);
  }

  List<dynamic> _marketOHLCV = [];
  List<dynamic> get marketOHLCV => _marketOHLCV;
  set marketOHLCV(List<dynamic> value) {
    _marketOHLCV = value;
  }

  void addToMarketOHLCV(dynamic value) {
    marketOHLCV.add(value);
  }

  void removeFromMarketOHLCV(dynamic value) {
    marketOHLCV.remove(value);
  }

  void removeAtIndexFromMarketOHLCV(int index) {
    marketOHLCV.removeAt(index);
  }

  void updateMarketOHLCVAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    marketOHLCV[index] = updateFn(_marketOHLCV[index]);
  }

  void insertAtIndexInMarketOHLCV(int index, dynamic value) {
    marketOHLCV.insert(index, value);
  }

  String _symbol = '';
  String get symbol => _symbol;
  set symbol(String value) {
    _symbol = value;
  }

  String _userID = '';
  String get userID => _userID;
  set userID(String value) {
    _userID = value;
    prefs.setString('ff_userID', value);
  }

  String _transactionStatus = '';
  String get transactionStatus => _transactionStatus;
  set transactionStatus(String value) {
    _transactionStatus = value;
  }

  dynamic _transactionResult;
  dynamic get transactionResult => _transactionResult;
  set transactionResult(dynamic value) {
    _transactionResult = value;
  }

  List<dynamic> _notifications = [];
  List<dynamic> get notifications => _notifications;
  set notifications(List<dynamic> value) {
    _notifications = value;
  }

  void addToNotifications(dynamic value) {
    notifications.add(value);
  }

  void removeFromNotifications(dynamic value) {
    notifications.remove(value);
  }

  void removeAtIndexFromNotifications(int index) {
    notifications.removeAt(index);
  }

  void updateNotificationsAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    notifications[index] = updateFn(_notifications[index]);
  }

  void insertAtIndexInNotifications(int index, dynamic value) {
    notifications.insert(index, value);
  }

  List<dynamic> _announcements = [];
  List<dynamic> get announcements => _announcements;
  set announcements(List<dynamic> value) {
    _announcements = value;
  }

  void addToAnnouncements(dynamic value) {
    announcements.add(value);
  }

  void removeFromAnnouncements(dynamic value) {
    announcements.remove(value);
  }

  void removeAtIndexFromAnnouncements(int index) {
    announcements.removeAt(index);
  }

  void updateAnnouncementsAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    announcements[index] = updateFn(_announcements[index]);
  }

  void insertAtIndexInAnnouncements(int index, dynamic value) {
    announcements.insert(index, value);
  }

  List<dynamic> _p2pChat = [];
  List<dynamic> get p2pChat => _p2pChat;
  set p2pChat(List<dynamic> value) {
    _p2pChat = value;
  }

  void addToP2pChat(dynamic value) {
    p2pChat.add(value);
  }

  void removeFromP2pChat(dynamic value) {
    p2pChat.remove(value);
  }

  void removeAtIndexFromP2pChat(int index) {
    p2pChat.removeAt(index);
  }

  void updateP2pChatAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    p2pChat[index] = updateFn(_p2pChat[index]);
  }

  void insertAtIndexInP2pChat(int index, dynamic value) {
    p2pChat.insert(index, value);
  }

  dynamic _p2pPayloadMessage;
  dynamic get p2pPayloadMessage => _p2pPayloadMessage;
  set p2pPayloadMessage(dynamic value) {
    _p2pPayloadMessage = value;
  }

  List<dynamic> _recentTrades = [];
  List<dynamic> get recentTrades => _recentTrades;
  set recentTrades(List<dynamic> value) {
    _recentTrades = value;
  }

  void addToRecentTrades(dynamic value) {
    recentTrades.add(value);
  }

  void removeFromRecentTrades(dynamic value) {
    recentTrades.remove(value);
  }

  void removeAtIndexFromRecentTrades(int index) {
    recentTrades.removeAt(index);
  }

  void updateRecentTradesAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    recentTrades[index] = updateFn(_recentTrades[index]);
  }

  void insertAtIndexInRecentTrades(int index, dynamic value) {
    recentTrades.insert(index, value);
  }

  bool _isTradeView = false;
  bool get isTradeView => _isTradeView;
  set isTradeView(bool value) {
    _isTradeView = value;
    prefs.setBool('ff_isTradeView', value);
  }

  Color _upCandle = const Color(0xff00d3c3);
  Color get upCandle => _upCandle;
  set upCandle(Color value) {
    _upCandle = value;
  }

  Color _downCandle = const Color(0xfff06a6a);
  Color get downCandle => _downCandle;
  set downCandle(Color value) {
    _downCandle = value;
  }

  dynamic _ohlcv;
  dynamic get ohlcv => _ohlcv;
  set ohlcv(dynamic value) {
    _ohlcv = value;
  }

  List<String> _extensions = [];
  List<String> get extensions => _extensions;
  set extensions(List<String> value) {
    _extensions = value;
  }

  void addToExtensions(String value) {
    extensions.add(value);
  }

  void removeFromExtensions(String value) {
    extensions.remove(value);
  }

  void removeAtIndexFromExtensions(int index) {
    extensions.removeAt(index);
  }

  void updateExtensionsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    extensions[index] = updateFn(_extensions[index]);
  }

  void insertAtIndexInExtensions(int index, String value) {
    extensions.insert(index, value);
  }

  final _authorsManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> authors({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _authorsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearAuthorsCache() => _authorsManager.clear();
  void clearAuthorsCacheKey(String? uniqueKey) =>
      _authorsManager.clearRequest(uniqueKey);

  final _postsManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> posts({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _postsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearPostsCache() => _postsManager.clear();
  void clearPostsCacheKey(String? uniqueKey) =>
      _postsManager.clearRequest(uniqueKey);

  final _categoriesManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> categories({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _categoriesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCategoriesCache() => _categoriesManager.clear();
  void clearCategoriesCacheKey(String? uniqueKey) =>
      _categoriesManager.clearRequest(uniqueKey);

  final _allMarketManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> allMarket({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _allMarketManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearAllMarketCache() => _allMarketManager.clear();
  void clearAllMarketCacheKey(String? uniqueKey) =>
      _allMarketManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

Color? _colorFromIntValue(int? val) {
  if (val == null) {
    return null;
  }
  return Color(val);
}
