import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '/backend/schema/structs/index.dart';

import '/auth/custom_auth/custom_auth_user_provider.dart';

import '/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BicryptoV3AuthUser? initialUser;
  BicryptoV3AuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BicryptoV3AuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => appStateNotifier.loggedIn
          ? const BicryptoHomePageWidget()
          : const LoginPageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? const BicryptoHomePageWidget()
              : const LoginPageWidget(),
        ),
        FFRoute(
          name: 'loginPage',
          path: '/loginPage',
          builder: (context, params) => const LoginPageWidget(),
        ),
        FFRoute(
          name: 'registerAccount',
          path: '/registerAccount',
          builder: (context, params) => const RegisterAccountWidget(),
        ),
        FFRoute(
          name: 'completeProfile',
          path: '/completeProfile',
          builder: (context, params) => const CompleteProfileWidget(),
        ),
        FFRoute(
          name: 'forgotPassword',
          path: '/forgotPassword',
          builder: (context, params) => const ForgotPasswordWidget(),
        ),
        FFRoute(
          name: 'onboarding',
          path: '/onboarding',
          builder: (context, params) => const OnboardingWidget(),
        ),
        FFRoute(
          name: 'createBudgetBegin',
          path: '/createBudgetBegin',
          builder: (context, params) => const CreateBudgetBeginWidget(),
        ),
        FFRoute(
          name: 'paymentDetails',
          path: '/paymentDetails',
          builder: (context, params) => const PaymentDetailsWidget(),
        ),
        FFRoute(
          name: 'MY_profilePage',
          path: '/mYProfilePage',
          builder: (context, params) => const MYProfilePageWidget(),
        ),
        FFRoute(
          name: 'budgetDetails',
          path: '/budgetDetails',
          builder: (context, params) => const BudgetDetailsWidget(),
        ),
        FFRoute(
          name: 'transferComplete',
          path: '/transferComplete',
          builder: (context, params) => const TransferCompleteWidget(),
        ),
        FFRoute(
          name: 'transferFunds',
          path: '/transferFunds',
          builder: (context, params) => const TransferFundsWidget(),
        ),
        FFRoute(
          name: 'requestFunds',
          path: '/requestFunds',
          builder: (context, params) => const RequestFundsWidget(),
        ),
        FFRoute(
          name: 'createBudget',
          path: '/createBudget',
          builder: (context, params) => const CreateBudgetWidget(),
        ),
        FFRoute(
          name: 'transaction_EDIT',
          path: '/transactionEDIT',
          builder: (context, params) => const TransactionEDITWidget(),
        ),
        FFRoute(
          name: 'editProfile',
          path: '/editProfile',
          builder: (context, params) => const EditProfileWidget(),
        ),
        FFRoute(
          name: 'changePassword',
          path: '/changePassword',
          builder: (context, params) => const ChangePasswordWidget(),
        ),
        FFRoute(
          name: 'notificationsSettings',
          path: '/notificationsSettings',
          builder: (context, params) => const NotificationsSettingsWidget(),
        ),
        FFRoute(
          name: 'privacyPolicy',
          path: '/privacyPolicy',
          builder: (context, params) => const PrivacyPolicyWidget(),
        ),
        FFRoute(
          name: 'tutorial_PROFILE',
          path: '/tutorialPROFILE',
          builder: (context, params) => const TutorialPROFILEWidget(),
        ),
        FFRoute(
          name: 'homePagegg',
          path: '/homePagegg',
          builder: (context, params) => const HomePageggWidget(),
        ),
        FFRoute(
          name: 'homePage_alt',
          path: '/homePageAlt',
          builder: (context, params) => const HomePageAltWidget(),
        ),
        FFRoute(
          name: 'budget_DELETE',
          path: '/budgetDELETE',
          builder: (context, params) => const BudgetDELETEWidget(),
        ),
        FFRoute(
          name: 'news',
          path: '/news',
          builder: (context, params) => const NewsWidget(),
        ),
        FFRoute(
          name: 'webview',
          path: '/webview',
          builder: (context, params) => WebviewWidget(
            sourceNname: params.getParam(
              'sourceNname',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'transaction_ADDCopy',
          path: '/transactionADDCopy',
          builder: (context, params) => const TransactionADDCopyWidget(),
        ),
        FFRoute(
          name: 'exchangeAllTickers',
          path: '/exchangeAllTickers',
          builder: (context, params) => const ExchangeAllTickersWidget(),
        ),
        FFRoute(
          name: 'eCommerceIndex',
          path: '/eCommerceIndex',
          builder: (context, params) => const ECommerceIndexWidget(),
        ),
        FFRoute(
          name: 'ecommerceProductDetail',
          path: '/ecommerceProductDetail',
          builder: (context, params) => EcommerceProductDetailWidget(
            name: params.getParam(
              'name',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'ecommerceWishlist',
          path: '/ecommerceWishlist',
          builder: (context, params) => const EcommerceWishlistWidget(),
        ),
        FFRoute(
          name: 'ecommerceOrderHistory',
          path: '/ecommerceOrderHistory',
          builder: (context, params) => const EcommerceOrderHistoryWidget(),
        ),
        FFRoute(
          name: 'icoProjects',
          path: '/icoProjects',
          builder: (context, params) => const IcoProjectsWidget(),
        ),
        FFRoute(
          name: 'icoTokens',
          path: '/icoTokens',
          builder: (context, params) => IcoTokensWidget(
            id: params.getParam(
              'id',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'icoOfferDetail',
          path: '/icoOfferDetail',
          builder: (context, params) => IcoOfferDetailWidget(
            id: params.getParam(
              'id',
              ParamType.String,
            ),
            walletType: params.getParam(
              'walletType',
              ParamType.String,
            ),
            currency: params.getParam(
              'currency',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'stakeIndex',
          path: '/stakeIndex',
          builder: (context, params) => const StakeIndexWidget(),
        ),
        FFRoute(
          name: 'ICOContributions',
          path: '/iCOContributions',
          builder: (context, params) => const ICOContributionsWidget(),
        ),
        FFRoute(
          name: 'myStaking',
          path: '/myStaking',
          builder: (context, params) => const MyStakingWidget(),
        ),
        FFRoute(
          name: 'support_TicketList',
          path: '/supportTicketList',
          builder: (context, params) => const SupportTicketListWidget(),
        ),
        FFRoute(
          name: 'support_SubmitTicket',
          path: '/supportSubmitTicket',
          builder: (context, params) => const SupportSubmitTicketWidget(),
        ),
        FFRoute(
          name: 'blogCreateArticle',
          path: '/blogCreateArticle',
          builder: (context, params) => BlogCreateArticleWidget(
            authorID: params.getParam(
              'authorID',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'blogArticledetail',
          path: '/blogArticledetail',
          builder: (context, params) => BlogArticledetailWidget(
            slug: params.getParam(
              'slug',
              ParamType.String,
            ),
            firstName: params.getParam(
              'firstName',
              ParamType.String,
            ),
            lastName: params.getParam(
              'lastName',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'blogEditArticle',
          path: '/blogEditArticle',
          builder: (context, params) => const BlogEditArticleWidget(),
        ),
        FFRoute(
          name: 'blogArticlesList',
          path: '/blogArticlesList',
          builder: (context, params) => BlogArticlesListWidget(
            posts: params.getParam<dynamic>(
              'posts',
              ParamType.JSON,
              isList: true,
            ),
          ),
        ),
        FFRoute(
          name: 'blogMain',
          path: '/blogMain',
          builder: (context, params) => const BlogMainWidget(),
        ),
        FFRoute(
          name: 'p2pOffers',
          path: '/p2pOffers',
          builder: (context, params) => const P2pOffersWidget(),
        ),
        FFRoute(
          name: 'p2pCreateOffer',
          path: '/p2pCreateOffer',
          builder: (context, params) => const P2pCreateOfferWidget(),
        ),
        FFRoute(
          name: 'p2pTrades',
          path: '/p2pTrades',
          builder: (context, params) => const P2pTradesWidget(),
        ),
        FFRoute(
          name: 'p2pPaymentMethodes',
          path: '/p2pPaymentMethodes',
          builder: (context, params) => const P2pPaymentMethodesWidget(),
        ),
        FFRoute(
          name: 'p2pCreatPM',
          path: '/p2pCreatPM',
          builder: (context, params) => const P2pCreatPMWidget(),
        ),
        FFRoute(
          name: 'p2pChat',
          path: '/p2pChat',
          builder: (context, params) => P2pChatWidget(
            id: params.getParam(
              'id',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'p2pMyOffers',
          path: '/p2pMyOffers',
          builder: (context, params) => const P2pMyOffersWidget(),
        ),
        FFRoute(
          name: 'p2pReview',
          path: '/p2pReview',
          builder: (context, params) => P2pReviewWidget(
            uuid: params.getParam(
              'uuid',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'p2pEditPM',
          path: '/p2pEditPM',
          builder: (context, params) => P2pEditPMWidget(
            id: params.getParam(
              'id',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'forexSplash',
          path: '/forexSplash',
          builder: (context, params) => ForexSplashWidget(
            json: params.getParam(
              'json',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: 'forexWaitingScreen',
          path: '/forexWaitingScreen',
          builder: (context, params) => ForexWaitingScreenWidget(
            json: params.getParam(
              'json',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: 'forexSelectPlan',
          path: '/forexSelectPlan',
          builder: (context, params) => ForexSelectPlanWidget(
            accountID: params.getParam(
              'accountID',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'forexMain',
          path: '/forexMain',
          builder: (context, params) => ForexMainWidget(
            json: params.getParam(
              'json',
              ParamType.JSON,
            ),
            accountID: params.getParam(
              'accountID',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'kycMain',
          path: '/kycMain',
          builder: (context, params) => const KycMainWidget(),
        ),
        FFRoute(
          name: 'kycForm',
          path: '/kycForm',
          builder: (context, params) => KycFormWidget(
            level: params.getParam(
              'level',
              ParamType.int,
            ),
            template: params.getParam(
              'template',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: 'investmentIntro',
          path: '/investmentIntro',
          builder: (context, params) => const InvestmentIntroWidget(),
        ),
        FFRoute(
          name: 'investmentSelectPlan',
          path: '/investmentSelectPlan',
          builder: (context, params) => const InvestmentSelectPlanWidget(),
        ),
        FFRoute(
          name: 'investmentMyPlanDetail',
          path: '/investmentMyPlanDetail',
          builder: (context, params) => InvestmentMyPlanDetailWidget(
            currency: params.getParam(
              'currency',
              ParamType.String,
            ),
            title: params.getParam(
              'title',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'faqIndex',
          path: '/faqIndex',
          builder: (context, params) => const FaqIndexWidget(),
        ),
        FFRoute(
          name: 'forexMyInvestment',
          path: '/forexMyInvestment',
          builder: (context, params) => const ForexMyInvestmentWidget(),
        ),
        FFRoute(
          name: 'exchangeChart',
          path: '/exchangeChart',
          builder: (context, params) => ExchangeChartWidget(
            symbol: params.getParam(
              'symbol',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'supoortChat',
          path: '/supoortChat',
          builder: (context, params) => SupoortChatWidget(
            uuid: params.getParam(
              'uuid',
              ParamType.String,
            ),
            subject: params.getParam(
              'subject',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'Home_Page',
          path: '/homePage',
          builder: (context, params) => const HomePageWidget(),
        ),
        FFRoute(
          name: 'maintenence',
          path: '/maintenence',
          builder: (context, params) => const MaintenenceWidget(),
        ),
        FFRoute(
          name: 'Confirmyouraccount',
          path: '/confirmyouraccount',
          builder: (context, params) => ConfirmyouraccountWidget(
            email: params.getParam(
              'email',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'SMSAuth',
          path: '/sMSAuth',
          builder: (context, params) => const SMSAuthWidget(),
        ),
        FFRoute(
          name: 'forexMetaTrader',
          path: '/forexMetaTrader',
          builder: (context, params) => ForexMetaTraderWidget(
            url: params.getParam(
              'url',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'exchangeTrade',
          path: '/exchangeTrade',
          builder: (context, params) => ExchangeTradeWidget(
            pair: params.getParam(
              'pair',
              ParamType.String,
            ),
            comeFromMarket: params.getParam(
              'comeFromMarket',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'test',
          path: '/test',
          builder: (context, params) => const TestWidget(),
        ),
        FFRoute(
          name: 'testCopy',
          path: '/testCopy',
          builder: (context, params) => const TestCopyWidget(),
        ),
        FFRoute(
          name: 'BicryptoHomePage',
          path: '/bicryptoHomePage',
          builder: (context, params) => const BicryptoHomePageWidget(),
        ),
        FFRoute(
          name: 'chat_ai_Screen',
          path: '/chatAiScreen',
          builder: (context, params) => const ChatAiScreenWidget(),
        ),
        FFRoute(
          name: 'announcement',
          path: '/announcement',
          builder: (context, params) => const AnnouncementWidget(),
        ),
        FFRoute(
          name: 'urlLunch',
          path: '/urlLunch',
          builder: (context, params) => UrlLunchWidget(
            url: params.getParam(
              'url',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'eccommercePaymentPage',
          path: '/eccommercePaymentPage',
          builder: (context, params) => EccommercePaymentPageWidget(
            product: params.getParam(
              'product',
              ParamType.JSON,
            ),
            typePhysical: params.getParam(
              'typePhysical',
              ParamType.bool,
            ),
            walletType: params.getParam(
              'walletType',
              ParamType.String,
            ),
            currency: params.getParam(
              'currency',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'ecommerceOrderID',
          path: '/ecommerceOrderID',
          builder: (context, params) => EcommerceOrderIDWidget(
            id: params.getParam(
              'id',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'Wallet_All',
          path: '/walletAll',
          builder: (context, params) => const WalletAllWidget(),
        ),
        FFRoute(
          name: 'walletTransactions',
          path: '/walletTransactions',
          builder: (context, params) => WalletTransactionsWidget(
            walletType: params.getParam(
              'walletType',
              ParamType.String,
            ),
            currency: params.getParam(
              'currency',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'WalletDeposit',
          path: '/walletDeposit',
          builder: (context, params) => const WalletDepositWidget(),
        ),
        FFRoute(
          name: 'WalletWithdraw',
          path: '/walletWithdraw',
          builder: (context, params) => const WalletWithdrawWidget(),
        ),
        FFRoute(
          name: 'WalletTransfer',
          path: '/walletTransfer',
          builder: (context, params) => const WalletTransferWidget(),
        ),
        FFRoute(
          name: 'towFactorAuth',
          path: '/towFactorAuth',
          builder: (context, params) => TowFactorAuthWidget(
            email: params.getParam(
              'email',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'Social',
          path: '/social',
          builder: (context, params) => const SocialWidget(),
        ),
        FFRoute(
          name: 'notifications',
          path: '/notifications',
          builder: (context, params) => const NotificationsWidget(),
        ),
        FFRoute(
          name: 'newTransfer',
          path: '/newTransfer',
          builder: (context, params) => const NewTransferWidget(),
        ),
        FFRoute(
          name: 'REFERRALS_MLM',
          path: '/referralsMlm',
          builder: (context, params) => ReferralsMlmWidget(
            conditions: params.getParam<dynamic>(
              'conditions',
              ParamType.JSON,
              isList: true,
            ),
          ),
        ),
        FFRoute(
          name: 'customWebview',
          path: '/customWebview',
          builder: (context, params) => CustomWebviewWidget(
            url: params.getParam(
              'url',
              ParamType.String,
            ),
            title: params.getParam(
              'title',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'exchangeAllTickersCopy',
          path: '/exchangeAllTickersCopy',
          builder: (context, params) => const ExchangeAllTickersCopyWidget(),
        ),
        FFRoute(
          name: 'futuresMarket',
          path: '/futuresMarket',
          builder: (context, params) => const FuturesMarketWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/loginPage';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 40.0,
                    height: 40.0,
                    child: SpinKitDualRing(
                      color: FlutterFlowTheme.of(context).primary,
                      size: 40.0,
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
