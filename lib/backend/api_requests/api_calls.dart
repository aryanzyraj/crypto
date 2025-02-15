import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Authintication Group Code

class AuthinticationGroup {
  static String getBaseUrl({
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) =>
      '${FFAppConstants.Domain}/api/';
  static Map<String, String> headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'platform': 'app',
    'accessToken': '[accesstoken]',
    'csrfToken': '[csrftoken]',
    'sessionId': '[sessionid]',
  };
  static RegisterCall registerCall = RegisterCall();
  static LoginCall loginCall = LoginCall();
  static LogoutCall logoutCall = LogoutCall();
  static GetProfileCall getProfileCall = GetProfileCall();
  static ResetPasswordCall resetPasswordCall = ResetPasswordCall();
  static ProfileEditCall profileEditCall = ProfileEditCall();
  static ProfileEditSocialCall profileEditSocialCall = ProfileEditSocialCall();
  static ChangePasswordCall changePasswordCall = ChangePasswordCall();
  static PostProfilePhotoCall postProfilePhotoCall = PostProfilePhotoCall();
  static SendEmailVerificationCall sendEmailVerificationCall =
      SendEmailVerificationCall();
  static VerifyEmailTokenCall verifyEmailTokenCall = VerifyEmailTokenCall();
  static OTPGenerateCall oTPGenerateCall = OTPGenerateCall();
  static OTPVerifyCall oTPVerifyCall = OTPVerifyCall();
}

class RegisterCall {
  Future<ApiCallResponse> call({
    String? firstName = '',
    String? lastName = '',
    String? email = '',
    String? password = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = AuthinticationGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    final ffApiRequestBody = '''
{
  "firstName": "$firstName",
  "lastName": "$lastName",
  "email": "$email",
  "password": "$password"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Register',
      apiUrl: '${baseUrl}auth/register',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? errorMassage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error.message''',
      ));
  String? successMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class LoginCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = AuthinticationGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    final ffApiRequestBody = '''
{
  "email": "$email",
  "password": "$password"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Login',
      apiUrl: '${baseUrl}auth/login/flutter',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? massage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class LogoutCall {
  Future<ApiCallResponse> call({
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = AuthinticationGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Logout',
      apiUrl: '${baseUrl}auth/logout',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetProfileCall {
  Future<ApiCallResponse> call({
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = AuthinticationGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getProfile',
      apiUrl: '${baseUrl}user/profile',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? firstName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.lastName''',
      ));
  String? lastName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.firstName''',
      ));
  String? phone(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.phone''',
      ));
  String? avatar(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.avatar''',
      ));
  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.email''',
      ));
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
  String? role(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.role.name''',
      ));
  bool? emialVerificationStatus(dynamic response) =>
      castToType<bool>(getJsonField(
        response,
        r'''$.emailVerified''',
      ));
  String? authorStatus(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.author.status''',
      ));
  String? kycStatus(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.kyc.status''',
      ));
  int? kycLevel(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.kyc.level''',
      ));
  String? authorID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.author.id''',
      ));
}

class ResetPasswordCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = AuthinticationGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    final ffApiRequestBody = '''
{
  "email": "$email"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'resetPassword',
      apiUrl: '${baseUrl}auth/reset',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ProfileEditCall {
  Future<ApiCallResponse> call({
    String? address = '',
    String? city = '',
    String? country = '',
    String? zip = '',
    String? facebook = '',
    String? twitter = '',
    String? dribbble = '',
    String? instagram = '',
    String? github = '',
    String? gitlab = '',
    String? avatar = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = AuthinticationGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    final ffApiRequestBody = '''
{
  "avatar": "$avatar",
  "profile": {
    "location": {
      "address": "$address",
      "city": "$city",
      "country": "$country",
      "zip": "$zip"
    },
    "social": {
      "facebook": "$facebook",
      "twitter": "$facebook",
      "dribbble": "$dribbble",
      "instagram": "$instagram",
      "github": "$github",
      "gitlab": "$gitlab"
    }
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Profile Edit',
      apiUrl: '${baseUrl}user/profile',
      callType: ApiCallType.PUT,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ProfileEditSocialCall {
  Future<ApiCallResponse> call({
    String? address = '',
    String? city = '',
    String? country = '',
    String? zip = '',
    String? facebook = '',
    String? twitter = '',
    String? dribbble = '',
    String? instagram = '',
    String? github = '',
    String? gitlab = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = AuthinticationGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    final ffApiRequestBody = '''
{
  "profile": {
    "location": {
      "address": "$address",
      "city": "$city",
      "country": "$country",
      "zip": "$zip"
    },
    "social": {
      "facebook": "$facebook",
      "twitter": "$facebook",
      "dribbble": "$dribbble",
      "instagram": "$instagram",
      "github": "$github",
      "gitlab": "$gitlab"
    }
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Profile Edit Social',
      apiUrl: '${baseUrl}user/profile',
      callType: ApiCallType.PUT,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ChangePasswordCall {
  Future<ApiCallResponse> call({
    String? currentPassword = '',
    String? newPassword = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = AuthinticationGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    final ffApiRequestBody = '''
{
  "current_password": "$currentPassword",
  "new_password": "$newPassword"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Change Password',
      apiUrl: '${baseUrl}auth/profile',
      callType: ApiCallType.PUT,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic status(dynamic response) => getJsonField(
        response,
        r'''$[?(@.status == false)]''',
      );
  int? aaaa(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[?(@.status == 500)].status''',
      ));
}

class PostProfilePhotoCall {
  Future<ApiCallResponse> call({
    String? avatar = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = AuthinticationGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    final ffApiRequestBody = '''
{
  "avatar": "$avatar"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'postProfile photo',
      apiUrl: '${baseUrl}user/profile',
      callType: ApiCallType.PUT,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SendEmailVerificationCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = AuthinticationGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    final ffApiRequestBody = '''
{
  "email": "$email"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SendEmailVerification',
      apiUrl: '${baseUrl}auth/verify/email/send',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class VerifyEmailTokenCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = AuthinticationGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    final ffApiRequestBody = '''
{
  "token": "$token"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'VerifyEmailToken',
      apiUrl: '$baseUrl/auth/verify/email',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? massage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class OTPGenerateCall {
  Future<ApiCallResponse> call({
    String? type = '',
    String? phoneNumber = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = AuthinticationGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    final ffApiRequestBody = '''
{
  "type": "$type",
  "phoneNumber": "$phoneNumber"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'OTPGenerate',
      apiUrl: '${baseUrl}auth/otp/generate',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? secret(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.secret''',
      ));
  String? qrCode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.qrCode''',
      ));
}

class OTPVerifyCall {
  Future<ApiCallResponse> call({
    String? type = '',
    String? secret = '',
    String? otp = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = AuthinticationGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    const ffApiRequestBody = '''
{
  "otp": ,
  "secret": ,
  "type": 
}
''';
    return ApiManager.instance.makeApiCall(
      callName: 'OTPVerify',
      apiUrl: '${baseUrl}auth/otp/verify',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Authintication Group Code

/// Start Exchange Group Code

class ExchangeGroup {
  static String getBaseUrl({
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) =>
      '${FFAppConstants.Domain}/api/exchange';
  static Map<String, String> headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Platform': 'app',
    'accessToken': '[accesstoken]',
    'csrfToken': '[csrftoken]',
    'sessionId': '[sessionid]',
  };
  static CurrenciesCall currenciesCall = CurrenciesCall();
  static GetAllMarketsCall getAllMarketsCall = GetAllMarketsCall();
  static GrtAllTickersCall grtAllTickersCall = GrtAllTickersCall();
  static TickerCall tickerCall = TickerCall();
  static OrderBookPairCall orderBookPairCall = OrderBookPairCall();
  static HistoricalCall historicalCall = HistoricalCall();
  static GETOrdersCall gETOrdersCall = GETOrdersCall();
  static POSTordersCall pOSTordersCall = POSTordersCall();
  static CancelOrderCall cancelOrderCall = CancelOrderCall();
}

class CurrenciesCall {
  Future<ApiCallResponse> call({
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = ExchangeGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Currencies',
      apiUrl: '$baseUrl/currencies',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? dataResult(dynamic response) => getJsonField(
        response,
        r'''$.data[:]''',
        true,
      ) as List?;
  List<String>? currency(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].currency''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetAllMarketsCall {
  Future<ApiCallResponse> call({
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = ExchangeGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getAllMarkets',
      apiUrl: '$baseUrl/market',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {
        'eco': false,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? trending(dynamic response) => getJsonField(
        response,
        r'''$[?(@.isTrending == true)]''',
        true,
      ) as List?;
  List? hot(dynamic response) => getJsonField(
        response,
        r'''$[?(@.isHot == true)]''',
        true,
      ) as List?;
  List<String>? trendingSymbol(dynamic response) => (getJsonField(
        response,
        r'''$[?(@.isTrending == true)].currency''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? hotSymbol(dynamic response) => (getJsonField(
        response,
        r'''$[?(@.isHot == true)].currency''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? currency(dynamic response) => (getJsonField(
        response,
        r'''$[?(@.status == true)].currency''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<double>? takerFee(dynamic response) => (getJsonField(
        response,
        r'''$[:].metadata.taker''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<double>? makerFee(dynamic response) => (getJsonField(
        response,
        r'''$[:].metadata.maker''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List? dataList(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
  List<String>? pair(dynamic response) => (getJsonField(
        response,
        r'''$[?(@.status == true)].pair''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GrtAllTickersCall {
  Future<ApiCallResponse> call({
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = ExchangeGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'grtAllTickers',
      apiUrl: '$baseUrl/ticker',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic jasnData(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
  List<String>? symbolList(dynamic response) => (getJsonField(
        response,
        r'''$[*].symbol''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class TickerCall {
  Future<ApiCallResponse> call({
    String? symbol = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = ExchangeGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'ticker',
      apiUrl: '$baseUrl/ticker/$symbol',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {
        'symbol': symbol,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic tickerData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  String? symbol(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.symbol''',
      ));
  double? percentage(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.percentage''',
      ));
  double? lastPrice(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.last''',
      ));
}

class OrderBookPairCall {
  Future<ApiCallResponse> call({
    String? symbol = '',
    int? limit,
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = ExchangeGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'orderBookPair',
      apiUrl: '$baseUrl/markets/$symbol/orderbook?limit=$limit',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {
        'limit': limit,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? asks(dynamic response) => getJsonField(
        response,
        r'''$.data.asks''',
        true,
      ) as List?;
  List? bids(dynamic response) => getJsonField(
        response,
        r'''$.data.bids''',
        true,
      ) as List?;
  double? bestAsk(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.asks[0][0]''',
      ));
  double? bestBid(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.bids[0][0]''',
      ));
}

class HistoricalCall {
  Future<ApiCallResponse> call({
    String? symbol = '',
    String? interval = '',
    int? from,
    int? to,
    int? duration,
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = ExchangeGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Historical',
      apiUrl: '$baseUrl/chart',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {
        'symbol': symbol,
        'interval': interval,
        'from': from,
        'to': to,
        'duration': duration,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? data(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
}

class GETOrdersCall {
  Future<ApiCallResponse> call({
    String? currency = '',
    String? pair = '',
    String? type = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = ExchangeGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GETOrders',
      apiUrl: '$baseUrl/order',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {
        'currency': currency,
        'pair': pair,
        'type': type,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? openOrder(dynamic response) => getJsonField(
        response,
        r'''$.data[?(@.status=="OPEN")]''',
        true,
      ) as List?;
  List? orderrHistory(dynamic response) => getJsonField(
        response,
        r'''$.data[?(@.status!="OPEN")]''',
        true,
      ) as List?;
}

class POSTordersCall {
  Future<ApiCallResponse> call({
    String? currency = '',
    String? type = '',
    String? side = '',
    double? amount,
    double? price,
    String? pair = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = ExchangeGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    final ffApiRequestBody = '''
{
  "currency": "$currency",
  "pair": "$pair",
  "type": "$type",
  "side": "$side",
  "amount": $amount,
  "price": $price
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'POSTorders',
      apiUrl: '$baseUrl/order',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CancelOrderCall {
  Future<ApiCallResponse> call({
    String? uuid = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = ExchangeGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'cancelOrder',
      apiUrl: '$baseUrl/orders/$uuid',
      callType: ApiCallType.DELETE,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {
        'uuid': uuid,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Exchange Group Code

/// Start Ecommerce Group Code

class EcommerceGroup {
  static String getBaseUrl({
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) =>
      '${FFAppConstants.Domain}/api/ext/ecommerce';
  static Map<String, String> headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'platform': 'app',
    'accessToken': '[accesstoken]',
    'csrfToken': '[csrftoken]',
    'sessionId': '[sessionid]',
  };
  static GetCategoriesCall getCategoriesCall = GetCategoriesCall();
  static GetCategoryByNameCall getCategoryByNameCall = GetCategoryByNameCall();
  static WishlistCall wishlistCall = WishlistCall();
  static AddToWishlistCall addToWishlistCall = AddToWishlistCall();
  static DeleteFromWishlistCall deleteFromWishlistCall =
      DeleteFromWishlistCall();
  static DicountCall dicountCall = DicountCall();
  static OrdersCall ordersCall = OrdersCall();
  static OrderIdCall orderIdCall = OrderIdCall();
  static PostOrderCall postOrderCall = PostOrderCall();
  static ProducctByNameCall producctByNameCall = ProducctByNameCall();
  static POSTreviewsCall pOSTreviewsCall = POSTreviewsCall();
}

class GetCategoriesCall {
  Future<ApiCallResponse> call({
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = EcommerceGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getCategories',
      apiUrl: '$baseUrl/category',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? categoryName(dynamic response) => (getJsonField(
        response,
        r'''$[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? categoryId(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? categoryImage(dynamic response) => (getJsonField(
        response,
        r'''$[:].image''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? dataResult(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
}

class GetCategoryByNameCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = EcommerceGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getCategoryByName',
      apiUrl: '$baseUrl/category/$name',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {
        'name': name,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic dataresult(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
  List? productResult(dynamic response) => getJsonField(
        response,
        r'''$.ecommerceProducts[:]''',
        true,
      ) as List?;
  List<int>? rating(dynamic response) => (getJsonField(
        response,
        r'''$.ecommerceProducts[:].ecommerceReviews[:].rating''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List? products(dynamic response) => getJsonField(
        response,
        r'''$.ecommerceProducts''',
        true,
      ) as List?;
  bool? categoryStatus(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
  dynamic dataResult(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
}

class WishlistCall {
  Future<ApiCallResponse> call({
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = EcommerceGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'wishlist',
      apiUrl: '$baseUrl/wishlist',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? dataResult(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
  List? productResult(dynamic response) => getJsonField(
        response,
        r'''$[:].products''',
        true,
      ) as List?;
}

class AddToWishlistCall {
  Future<ApiCallResponse> call({
    String? productId = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = EcommerceGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    final ffApiRequestBody = '''
{
  "productId": "$productId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'addToWishlist',
      apiUrl: '$baseUrl/wishlist',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteFromWishlistCall {
  Future<ApiCallResponse> call({
    String? productId = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = EcommerceGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'deleteFromWishlist',
      apiUrl: '$baseUrl/wishlist/$productId',
      callType: ApiCallType.DELETE,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DicountCall {
  Future<ApiCallResponse> call({
    int? productId,
    String? code = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = EcommerceGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    final ffApiRequestBody = '''
{
  "code": "$code"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Dicount',
      apiUrl: '$baseUrl/discounts/$productId',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? percent(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.percentage''',
      ));
}

class OrdersCall {
  Future<ApiCallResponse> call({
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = EcommerceGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Orders',
      apiUrl: '$baseUrl/order',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? items(dynamic response) => getJsonField(
        response,
        r'''$.items''',
        true,
      ) as List?;
}

class OrderIdCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = EcommerceGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'OrderId',
      apiUrl: '$baseUrl/order/$id',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? productName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.products[:].name''',
      ));
  int? productPrice(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.products[:].price''',
      ));
  String? currency(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.products[:].currency''',
      ));
  String? type(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.products[:].type''',
      ));
  String? categoryName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.products[:].category.name''',
      ));
  String? shipOrderID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.shippingAddress.orderId''',
      ));
  String? shipName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.shippingAddress.name''',
      ));
  String? shipPhone(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.shippingAddress.phone''',
      ));
  String? shipStreet(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.shippingAddress.street''',
      ));
  String? shipCity(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.shippingAddress.city''',
      ));
  String? shipState(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.shippingAddress.state''',
      ));
  String? shipPostalCode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.shippingAddress.postalCode''',
      ));
  String? shipCountry(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.shippingAddress.country''',
      ));
  String? shipCreatedAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.shippingAddress.createdAt''',
      ));
  dynamic orderItem(dynamic response) => getJsonField(
        response,
        r'''$.products[:].ecommerceOrderItem''',
      );
  String? shipEmail(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.shippingAddress.email''',
      ));
  String? key(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.products[:].ecommerceOrderItem.key''',
      ));
  String? fIlePath(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.products[:].ecommerceOrderItem.filePath''',
      ));
  dynamic shippingAddress(dynamic response) => getJsonField(
        response,
        r'''$.shippingAddress''',
      );
}

class PostOrderCall {
  Future<ApiCallResponse> call({
    String? productId = '',
    String? discountId = '',
    int? amount,
    String? name = '',
    String? phone = '',
    String? street = '',
    String? city = '',
    String? state = '',
    String? postalCode = '',
    String? country = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = EcommerceGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    final ffApiRequestBody = '''
{
  "productId": "$productId",
  "discountId": "$discountId",
  "amount": $amount,
  "shippingAddress": {
    "name": "$name",
    "phone": "$phone",
    "street": "$street",
    "city": "$city",
    "state": "$state",
    "postalCode": "$postalCode",
    "country": "$country"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'PostOrder',
      apiUrl: '$baseUrl/order',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ProducctByNameCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = EcommerceGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'producctByName',
      apiUrl: '$baseUrl/product/$name',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {
        'name': name,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.name''',
      ));
  String? description(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.description''',
      ));
  int? price(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.price''',
      ));
  int? quantity(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.inventoryQuantity''',
      ));
  String? currency(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.currency''',
      ));
  String? walletType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.walletType''',
      ));
  List<int>? rating(dynamic response) => (getJsonField(
        response,
        r'''$.ecommerceReviews[:].rating''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  String? image(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.image''',
      ));
  List? reviews(dynamic response) => getJsonField(
        response,
        r'''$.ecommerceReviews''',
        true,
      ) as List?;
  dynamic dataResult(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
  String? type(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.type''',
      ));
  List? orders(dynamic response) => getJsonField(
        response,
        r'''$.orders''',
        true,
      ) as List?;
  String? productID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
}

class POSTreviewsCall {
  Future<ApiCallResponse> call({
    String? comment = '',
    int? rating,
    String? productId = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = EcommerceGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    final ffApiRequestBody = '''
{
  "comment": "$comment",
  "rating": $rating
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'POSTreviews',
      apiUrl: '$baseUrl/review/$productId',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Ecommerce Group Code

/// Start ICO Group Code

class IcoGroup {
  static String getBaseUrl({
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) =>
      '${FFAppConstants.Domain}/api/ext/ico';
  static Map<String, String> headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'platform': 'app',
    'accessToken': '[accesstoken]',
    'csrfToken': '[csrftoken]',
    'sessionId': '[sessionid]',
  };
  static IcoProjectCall icoProjectCall = IcoProjectCall();
  static IcoProjectIDCall icoProjectIDCall = IcoProjectIDCall();
  static IcoContributionsPOSTCall icoContributionsPOSTCall =
      IcoContributionsPOSTCall();
  static IcoContributionsGETCall icoContributionsGETCall =
      IcoContributionsGETCall();
  static IcoContributionsGETidCall icoContributionsGETidCall =
      IcoContributionsGETidCall();
  static IcoOfferCall icoOfferCall = IcoOfferCall();
}

class IcoProjectCall {
  Future<ApiCallResponse> call({
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = IcoGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'icoProject',
      apiUrl: '$baseUrl/project',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? activeData(dynamic response) => getJsonField(
        response,
        r'''$[?(@.status=='ACTIVE')]''',
        true,
      ) as List?;
}

class IcoProjectIDCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = IcoGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'icoProjectID',
      apiUrl: '$baseUrl/project/$id',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? tokens(dynamic response) => getJsonField(
        response,
        r'''$.tokens''',
        true,
      ) as List?;
  String? tokenId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.tokens[:].id''',
      ));
  String? tokenName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.tokens[:].name''',
      ));
  String? tokenChain(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.tokens[:].chain''',
      ));
  String? tokenCurrency(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.tokens[:].currency''',
      ));
  String? perchusCurrency(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.tokens[:].purchaseCurrency''',
      ));
  String? perchusWalletType(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.tokens[:].purchaseWalletType''',
      ));
  int? totalSupply(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.tokens[:].totalSupply''',
      ));
  String? description(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.tokens[:].description''',
      ));
  String? startDate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.tokens[:].phases[:].startDate''',
      ));
  String? endDate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.tokens[:].phases[:].endDate''',
      ));
}

class IcoContributionsPOSTCall {
  Future<ApiCallResponse> call({
    String? phaseId = '',
    int? amount,
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = IcoGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    final ffApiRequestBody = '''
{
  "phaseId": "$phaseId",
  "amount": $amount
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'icoContributionsPOST',
      apiUrl: '$baseUrl/contribution',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class IcoContributionsGETCall {
  Future<ApiCallResponse> call({
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = IcoGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'icoContributionsGET',
      apiUrl: '$baseUrl/contribution',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? items(dynamic response) => getJsonField(
        response,
        r'''$.items''',
        true,
      ) as List?;
}

class IcoContributionsGETidCall {
  Future<ApiCallResponse> call({
    int? id,
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = IcoGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'icoContributionsGETid',
      apiUrl: '$baseUrl/contributions/$id',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {
        'id': id,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class IcoOfferCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = IcoGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'icoOffer',
      apiUrl: '$baseUrl/offer/$id',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.name''',
      ));
  String? currency(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.currency''',
      ));
  String? description(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.description''',
      ));
  String? address(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.address''',
      ));
  String? projectdescription(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.project.description''',
      ));
  String? projectwebsite(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.project.website''',
      ));
  String? projectwhitepaper(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.project.whitepaper''',
      ));
  int? totalsupply(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalSupply''',
      ));
  int? phasesPrice(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.phases[:].price''',
      ));
  int? phasesminPurchase(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.phases[:].minPurchase''',
      ));
  int? phasesmaxPerchase(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.phases[:].maxPurchase''',
      ));
  String? phasesStartDate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.phases[:].startDate''',
      ));
  String? phasesEndDate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.phases[:].endDate''',
      ));
  String? phasesName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.phases[:].name''',
      ));
  int? saleAmount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.saleAmount''',
      ));
  double? pahsesContriputionsPercent(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.phases[:].contributionPercentage''',
      ));
  String? image(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.image''',
      ));
  String? chain(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.chain''',
      ));
  String? perchasecurrency(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.purchaseCurrency''',
      ));
  String? wallettype(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.purchaseWalletType''',
      ));
  String? phaseId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.phases[:].id''',
      ));
}

/// End ICO Group Code

/// Start Staking Pools Group Code

class StakingPoolsGroup {
  static String getBaseUrl({
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) =>
      '${FFAppConstants.Domain}/api/ext';
  static Map<String, String> headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'platform': 'app',
    'accessToken': '[accesstoken]',
    'csrfToken': '[csrftoken]',
    'sessionId': '[sessionid]',
  };
  static StakingPoolsCall stakingPoolsCall = StakingPoolsCall();
  static PostStackCall postStackCall = PostStackCall();
  static StakingPoolIDCall stakingPoolIDCall = StakingPoolIDCall();
  static GetMyStakingCall getMyStakingCall = GetMyStakingCall();
  static StakingLogIDCall stakingLogIDCall = StakingLogIDCall();
  static PostCollectStakingCall postCollectStakingCall =
      PostCollectStakingCall();
}

class StakingPoolsCall {
  Future<ApiCallResponse> call({
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = StakingPoolsGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'StakingPools',
      apiUrl: '$baseUrl/staking/pool',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? dataResult(dynamic response) => getJsonField(
        response,
        r'''$[:]''',
        true,
      ) as List?;
  List? durations(dynamic response) => getJsonField(
        response,
        r'''$[:].stakingDurations[:]''',
        true,
      ) as List?;
  List<int>? duration(dynamic response) => (getJsonField(
        response,
        r'''$[:].stakingDurations[:].duration''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  dynamic activeLog(dynamic response) => getJsonField(
        response,
        r'''$[:].stakingLogs[?(@.status=='ACTIVE')]''',
      );
}

class PostStackCall {
  Future<ApiCallResponse> call({
    String? poolId = '',
    int? amount,
    String? durationId = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = StakingPoolsGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    final ffApiRequestBody = '''
{
  "poolId": "$poolId",
  "amount": $amount,
  "durationId": "$durationId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'postStack',
      apiUrl: '$baseUrl/staking/log',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class StakingPoolIDCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = StakingPoolsGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'StakingPoolID',
      apiUrl: '$baseUrl/staking/pool/$id',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {
        'id': id,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic dataResult(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  List? durations(dynamic response) => getJsonField(
        response,
        r'''$.data.durations[:]''',
        true,
      ) as List?;
}

class GetMyStakingCall {
  Future<ApiCallResponse> call({
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = StakingPoolsGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getMyStaking',
      apiUrl: '$baseUrl/staking/log',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? dataResult(dynamic response) => getJsonField(
        response,
        r'''$.items[:]''',
        true,
      ) as List?;
}

class StakingLogIDCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = StakingPoolsGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'StakingLogID',
      apiUrl: '$baseUrl/staking/log/$id',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? amount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.amount''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? poolName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.pool.name''',
      ));
  String? poolDescription(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.pool.description''',
      ));
  String? poolCurrency(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.pool.currency''',
      ));
  String? poolType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.pool.type''',
      ));
  int? poolMinStake(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.pool.minStake''',
      ));
  int? poolMaxStake(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.pool.maxStake''',
      ));
  String? poolStatus(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.pool.status''',
      ));
  String? poolIcon(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.pool.icon''',
      ));
}

class PostCollectStakingCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = StakingPoolsGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'PostCollectStaking',
      apiUrl: '$baseUrl/staking/log/$id',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Staking Pools Group Code

/// Start Support Group Code

class SupportGroup {
  static String getBaseUrl({
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) =>
      '${FFAppConstants.Domain}/api/user/support';
  static Map<String, String> headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'platform': 'app',
    'accessToken': '[accesstoken]',
    'csrfToken': '[csrftoken]',
    'sessionId': '[sessionid]',
  };
  static SupportTicketsCall supportTicketsCall = SupportTicketsCall();
  static PostTicketCall postTicketCall = PostTicketCall();
  static PostChatCall postChatCall = PostChatCall();
  static CloseTicketCall closeTicketCall = CloseTicketCall();
  static SupportTicketIDCall supportTicketIDCall = SupportTicketIDCall();
}

class SupportTicketsCall {
  Future<ApiCallResponse> call({
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = SupportGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'supportTickets',
      apiUrl: '$baseUrl/ticket',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? items(dynamic response) => getJsonField(
        response,
        r'''$.items''',
        true,
      ) as List?;
}

class PostTicketCall {
  Future<ApiCallResponse> call({
    String? importance = '',
    String? message = '',
    String? subject = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = SupportGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    final ffApiRequestBody = '''
{
  "subject": "$subject",
  "importance": "$importance",
  "message": "$message"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'postTicket',
      apiUrl: '$baseUrl/ticket',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PostChatCall {
  Future<ApiCallResponse> call({
    String? text = '',
    String? time = '',
    String? userId = '',
    String? attachments = '',
    String? id = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = SupportGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    final ffApiRequestBody = '''
{
  "type": "client",
  "time": "$time",
  "userId": "$userId",
  "text": "$text",
  "attachment": "$attachments"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'postChat',
      apiUrl: '$baseUrl/ticket/$id',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CloseTicketCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = SupportGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'closeTicket',
      apiUrl: '$baseUrl/ticket/$id/close',
      callType: ApiCallType.PUT,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SupportTicketIDCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = SupportGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'supportTicketID',
      apiUrl: '$baseUrl/ticket/$id',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {
        'id': id,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? messages(dynamic response) => getJsonField(
        response,
        r'''$.messages''',
        true,
      ) as List?;
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
  String? userid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.userId''',
      ));
  String? agentid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.agentId''',
      ));
  String? importance(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.importance''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? updatedAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.updatedAt''',
      ));
  String? agaentAvatar(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.agent.avatar''',
      ));
  String? agentFN(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.agent.firstName''',
      ));
  String? agentLN(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.agent.lastName''',
      ));
}

/// End Support Group Code

/// Start Blog Group Code

class BlogGroup {
  static String getBaseUrl({
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) =>
      '${FFAppConstants.Domain}/api/content';
  static Map<String, String> headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'platform': 'app',
    'accessToken': '[accesstoken]',
    'csrfToken': '[csrftoken]',
    'sessionId': '[sessionid]',
  };
  static BlogPostAuthorsCall blogPostAuthorsCall = BlogPostAuthorsCall();
  static BlogpostsCall blogpostsCall = BlogpostsCall();
  static BlogPOSTpostsCall blogPOSTpostsCall = BlogPOSTpostsCall();
  static BlogGETpostIDCall blogGETpostIDCall = BlogGETpostIDCall();
  static BlogUPDATEpostsCall blogUPDATEpostsCall = BlogUPDATEpostsCall();
  static BlogGETcategoriesCall blogGETcategoriesCall = BlogGETcategoriesCall();
  static BlogGETcategoriesIDCall blogGETcategoriesIDCall =
      BlogGETcategoriesIDCall();
  static BlogGETtagsCall blogGETtagsCall = BlogGETtagsCall();
  static BlogGETtagsIDCall blogGETtagsIDCall = BlogGETtagsIDCall();
  static BlogGETAuthorsCall blogGETAuthorsCall = BlogGETAuthorsCall();
  static SlidersCall slidersCall = SlidersCall();
}

class BlogPostAuthorsCall {
  Future<ApiCallResponse> call({
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = BlogGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'blogPostAuthors',
      apiUrl: '$baseUrl/authors',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class BlogpostsCall {
  Future<ApiCallResponse> call({
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = BlogGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'blogposts',
      apiUrl: '$baseUrl/post',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? postsResult(dynamic response) => getJsonField(
        response,
        r'''$.items[?(@.status == 'PUBLISHED')]''',
        true,
      ) as List?;
}

class BlogPOSTpostsCall {
  Future<ApiCallResponse> call({
    String? title = '',
    String? category = '',
    String? content = '',
    String? status = '',
    String? image = '',
    List<String>? tagsList,
    String? description = '',
    String? authorId = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = BlogGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );
    final tags = _serializeList(tagsList);

    final ffApiRequestBody = '''
{
  "title": "$title",
  "categoryId": "$category",
  "description": "$description",
  "content": "$content",
  "status": "$status",
  "image": "$image",
  "tags": $tags
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'blogPOSTposts',
      apiUrl: '$baseUrl/author/$authorId',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class BlogGETpostIDCall {
  Future<ApiCallResponse> call({
    String? slug = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = BlogGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'blogGETpostID',
      apiUrl: '$baseUrl/post/$slug',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? tags(dynamic response) => (getJsonField(
        response,
        r'''$.tags[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class BlogUPDATEpostsCall {
  Future<ApiCallResponse> call({
    String? slug = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = BlogGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'blogUPDATEposts',
      apiUrl: '$baseUrl/posts/$slug',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {
        'slug': slug,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class BlogGETcategoriesCall {
  Future<ApiCallResponse> call({
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = BlogGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'blogGETcategories',
      apiUrl: '$baseUrl/category',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? categoryDataResult(dynamic response) => getJsonField(
        response,
        r'''$[:]''',
        true,
      ) as List?;
  List<String>? categoryname(dynamic response) => (getJsonField(
        response,
        r'''$[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class BlogGETcategoriesIDCall {
  Future<ApiCallResponse> call({
    int? id,
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = BlogGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'blogGETcategoriesID',
      apiUrl: '$baseUrl/categories/$id',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {
        'id': id,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class BlogGETtagsCall {
  Future<ApiCallResponse> call({
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = BlogGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'blogGETtags',
      apiUrl: '$baseUrl/tag',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? tageName(dynamic response) => (getJsonField(
        response,
        r'''$[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class BlogGETtagsIDCall {
  Future<ApiCallResponse> call({
    String? slug = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = BlogGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'blogGETtagsID',
      apiUrl: '$baseUrl/tags/$slug',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {
        'slug': slug,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class BlogGETAuthorsCall {
  Future<ApiCallResponse> call({
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = BlogGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'blogGETAuthors',
      apiUrl: '$baseUrl/author',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? dataResult(dynamic response) => getJsonField(
        response,
        r'''$[?(@.status == "APPROVED")]''',
        true,
      ) as List?;
}

class SlidersCall {
  Future<ApiCallResponse> call({
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = BlogGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Sliders',
      apiUrl: '$baseUrl/slider',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? image(dynamic response) => (getJsonField(
        response,
        r'''$[:].image''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? link(dynamic response) => (getJsonField(
        response,
        r'''$[:].link''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? sliders(dynamic response) => getJsonField(
        response,
        r'''$[:]''',
        true,
      ) as List?;
}

/// End Blog Group Code

/// Start PeerToPeer Group Code

class PeerToPeerGroup {
  static String getBaseUrl({
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) =>
      '${FFAppConstants.Domain}/api/ext/p2p';
  static Map<String, String> headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'platform': 'app',
    'accessToken': '[accesstoken]',
    'csrfToken': '[csrftoken]',
    'sessionId': '[sessionid]',
  };
  static GEToffersCall gEToffersCall = GEToffersCall();
  static GETofferIDCall gETofferIDCall = GETofferIDCall();
  static GETmyOffersCall gETmyOffersCall = GETmyOffersCall();
  static PUTofferStatusCall pUTofferStatusCall = PUTofferStatusCall();
  static GETpaymentMethodesCall gETpaymentMethodesCall =
      GETpaymentMethodesCall();
  static POSTofferCall pOSTofferCall = POSTofferCall();
  static GETtradesCall gETtradesCall = GETtradesCall();
  static GETshowOfferCall gETshowOfferCall = GETshowOfferCall();
  static PUTeditOfferCall pUTeditOfferCall = PUTeditOfferCall();
  static POSTcreatePaymentMethodeCall pOSTcreatePaymentMethodeCall =
      POSTcreatePaymentMethodeCall();
  static PUTEditPaymentMethodeCall pUTEditPaymentMethodeCall =
      PUTEditPaymentMethodeCall();
  static GETPaymentMethodIDCall gETPaymentMethodIDCall =
      GETPaymentMethodIDCall();
  static DELETEpaymentMehodeCall dELETEpaymentMehodeCall =
      DELETEpaymentMehodeCall();
  static POSTtradeCall pOSTtradeCall = POSTtradeCall();
  static GETtradeIDCall gETtradeIDCall = GETtradeIDCall();
  static POSTchatCall pOSTchatCall = POSTchatCall();
  static POSTCancelTradeCall pOSTCancelTradeCall = POSTCancelTradeCall();
  static POSTTransactionCall pOSTTransactionCall = POSTTransactionCall();
  static DisputCall disputCall = DisputCall();
  static CancelDisputeCall cancelDisputeCall = CancelDisputeCall();
  static ReleaseCall releaseCall = ReleaseCall();
  static ReviewCall reviewCall = ReviewCall();
  static ManageStructureCall manageStructureCall = ManageStructureCall();
  static OfferDepositCall offerDepositCall = OfferDepositCall();
  static OfferWithdrawCall offerWithdrawCall = OfferWithdrawCall();
  static EDiTPMStatusCall eDiTPMStatusCall = EDiTPMStatusCall();
}

class GEToffersCall {
  Future<ApiCallResponse> call({
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = PeerToPeerGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GEToffers',
      apiUrl: '$baseUrl/offer',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? dataResult(dynamic response) => getJsonField(
        response,
        r'''$.items[:]''',
        true,
      ) as List?;
  List<int>? rating(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].p2pReviews[:].rating''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class GETofferIDCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = PeerToPeerGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GETofferID',
      apiUrl: '$baseUrl/offer/$id',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic dataResult(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
  String? uuid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
  String? firstName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.firstName''',
      ));
  String? lastName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..user.lastName''',
      ));
  String? userAvatar(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.avatar''',
      ));
  String? purchaseCurrency(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.paymentMethod.currency''',
      ));
  List? listJasonReview(dynamic response) => getJsonField(
        response,
        r'''$.reviews[:]''',
        true,
      ) as List?;
  String? currency(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.currency''',
      ));
  int? availabeamount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.amount''',
      ));
  int? max(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.maxAmount''',
      ));
  int? min(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.minAmount''',
      ));
  int? price(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.price''',
      ));
  String? instructions(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.paymentMethod.instructions''',
      ));
  List<int>? listRating(dynamic response) => (getJsonField(
        response,
        r'''$.reviews[:].rating''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class GETmyOffersCall {
  Future<ApiCallResponse> call({
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = PeerToPeerGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GETmyOffers',
      apiUrl: '$baseUrl/offer/manage',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? dataResult(dynamic response) => getJsonField(
        response,
        r'''$.items[:]''',
        true,
      ) as List?;
}

class PUTofferStatusCall {
  Future<ApiCallResponse> call({
    String? uuid = '',
    String? status = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = PeerToPeerGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    final ffApiRequestBody = '''
{
  "uuid": "$uuid",
  "status": "$status"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'PUTofferStatus',
      apiUrl: '$baseUrl/offer/$uuid',
      callType: ApiCallType.PUT,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GETpaymentMethodesCall {
  Future<ApiCallResponse> call({
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = PeerToPeerGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GETpaymentMethodes',
      apiUrl: '$baseUrl/payment/method',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? items(dynamic response) => getJsonField(
        response,
        r'''$.items[:]''',
        true,
      ) as List?;
}

class POSTofferCall {
  Future<ApiCallResponse> call({
    int? amount,
    String? chain = '',
    String? currency = '',
    int? maxAmount,
    int? minAmount,
    String? paymentMethodId = '',
    int? price,
    String? walletType = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = PeerToPeerGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    final ffApiRequestBody = '''
{
  "walletType": "$walletType",
  "currency": "$currency",
  "chain": "$chain",
  "amount": $amount,
  "price": $price,
  "paymentMethodId": "$paymentMethodId",
  "minAmount": $minAmount,
  "maxAmount": $maxAmount
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'POSToffer',
      apiUrl: '$baseUrl/offer/manage',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GETtradesCall {
  Future<ApiCallResponse> call({
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = PeerToPeerGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GETtrades',
      apiUrl: '$baseUrl/trade',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? dataResult(dynamic response) => getJsonField(
        response,
        r'''$.items[:]''',
        true,
      ) as List?;
}

class GETshowOfferCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = PeerToPeerGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GETshowOffer',
      apiUrl: '$baseUrl/offer/$id',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? amount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.amount''',
      ));
  int? minAmount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.minAmount''',
      ));
  int? maxAmount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.maxAmount''',
      ));
  String? pMname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.paymentMethod.name''',
      ));
  int? price(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.price''',
      ));
}

class PUTeditOfferCall {
  Future<ApiCallResponse> call({
    String? id = '',
    int? minAmount,
    int? maxAmount,
    int? price,
    int? amount,
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = PeerToPeerGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    final ffApiRequestBody = '''
{
  "amount": $amount,
  "minAmount": $minAmount,
  "maxAmount": $maxAmount,
  "price": $price,
  "status": "PENDING"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'PUTeditOffer',
      apiUrl: '$baseUrl/offer/manage/$id',
      callType: ApiCallType.PUT,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class POSTcreatePaymentMethodeCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? currency = '',
    String? image = '',
    String? instructions = '',
    String? chain = '',
    String? status = '',
    String? walletType = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = PeerToPeerGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    final ffApiRequestBody = '''
{
  "name": "$name",
  "instructions": "$instructions",
  "currency": "$currency",
  "image": "$image",
  "chain": "$chain",
  "status": "$status",
  "walleytType": "$walletType"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'POSTcreatePaymentMethode',
      apiUrl: '$baseUrl/payment/method',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PUTEditPaymentMethodeCall {
  Future<ApiCallResponse> call({
    String? image = '',
    String? instructions = '',
    String? id = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = PeerToPeerGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    final ffApiRequestBody = '''
{
  "instructions": "$instructions",
  "image": "$image"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'PUTEditPaymentMethode',
      apiUrl: '$baseUrl/payment/method/$id',
      callType: ApiCallType.PUT,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GETPaymentMethodIDCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = PeerToPeerGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GETPaymentMethodID',
      apiUrl: '$baseUrl/payment/method/$id',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic dataResult(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.name''',
      ));
  String? instructions(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.instructions''',
      ));
  String? currency(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.currency''',
      ));
  String? image(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.image''',
      ));
}

class DELETEpaymentMehodeCall {
  Future<ApiCallResponse> call({
    int? id,
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = PeerToPeerGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'DELETEpaymentMehode',
      apiUrl: '$baseUrl/payment-methods/$id',
      callType: ApiCallType.DELETE,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {
        'id': id,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class POSTtradeCall {
  Future<ApiCallResponse> call({
    String? offerId = '',
    int? amount,
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = PeerToPeerGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    final ffApiRequestBody = '''
{
  "offerId": "$offerId",
  "amount": $amount
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'POSTtrade',
      apiUrl: '$baseUrl/trade',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GETtradeIDCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = PeerToPeerGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GETtradeID',
      apiUrl: '$baseUrl/trade/$id',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic dataResult(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
  List? messagesSeller(dynamic response) => getJsonField(
        response,
        r'''$.messages[?(@.type=='seller')]''',
        true,
      ) as List?;
  List? messagesBuyer(dynamic response) => getJsonField(
        response,
        r'''$.messages[?(@.type=='buyer')]''',
        true,
      ) as List?;
  String? userID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.userId''',
      ));
  String? sellerID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.sellerId''',
      ));
  String? tradeID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
  String? offerID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.offer.id''',
      ));
  int? ammount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.amount''',
      ));
  String? paidAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.createdAt''',
      ));
  String? paymentMethod(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.offer.paymentMethod.name''',
      ));
  String? currency(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.offer.currency''',
      ));
  String? sellerFN(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.seller.firstName''',
      ));
  String? sellerLN(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.seller.lastName''',
      ));
  String? sellerAvatar(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.seller.avatar''',
      ));
  String? userFN(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.firstName''',
      ));
  String? userLN(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.lastName''',
      ));
  String? userAvatar(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.avatar''',
      ));
  List<int>? rates(dynamic response) => (getJsonField(
        response,
        r'''$.offer.p2pReviews[:].rating''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List? messagesList(dynamic response) => getJsonField(
        response,
        r'''$.messages[*]''',
        true,
      ) as List?;
  List<String>? sllerImageSend(dynamic response) => (getJsonField(
        response,
        r'''$.messages[?(@.type=='seller')].attachments[:].image''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? test(dynamic response) => (getJsonField(
        response,
        r'''$.messages[?(@.type == 'buyer')].text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? disputeReason(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.p2pDisputes[:].reason''',
      ));
  String? disputeStatus(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.p2pDisputes[:].status''',
      ));
  String? disputeResolutin(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.p2pDisputes[:].resolution''',
      ));
  String? reviewer(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.offer.p2pReviews[:].reviewer.id''',
      ));
  String? desputeID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.p2pDisputes[:].raisedBy.id''',
      ));
  String? instructions(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.offer.paymentMethod.instructions''',
      ));
}

class POSTchatCall {
  Future<ApiCallResponse> call({
    String? image = '',
    int? sellerId,
    int? userId,
    String? text = '',
    String? time = '',
    String? type = '',
    String? uuid = '',
    bool? isSeller,
    dynamic attachmentsJson,
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = PeerToPeerGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    final attachments = _serializeJson(attachmentsJson);
    final ffApiRequestBody = '''
{
  "isSeller": $isSeller,
  "message": {
    "seller_id": $sellerId,
    "user_id": $userId,
    "text": "$text",
    "time": "$time",
    "type": "$type",
    "attachments": [$attachments]
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'POSTchat',
      apiUrl: '$baseUrl/trade/$uuid/chat',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class POSTCancelTradeCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = PeerToPeerGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'POSTCancelTrade',
      apiUrl: '$baseUrl/trade/$id/cancel',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class POSTTransactionCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? txHash = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = PeerToPeerGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    final ffApiRequestBody = '''
{
  "txHash": "$txHash"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'POSTTransaction',
      apiUrl: '$baseUrl/trade/$id/status',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DisputCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? reason = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = PeerToPeerGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    final ffApiRequestBody = '''
{
  "reason": "$reason"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'disput',
      apiUrl: '$baseUrl/trade/$id/dispute',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CancelDisputeCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = PeerToPeerGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'cancelDispute',
      apiUrl: '$baseUrl/api/ext/p2p/trade/$id/dispute/cancel',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ReleaseCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = PeerToPeerGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'release',
      apiUrl: '$baseUrl/trade/$id/release',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ReviewCall {
  Future<ApiCallResponse> call({
    String? id = '',
    int? rating,
    String? comment = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = PeerToPeerGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    final ffApiRequestBody = '''
{
  "rating": $rating,
  "comment": "$comment"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'review',
      apiUrl: '$baseUrl/offer/$id/review',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ManageStructureCall {
  Future<ApiCallResponse> call({
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = PeerToPeerGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'manageStructure',
      apiUrl: '$baseUrl/offer/manage/structure',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? paymentMethodes(dynamic response) => (getJsonField(
        response,
        r'''$.edit[:][:].options[:].label''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class OfferDepositCall {
  Future<ApiCallResponse> call({
    String? id = '',
    int? amount,
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = PeerToPeerGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    final ffApiRequestBody = '''
{
  "amount": $amount
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'OfferDeposit',
      apiUrl: '$baseUrl/offer/manage/$id/deposit',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class OfferWithdrawCall {
  Future<ApiCallResponse> call({
    String? id = '',
    int? amount,
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = PeerToPeerGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    final ffApiRequestBody = '''
{
  "amount": $amount
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'OfferWithdraw',
      apiUrl: '$baseUrl/offer/manage/$id/withdraw',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EDiTPMStatusCall {
  Future<ApiCallResponse> call({
    String? id = '',
    bool? status,
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = PeerToPeerGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    final ffApiRequestBody = '''
{
  "status": $status
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'EDiTPMStatus',
      apiUrl: '$baseUrl/payment/method/$id/status',
      callType: ApiCallType.PUT,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End PeerToPeer Group Code

/// Start ADMIN Group Code

class AdminGroup {
  static String getBaseUrl({
    String? accesstoken = '',
    String? csrftoken = '',
    String? refreshtoken = '',
    String? sessionid = '',
  }) =>
      '${FFAppConstants.Domain}/api/admin';
  static Map<String, String> headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'client-platform': 'app',
    'access-token': '[accesstoken]',
    'csrf-token': '[csrftoken]',
    'refresh-token': '[refreshtoken]',
    'session-id': '[sessionid]',
  };
  static AdminEcoFetchAllTokensCall adminEcoFetchAllTokensCall =
      AdminEcoFetchAllTokensCall();
  static AdminForexCurrencyCall adminForexCurrencyCall =
      AdminForexCurrencyCall();
  static AdminSettingExtensionsCall adminSettingExtensionsCall =
      AdminSettingExtensionsCall();
}

class AdminEcoFetchAllTokensCall {
  Future<ApiCallResponse> call({
    String? accesstoken = '',
    String? csrftoken = '',
    String? refreshtoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = AdminGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      refreshtoken: refreshtoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'adminEcoFetchAllTokens',
      apiUrl: '$baseUrl/ecosystem/tokens/fetch/all',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'client-platform': 'app',
        'access-token': '$accesstoken',
        'csrf-token': '$csrftoken',
        'refresh-token': '$refreshtoken',
        'session-id': '$sessionid',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? dataResult(dynamic response) => getJsonField(
        response,
        r'''$.data[:]''',
        true,
      ) as List?;
  List<String>? currency(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].currency''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class AdminForexCurrencyCall {
  Future<ApiCallResponse> call({
    String? accesstoken = '',
    String? csrftoken = '',
    String? refreshtoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = AdminGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      refreshtoken: refreshtoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'adminForexCurrency',
      apiUrl: '$baseUrl/forex/currencies',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'client-platform': 'app',
        'access-token': '$accesstoken',
        'csrf-token': '$csrftoken',
        'refresh-token': '$refreshtoken',
        'session-id': '$sessionid',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? currency(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].currency''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class AdminSettingExtensionsCall {
  Future<ApiCallResponse> call({
    String? accesstoken = '',
    String? csrftoken = '',
    String? refreshtoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = AdminGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      refreshtoken: refreshtoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'adminSettingExtensions',
      apiUrl: '$baseUrl/system/extensions',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'client-platform': 'app',
        'access-token': '$accesstoken',
        'csrf-token': '$csrftoken',
        'refresh-token': '$refreshtoken',
        'session-id': '$sessionid',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? aiTrading(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.data[?(@.name=='ai_trading')].status''',
      ));
  bool? forex(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.data[?(@.name=='forex')].status''',
      ));
  bool? ecommerce(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.data[?(@.name=='ecommerce')].status''',
      ));
  bool? ico(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.data[?(@.name=='ico')].status''',
      ));
  bool? staking(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.data[?(@.name=='staking')].status''',
      ));
  bool? knowladgebase(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.data[?(@.name=='knowledge_base')].status''',
      ));
  bool? mailwizard(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.data[?(@.name=='mailwizard')].status''',
      ));
  bool? mlm(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.data[?(@.name=='mlm')].status''',
      ));
  bool? ecosystem(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.data[?(@.name=='ecosystem')].status''',
      ));
  bool? walletconnect(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.data[?(@.name=='wallet_connect')].status''',
      ));
  bool? p2p(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.data[?(@.name=='p2p')].status''',
      ));
  bool? swap(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.data[?(@.name=='swap')].status''',
      ));
}

/// End ADMIN Group Code

/// Start Forex Group Code

class ForexGroup {
  static String getBaseUrl({
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) =>
      '${FFAppConstants.Domain}/api/ext/forex';
  static Map<String, String> headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'platform': 'app',
    'accessToken': '[accesstoken]',
    'csrfToken': '[csrftoken]',
    'sessionId': '[sessionid]',
  };
  static GETaccountCall gETaccountCall = GETaccountCall();
  static GETaccountIDCall gETaccountIDCall = GETaccountIDCall();
  static GETactiveInvestmentCall gETactiveInvestmentCall =
      GETactiveInvestmentCall();
  static GetPlansCall getPlansCall = GetPlansCall();
  static POSTcreatinvestmentsCall pOSTcreatinvestmentsCall =
      POSTcreatinvestmentsCall();
  static CANCELplanCall cANCELplanCall = CANCELplanCall();
  static GETforexInvestmentCall gETforexInvestmentCall =
      GETforexInvestmentCall();
  static ForexDepositCall forexDepositCall = ForexDepositCall();
  static ForexwithdrawCall forexwithdrawCall = ForexwithdrawCall();
  static GETPlanIDCall gETPlanIDCall = GETPlanIDCall();
  static GETForxTransactiosnCall gETForxTransactiosnCall =
      GETForxTransactiosnCall();
}

class GETaccountCall {
  Future<ApiCallResponse> call({
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = ForexGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GETaccount',
      apiUrl: '$baseUrl/account',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? demoStatus(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.DEMO.status''',
      ));
  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
  String? liveAccountID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.LIVE.accountId''',
      ));
}

class GETaccountIDCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = ForexGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GETaccountID',
      apiUrl: '$baseUrl/account/$id',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {
        'id': id,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GETactiveInvestmentCall {
  Future<ApiCallResponse> call({
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = ForexGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GETactiveInvestment',
      apiUrl: '$baseUrl/investment/active',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? amount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].amount''',
      ));
  int? profit(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].profit''',
      ));
  String? result(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].result''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].status''',
      ));
  String? title(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].plan.title''',
      ));
  int? profitPercent(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].plan.profitPercentage''',
      ));
  String? image(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].plan.image''',
      ));
  String? createdat(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].createdAt''',
      ));
  String? endat(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].endDate''',
      ));
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].id''',
      ));
  List? data(dynamic response) => getJsonField(
        response,
        r'''$[:]''',
        true,
      ) as List?;
}

class GetPlansCall {
  Future<ApiCallResponse> call({
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = ForexGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GetPlans',
      apiUrl: '$baseUrl/investment/plan',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? dataList(dynamic response) => getJsonField(
        response,
        r'''$[:]''',
        true,
      ) as List?;
}

class POSTcreatinvestmentsCall {
  Future<ApiCallResponse> call({
    String? accountId = '',
    String? planId = '',
    String? durationId = '',
    int? amount,
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = ForexGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    final ffApiRequestBody = '''
{
  "accountId": "$accountId",
  "planId": "$planId",
  "durationId": "$durationId",
  "amount": $amount
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'POSTcreatinvestments',
      apiUrl: '$baseUrl/investment',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CANCELplanCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = ForexGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'CANCELplan',
      apiUrl: '$baseUrl/investments/$id/cancel',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GETforexInvestmentCall {
  Future<ApiCallResponse> call({
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = ForexGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GETforexInvestment',
      apiUrl: '$baseUrl/investment',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? dataList(dynamic response) => getJsonField(
        response,
        r'''$[:]''',
        true,
      ) as List?;
}

class ForexDepositCall {
  Future<ApiCallResponse> call({
    String? id = '',
    int? amount,
    String? chain = '',
    String? currency = '',
    String? type = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = ForexGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    final ffApiRequestBody = '''
{
  "type": "$type",
  "currency": "$currency",
  "chain": "$chain",
  "amount": $amount
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'forexDeposit',
      apiUrl: '$baseUrl/account/$id/deposit',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ForexwithdrawCall {
  Future<ApiCallResponse> call({
    String? id = '',
    int? amount,
    String? chain = '',
    String? currency = '',
    String? type = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = ForexGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    final ffApiRequestBody = '''
{
  "type": "$type",
  "currency": "$currency",
  "chain": "$chain",
  "amount": $amount
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'forexwithdraw',
      apiUrl: '$baseUrl/account/$id/withdraw',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GETPlanIDCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = ForexGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GETPlanID',
      apiUrl: '$baseUrl/investment/plan/$id',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? title(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.title''',
      ));
  String? description(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.description''',
      ));
  String? image(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.image''',
      ));
  int? minAmount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.minAmount''',
      ));
  int? maxamount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.maxAmount''',
      ));
  int? profitPercent(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.profitPercentage''',
      ));
  String? currency(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.currency''',
      ));
  String? wallettype(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.walletType''',
      ));
  List? durations(dynamic response) => getJsonField(
        response,
        r'''$.durations''',
        true,
      ) as List?;
  List<String>? durationsID(dynamic response) => (getJsonField(
        response,
        r'''$.durations[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GETForxTransactiosnCall {
  Future<ApiCallResponse> call({
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = ForexGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GETForxTransactiosn',
      apiUrl: '$baseUrl/transaction',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? pending(dynamic response) => getJsonField(
        response,
        r'''$.items[?(@.status=="PENDING")]''',
        true,
      ) as List?;
  List? all(dynamic response) => getJsonField(
        response,
        r'''$.items[:]''',
        true,
      ) as List?;
}

/// End Forex Group Code

/// Start KYC Group Code

class KycGroup {
  static String getBaseUrl({
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) =>
      '${FFAppConstants.Domain}/api';
  static Map<String, String> headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'platform': 'app',
    'accessToken': '[accesstoken]',
    'csrfToken': '[csrftoken]',
    'sessionId': '[sessionid]',
  };
  static GETkycTemplateCall gETkycTemplateCall = GETkycTemplateCall();
  static POSTkycCall pOSTkycCall = POSTkycCall();
}

class GETkycTemplateCall {
  Future<ApiCallResponse> call({
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = KycGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GETkycTemplate',
      apiUrl: '$baseUrl/user/kyc/template',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
}

class POSTkycCall {
  Future<ApiCallResponse> call({
    dynamic bodyJson,
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = KycGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    final body = _serializeJson(bodyJson);
    final ffApiRequestBody = body;
    return ApiManager.instance.makeApiCall(
      callName: 'POSTkyc',
      apiUrl: '$baseUrl/user/kyc/application',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End KYC Group Code

/// Start Investmrnt Group Code

class InvestmrntGroup {
  static String getBaseUrl({
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) =>
      '${FFAppConstants.Domain}/api/finance';
  static Map<String, String> headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'platform': 'app',
    'accessToken': '[accesstoken]',
    'csrfToken': '[csrftoken]',
    'sessionId': '[sessionid]',
  };
  static GETinvestmentplansCall gETinvestmentplansCall =
      GETinvestmentplansCall();
  static GETinvestmentCall gETinvestmentCall = GETinvestmentCall();
  static POSTinvestmentCall pOSTinvestmentCall = POSTinvestmentCall();
  static GETuserInvestmentCall gETuserInvestmentCall = GETuserInvestmentCall();
  static InvestmentCancelCall investmentCancelCall = InvestmentCancelCall();
  static SingleInvestmentPlanCall singleInvestmentPlanCall =
      SingleInvestmentPlanCall();
  static DeleteInvestmentCall deleteInvestmentCall = DeleteInvestmentCall();
}

class GETinvestmentplansCall {
  Future<ApiCallResponse> call({
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = InvestmrntGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GETinvestmentplans',
      apiUrl: '$baseUrl/investment/plan',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? dataPlans(dynamic response) => getJsonField(
        response,
        r'''$[:]''',
        true,
      ) as List?;
}

class GETinvestmentCall {
  Future<ApiCallResponse> call({
    String? type = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = InvestmrntGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GETinvestment',
      apiUrl: '$baseUrl/investment',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {
        'type': type,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? amount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.amount''',
      ));
  int? profit(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.profit''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? enddate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.endDate''',
      ));
  dynamic duartionjson(dynamic response) => getJsonField(
        response,
        r'''$.duration''',
      );
  int? duartion(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.duration.duration''',
      ));
  String? durationtimeframe(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.duration.timeframe''',
      ));
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
  String? planid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.planId''',
      ));
  String? createdAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.createdAt''',
      ));
}

class POSTinvestmentCall {
  Future<ApiCallResponse> call({
    int? amount,
    String? planID = '',
    String? durationID = '',
    String? type = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = InvestmrntGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    final ffApiRequestBody = '''
{
  "type": "$type",
  "planId": "$planID",
  "amount": $amount,
  "durationId": "$durationID"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'POSTinvestment',
      apiUrl: '$baseUrl/investment',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GETuserInvestmentCall {
  Future<ApiCallResponse> call({
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = InvestmrntGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GETuserInvestment',
      apiUrl: '$baseUrl/investment/user',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? title(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.plan.title''',
      ));
  String? currency(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.plan.currency''',
      ));
  int? amount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.amount''',
      ));
  String? createdat(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.createdAt''',
      ));
  double? roi(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.profit''',
      ));
  String? planId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.planId''',
      ));
  String? endDate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.endDate''',
      ));
  String? image(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.plan.image''',
      ));
  String? description(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.plan.description''',
      ));
  int? minAmount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.plan.minAmount''',
      ));
  int? maxAmount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.plan.maxAmount''',
      ));
  int? profitPercent(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.plan.profitPercentage''',
      ));
}

class InvestmentCancelCall {
  Future<ApiCallResponse> call({
    String? uuid = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = InvestmrntGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'investmentCancel',
      apiUrl: '$baseUrl/investment/$uuid/cancel',
      callType: ApiCallType.PUT,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SingleInvestmentPlanCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = InvestmrntGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'singleInvestmentPlan ',
      apiUrl: '$baseUrl/investment/plan/$id',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {
        'id': id,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteInvestmentCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? type = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = InvestmrntGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'deleteInvestment',
      apiUrl: '$baseUrl/investment/$id',
      callType: ApiCallType.DELETE,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {
        'type': type,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Investmrnt Group Code

/// Start faq Group Code

class FaqGroup {
  static String getBaseUrl({
    String? accesstoken = '',
    String? csrftoken = '',
    String? refreshtoken = '',
    String? sessionid = '',
  }) =>
      '${FFAppConstants.Domain}/api/faq';
  static Map<String, String> headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'client-platform': 'app',
    'access-token': '[accesstoken]',
    'csrf-token': '[csrftoken]',
    'refresh-token': '[refreshtoken]',
    'session-id': '[sessionid]',
  };
  static FaqCall faqCall = FaqCall();
}

class FaqCall {
  Future<ApiCallResponse> call({
    String? accesstoken = '',
    String? csrftoken = '',
    String? refreshtoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = FaqGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      refreshtoken: refreshtoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'faq',
      apiUrl: '$baseUrl/entries',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'client-platform': 'app',
        'access-token': '$accesstoken',
        'csrf-token': '$csrftoken',
        'refresh-token': '$refreshtoken',
        'session-id': '$sessionid',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End faq Group Code

/// Start TFA Group Code

class TfaGroup {
  static String getBaseUrl({
    String? accesstoken = '',
    String? csrftoken = '',
    String? refreshtoken = '',
    String? sessionid = '',
  }) =>
      '${FFAppConstants.Domain}/api/profile';
  static Map<String, String> headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'client-platform': 'app',
    'access-token': '[accesstoken]',
    'csrf-token': '[csrftoken]',
    'refresh-token': '[refreshtoken]',
    'session-id': '[sessionid]',
  };
  static POSTgenerateOTPSecretCall pOSTgenerateOTPSecretCall =
      POSTgenerateOTPSecretCall();
  static VerifyOTPCall verifyOTPCall = VerifyOTPCall();
}

class POSTgenerateOTPSecretCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? phoneNumber = '',
    String? type = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? refreshtoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = TfaGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      refreshtoken: refreshtoken,
      sessionid: sessionid,
    );

    final ffApiRequestBody = '''
{
  "type": "$type",
  "email": "$email",
  "phoneNumber": "$phoneNumber"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'POSTgenerateOTPSecret',
      apiUrl: '$baseUrl/generateOTPSecret',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'client-platform': 'app',
        'access-token': '$accesstoken',
        'csrf-token': '$csrftoken',
        'refresh-token': '$refreshtoken',
        'session-id': '$sessionid',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class VerifyOTPCall {
  Future<ApiCallResponse> call({
    String? secret = '',
    String? otp = '',
    String? type = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? refreshtoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = TfaGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      refreshtoken: refreshtoken,
      sessionid: sessionid,
    );

    final ffApiRequestBody = '''
{
  "otp": "$otp",
  "secret": "$secret",
  "type": "$type"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'verifyOTP',
      apiUrl: '$baseUrl/verifyOTP',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'client-platform': 'app',
        'access-token': '$accesstoken',
        'csrf-token': '$csrftoken',
        'refresh-token': '$refreshtoken',
        'session-id': '$sessionid',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End TFA Group Code

/// Start Stripe Group Code

class StripeGroup {
  static String getBaseUrl({
    String? accesstoken = '',
    String? csrftoken = '',
    String? refreshtoken = '',
    String? sessionid = '',
  }) =>
      '${FFAppConstants.Domain}/api/';
  static Map<String, String> headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'client-platform': 'app',
    'access-token': '[accesstoken]',
    'csrf-token': '[csrftoken]',
    'refresh-token': '[refreshtoken]',
    'session-id': '[sessionid]',
  };
  static StripeCall stripeCall = StripeCall();
}

class StripeCall {
  Future<ApiCallResponse> call({
    int? amount,
    String? currency = '',
    double? taxAmount,
    bool? intent = true,
    String? accesstoken = '',
    String? csrftoken = '',
    String? refreshtoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = StripeGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      refreshtoken: refreshtoken,
      sessionid: sessionid,
    );

    final ffApiRequestBody = '''
{
  "amount": $amount,
  "currency": "$currency",
  "taxAmount": $taxAmount,
  "intent": $intent
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'stripe',
      apiUrl: '$baseUrl/ipn/stripe',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'client-platform': 'app',
        'access-token': '$accesstoken',
        'csrf-token': '$csrftoken',
        'refresh-token': '$refreshtoken',
        'session-id': '$sessionid',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? stripeUrl(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.url''',
      ));
  String? clientSecret(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.clientSecret''',
      ));
}

/// End Stripe Group Code

/// Start Setting Group Code

class SettingGroup {
  static String getBaseUrl({
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) =>
      '${FFAppConstants.Domain}/api/';
  static Map<String, String> headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Platform': 'app',
    'accessToken': '[accesstoken]',
    'csrfToken': '[csrftoken]',
    'sessionId': '[sessionid]',
  };
  static SettingsCall settingsCall = SettingsCall();
  static SettingExtensionsCall settingExtensionsCall = SettingExtensionsCall();
}

class SettingsCall {
  Future<ApiCallResponse> call({
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = SettingGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Settings',
      apiUrl: '${baseUrl}settings',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? settings(dynamic response) => getJsonField(
        response,
        r'''$.settings[:]''',
        true,
      ) as List?;
  List<String>? extensions(dynamic response) => (getJsonField(
        response,
        r'''$.extensions''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class SettingExtensionsCall {
  Future<ApiCallResponse> call({
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = SettingGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'settingExtensions',
      apiUrl: '${baseUrl}settings/extensions',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? forex(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.data.forex''',
      ));
  bool? ecommerce(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.data.ecommerce''',
      ));
  bool? ico(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.data.ico''',
      ));
  bool? staking(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.data.staking''',
      ));
  bool? p2p(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.data.p2p''',
      ));
  bool? mlm(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.data.mlm''',
      ));
}

/// End Setting Group Code

/// Start Wallet Group Code

class WalletGroup {
  static String getBaseUrl({
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) =>
      '${FFAppConstants.Domain}/api/finance';
  static Map<String, String> headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Platform': 'app',
    'accessToken': '[accesstoken]',
    'csrfToken': '[csrftoken]',
    'sessionId': '[sessionid]',
  };
  static GetAllUserwalletsWIthPnlCall getAllUserwalletsWIthPnlCall =
      GetAllUserwalletsWIthPnlCall();
  static GetAllUserwalletsCall getAllUserwalletsCall = GetAllUserwalletsCall();
  static TransactionsCall transactionsCall = TransactionsCall();
  static GetWalletCurrenciesCall getWalletCurrenciesCall =
      GetWalletCurrenciesCall();
  static GetWalletSingleCurrencyCall getWalletSingleCurrencyCall =
      GetWalletSingleCurrencyCall();
  static GetWalletDetailCall getWalletDetailCall = GetWalletDetailCall();
  static GetPairBalanceCall getPairBalanceCall = GetPairBalanceCall();
  static FiatDepositCall fiatDepositCall = FiatDepositCall();
  static FiatWithdrawCall fiatWithdrawCall = FiatWithdrawCall();
  static SPOTWithdrawCall sPOTWithdrawCall = SPOTWithdrawCall();
  static GetSpotChainCall getSpotChainCall = GetSpotChainCall();
  static SpotDeopsitCall spotDeopsitCall = SpotDeopsitCall();
  static WalletTransferCall walletTransferCall = WalletTransferCall();
  static DepositStripeCall depositStripeCall = DepositStripeCall();
  static DepositPaypalCall depositPaypalCall = DepositPaypalCall();
}

class GetAllUserwalletsWIthPnlCall {
  Future<ApiCallResponse> call({
    bool? pnl = false,
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = WalletGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GetAllUserwalletsWIthPnl',
      apiUrl: '$baseUrl/wallet',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {
        'pnl': pnl,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? chart(dynamic response) => getJsonField(
        response,
        r'''$.chart''',
        true,
      ) as List?;
}

class GetAllUserwalletsCall {
  Future<ApiCallResponse> call({
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = WalletGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GetAllUserwallets',
      apiUrl: '$baseUrl/wallet',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? items(dynamic response) => getJsonField(
        response,
        r'''$.items[:]''',
        true,
      ) as List?;
}

class TransactionsCall {
  Future<ApiCallResponse> call({
    String? walletType = '',
    String? currency = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = WalletGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'transactions',
      apiUrl: '$baseUrl/transaction',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {
        'walletType': walletType,
        'currency': currency,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? items(dynamic response) => getJsonField(
        response,
        r'''$.items[:]''',
        true,
      ) as List?;
}

class GetWalletCurrenciesCall {
  Future<ApiCallResponse> call({
    String? action = '',
    String? walletType = '',
    String? targetWalletType = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = WalletGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GetWalletCurrencies',
      apiUrl: '$baseUrl/currency',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {
        'action': action,
        'walletType': walletType,
        'targetWalletType': targetWalletType,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? labelList(dynamic response) => (getJsonField(
        response,
        r'''$[:].label''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? fromLabel(dynamic response) => (getJsonField(
        response,
        r'''$.from[:].label''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? toLabel(dynamic response) => (getJsonField(
        response,
        r'''$.to[:].label''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? valueList(dynamic response) => (getJsonField(
        response,
        r'''$[:].value''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? frmValue(dynamic response) => (getJsonField(
        response,
        r'''$.from[:].value''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? toValue(dynamic response) => (getJsonField(
        response,
        r'''$.to[:].value''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetWalletSingleCurrencyCall {
  Future<ApiCallResponse> call({
    String? type = '',
    String? code = '',
    String? action = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = WalletGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GetWalletSingleCurrency',
      apiUrl: '$baseUrl/currency/$type/$code',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {
        'action': action,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? customFields(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.methods[:].customFields''',
      ));
  List? methods(dynamic response) => getJsonField(
        response,
        r'''$.methods[:]''',
        true,
      ) as List?;
  List? data(dynamic response) => getJsonField(
        response,
        r'''$[:]''',
        true,
      ) as List?;
  List<String>? chain(dynamic response) => (getJsonField(
        response,
        r'''$[:].chain''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? gatways(dynamic response) => getJsonField(
        response,
        r'''$.gateways[:]''',
        true,
      ) as List?;
}

class GetWalletDetailCall {
  Future<ApiCallResponse> call({
    String? type = '',
    String? currency = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = WalletGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GetWalletDetail',
      apiUrl: '$baseUrl/wallet/$type/$currency',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic adresses(dynamic response) => getJsonField(
        response,
        r'''$.address''',
      );
  double? balance(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.balance''',
      ));
  String? currency(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.currency''',
      ));
}

class GetPairBalanceCall {
  Future<ApiCallResponse> call({
    String? type = '',
    String? currency = '',
    String? pair = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = WalletGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getPairBalance',
      apiUrl: '$baseUrl/wallet/symbol',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {
        'type': type,
        'currency': currency,
        'pair': pair,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class FiatDepositCall {
  Future<ApiCallResponse> call({
    int? amount,
    String? currency = '',
    dynamic customFieldsJson,
    String? methodId = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = WalletGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    final customFields = _serializeJson(customFieldsJson);
    final ffApiRequestBody = '''
{
  "methodId": "$methodId",
  "amount": $amount,
  "currency": "$currency",
  "customFields": $customFields
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'fiatDeposit',
      apiUrl: '$baseUrl/deposit/fiat',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class FiatWithdrawCall {
  Future<ApiCallResponse> call({
    int? amount,
    String? currency = '',
    dynamic customFieldsJson,
    String? methodId = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = WalletGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    final customFields = _serializeJson(customFieldsJson);
    final ffApiRequestBody = '''
{
  "methodId": "$methodId",
  "amount": $amount,
  "currency": "$currency",
  "customFields": $customFields
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'fiatWithdraw',
      apiUrl: '$baseUrl/withdraw/fiat',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SPOTWithdrawCall {
  Future<ApiCallResponse> call({
    int? amount,
    String? currency = '',
    String? chain = '',
    String? toAddress = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = WalletGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    final ffApiRequestBody = '''
{
  "currency": "$currency",
  "chain": "$chain",
  "amount": $amount,
  "toAddress": "$toAddress"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SPOTWithdraw',
      apiUrl: '$baseUrl/withdraw/SPOT',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetSpotChainCall {
  Future<ApiCallResponse> call({
    String? type = '',
    String? code = '',
    String? method = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = WalletGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GetSpotChain',
      apiUrl: '$baseUrl/currency/$type/$code/$method',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? currency(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.currency''',
      ));
  String? address(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.address''',
      ));
  String? network(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.network''',
      ));
  String? coin(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info.coin''',
      ));
  String? url(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.info.url''',
      ));
}

class SpotDeopsitCall {
  Future<ApiCallResponse> call({
    String? chain = '',
    String? currency = '',
    String? trx = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = WalletGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    final ffApiRequestBody = '''
{
  "currency": "$currency",
  "chain": "$chain",
  "trx": "$trx"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'spotDeopsit',
      apiUrl: '$baseUrl/deposit/spot',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class WalletTransferCall {
  Future<ApiCallResponse> call({
    String? fromType = '',
    String? toType = '',
    String? fromCurrency = '',
    String? toCurrency = '',
    int? amount,
    String? transferType = '',
    String? currency = '',
    String? clientId = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = WalletGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    final ffApiRequestBody = '''
{
  "fromType": "$fromType",
  "toType": "$toType",
  "fromCurrency": "$fromCurrency",
  "toCurrency": "$toCurrency",
  "currency": "$currency",
  "clientId": "$clientId",
  "amount": $amount,
  "transferType": "$transferType"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'walletTransfer',
      apiUrl: '$baseUrl/transfer',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DepositStripeCall {
  Future<ApiCallResponse> call({
    int? amount,
    String? currency = '',
    bool? intent,
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = WalletGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    final ffApiRequestBody = '''
{
  "amount": $amount,
  "currency": "$currency",
  "intent": $intent
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'depositStripe',
      apiUrl: '$baseUrl/deposit/fiat/stripe',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? secret(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.clientSecret''',
      ));
}

class DepositPaypalCall {
  Future<ApiCallResponse> call({
    int? amount,
    String? currency = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = WalletGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    final ffApiRequestBody = '''
{
  "amount": $amount,
  "currency": "$currency"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'depositPaypal',
      apiUrl: '$baseUrl/deposit/fiat/paypal',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? secret(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.clientSecret''',
      ));
}

/// End Wallet Group Code

/// Start Currency Group Code

class CurrencyGroup {
  static String getBaseUrl({
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) =>
      '${FFAppConstants.Domain}/api/finance';
  static Map<String, String> headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Platform': 'app',
    'accessToken': '[accesstoken]',
    'csrfToken': '[csrftoken]',
    'sessionId': '[sessionid]',
  };
  static AllCurrenciesCall allCurrenciesCall = AllCurrenciesCall();
}

class AllCurrenciesCall {
  Future<ApiCallResponse> call({
    String? walletType = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = CurrencyGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'AllCurrencies',
      apiUrl: '$baseUrl/currency',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {
        'walletType': walletType,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Currency Group Code

/// Start AI investment Group Code

class AIInvestmentGroup {
  static String getBaseUrl({
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) =>
      '${FFAppConstants.Domain}/api/ext/ai/investment';
  static Map<String, String> headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Platform': 'app',
    'accessToken': '[accesstoken]',
    'csrfToken': '[csrftoken]',
    'sessionId': '[sessionid]',
  };
  static GetPalnsCall getPalnsCall = GetPalnsCall();
  static PostPlanCall postPlanCall = PostPlanCall();
  static GetLogCall getLogCall = GetLogCall();
}

class GetPalnsCall {
  Future<ApiCallResponse> call({
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = AIInvestmentGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getPalns',
      apiUrl: '$baseUrl/plan',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? list(dynamic response) => getJsonField(
        response,
        r'''$[:]''',
        true,
      ) as List?;
  List<String>? idList(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? titleList(dynamic response) => (getJsonField(
        response,
        r'''$[:].title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class PostPlanCall {
  Future<ApiCallResponse> call({
    String? currency = '',
    String? pair = '',
    String? planId = '',
    String? durationId = '',
    double? amount,
    String? type = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = AIInvestmentGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    final ffApiRequestBody = '''
{
  "currency": "$currency",
  "pair": "$pair",
  "planId": "$planId",
  "durationId": "$durationId",
  "amount": $amount,
  "type": "$type"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'postPlan',
      apiUrl: '$baseUrl/log',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetLogCall {
  Future<ApiCallResponse> call({
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = AIInvestmentGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getLog',
      apiUrl: '$baseUrl/log',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic list(dynamic response) => getJsonField(
        response,
        r'''$[:]''',
      );
}

/// End AI investment Group Code

/// Start ECOSystem Group Code

class ECOSystemGroup {
  static String getBaseUrl({
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) =>
      '${FFAppConstants.Domain}/api/ext/ecosystem';
  static Map<String, String> headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Platform': 'app',
    'accessToken': '[accesstoken]',
    'csrfToken': '[csrftoken]',
    'sessionId': '[sessionid]',
  };
  static GetDepositAddressCall getDepositAddressCall = GetDepositAddressCall();
  static WithdrawCall withdrawCall = WithdrawCall();
}

class GetDepositAddressCall {
  Future<ApiCallResponse> call({
    String? currency = '',
    String? contractType = '',
    String? chain = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = ECOSystemGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getDepositAddress',
      apiUrl: '$baseUrl/wallet/$currency',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {
        'contractType': contractType,
        'chain': chain,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? currency(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.currency''',
      ));
  String? type(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.type''',
      ));
  String? adrress(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.address''',
      ));
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
  int? balance(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.balance''',
      ));
}

class WithdrawCall {
  Future<ApiCallResponse> call({
    String? currency = '',
    String? chain = '',
    int? amount,
    String? toAddress = '',
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = ECOSystemGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    final ffApiRequestBody = '''
{
  "currency": "$currency",
  "chain": "$chain",
  "amount": $amount,
  "toAddress": "$toAddress"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'withdraw',
      apiUrl: '$baseUrl/withdraw',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End ECOSystem Group Code

/// Start MLM Group Code

class MlmGroup {
  static String getBaseUrl({
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) =>
      '${FFAppConstants.Domain}/api/ext/affiliate';
  static Map<String, String> headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Platform': 'app',
    'accessToken': '[accesstoken]',
    'csrfToken': '[csrftoken]',
    'sessionId': '[sessionid]',
  };
  static ReferralsCall referralsCall = ReferralsCall();
  static ConditionCall conditionCall = ConditionCall();
  static NodeCall nodeCall = NodeCall();
}

class ReferralsCall {
  Future<ApiCallResponse> call({
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = MlmGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Referrals',
      apiUrl: '$baseUrl/referral',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? list(dynamic response) => getJsonField(
        response,
        r'''$.items[:]''',
        true,
      ) as List?;
}

class ConditionCall {
  Future<ApiCallResponse> call({
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = MlmGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'condition',
      apiUrl: '$baseUrl/condition',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? list(dynamic response) => getJsonField(
        response,
        r'''$[:]''',
        true,
      ) as List?;
}

class NodeCall {
  Future<ApiCallResponse> call({
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = MlmGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'node',
      apiUrl: '$baseUrl/referral/node',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
}

/// End MLM Group Code

/// Start FUTURES Group Code

class FuturesGroup {
  static String getBaseUrl({
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) =>
      '${FFAppConstants.Domain}/api/ext/futures';
  static Map<String, String> headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Platform': 'app',
    'accessToken': '[accesstoken]',
    'csrfToken': '[csrftoken]',
    'sessionId': '[sessionid]',
  };
  static MarketsCall marketsCall = MarketsCall();
}

class MarketsCall {
  Future<ApiCallResponse> call({
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) async {
    final baseUrl = FuturesGroup.getBaseUrl(
      accesstoken: accesstoken,
      csrftoken: csrftoken,
      sessionid: sessionid,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'markets',
      apiUrl: '$baseUrl/market',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Platform': 'app',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic list(dynamic response) => getJsonField(
        response,
        r'''$[:]''',
      );
}

/// End FUTURES Group Code

/// Start Wallet Copy Copy Group Code

class WalletCopyCopyGroup {
  static String getBaseUrl({
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
  }) =>
      '${FFAppConstants.Domain}/api/finance';
  static Map<String, String> headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Platform': 'app',
    'accessToken': '[accesstoken]',
    'csrfToken': '[csrftoken]',
    'sessionId': '[sessionid]',
  };
}

/// End Wallet Copy Copy Group Code

/// Start OpenAI ChatGPT Group Code

class OpenAIChatGPTGroup {
  static String getBaseUrl() => 'https://api.openai.com/v1';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static SendFullPromptCall sendFullPromptCall = SendFullPromptCall();
}

class SendFullPromptCall {
  Future<ApiCallResponse> call({
    String? apiKey = '',
    dynamic promptJson,
  }) async {
    final baseUrl = OpenAIChatGPTGroup.getBaseUrl();

    final prompt = _serializeJson(promptJson);
    final ffApiRequestBody = '''
{
  "model": "gpt-4",
  "messages": $prompt
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Send Full Prompt',
      apiUrl: '$baseUrl/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? createdTimestamp(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.created''',
      ));
  String? role(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.choices[:].message.role''',
      ));
  String? content(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.choices[:].message.content''',
      ));
}

/// End OpenAI ChatGPT Group Code

class NewsEnCall {
  static Future<ApiCallResponse> call({
    List<String>? categoriesList,
  }) async {
    final categories = _serializeList(categoriesList);

    return ApiManager.instance.makeApiCall(
      callName: 'newsEn',
      apiUrl: 'https://min-api.cryptocompare.com/data/v2/news/?lang=EN',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? data(dynamic response) => getJsonField(
        response,
        r'''$.Data''',
        true,
      ) as List?;
  static List<String>? image(dynamic response) => (getJsonField(
        response,
        r'''$.Data[:].imageurl''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? title(dynamic response) => (getJsonField(
        response,
        r'''$.Data[:].title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? publishon(dynamic response) => (getJsonField(
        response,
        r'''$.Data[:].published_on''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? body(dynamic response) => (getJsonField(
        response,
        r'''$.Data[:].body''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? authername(dynamic response) => (getJsonField(
        response,
        r'''$.Data[:].source_info.name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? autherImg(dynamic response) => (getJsonField(
        response,
        r'''$.Data[:].source_info.img''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? categories(dynamic response) => (getJsonField(
        response,
        r'''$.Data[:].categories''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetCurrenciesCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getCurrencies',
      apiUrl: '${FFAppConstants.Domain}/api/currencies',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? currencyResult(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  static List<String>? currencyCode(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].code''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? currencyName(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? currencySymple(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].symbol''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<double>? currencyPrice(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
}

class UploadCall {
  static Future<ApiCallResponse> call({
    String? accesstoken = '',
    String? csrftoken = '',
    String? sessionid = '',
    dynamic jsonJson,
  }) async {
    final json = _serializeJson(jsonJson);
    final ffApiRequestBody = json;
    return ApiManager.instance.makeApiCall(
      callName: 'UPLOAD',
      apiUrl: '${FFAppConstants.Domain}/api/upload',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'platform': 'app',
        'Accept': 'application/json',
        'accessToken': '$accesstoken',
        'csrfToken': '$csrftoken',
        'sessionId': '$sessionid',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
