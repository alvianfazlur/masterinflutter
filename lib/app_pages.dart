import 'package:bwa_masteringflutter/ui/pages/boarding_pass/boarding_pass.dart';
import 'package:bwa_masteringflutter/ui/pages/boarding_pass/boarding_pass_binding.dart';
import 'package:bwa_masteringflutter/ui/pages/bonus_page/bonus_binding.dart';
import 'package:bwa_masteringflutter/ui/pages/bonus_page/bonus_page.dart';
import 'package:bwa_masteringflutter/ui/pages/checkout_page/checkout_page.dart';
import 'package:bwa_masteringflutter/ui/pages/checkout_page/checkout_page_binding.dart';
import 'package:bwa_masteringflutter/ui/pages/checkout_page/success_checkout.dart';
import 'package:bwa_masteringflutter/ui/pages/checkout_page/widget/details_ticket.dart';
import 'package:bwa_masteringflutter/ui/pages/choose_seat_page/seat_binding.dart';
import 'package:bwa_masteringflutter/ui/pages/credit_page/credit_binding.dart';
import 'package:bwa_masteringflutter/ui/pages/credit_page/credit_page.dart';
import 'package:bwa_masteringflutter/ui/pages/credit_page/widget/display_topup.dart';
import 'package:bwa_masteringflutter/ui/pages/detail_page/detail_binding.dart';
import 'package:bwa_masteringflutter/ui/pages/detail_page/detail_page.dart';
import 'package:bwa_masteringflutter/ui/pages/detail_page/widgets/map_view.dart';
import 'package:bwa_masteringflutter/ui/pages/detail_ticket/detail_ticket.dart';
import 'package:bwa_masteringflutter/ui/pages/detail_ticket/detail_ticket_binding.dart';
import 'package:bwa_masteringflutter/ui/pages/get_started.dart';
import 'package:bwa_masteringflutter/ui/pages/intro_screen/intro_bindings.dart';
import 'package:bwa_masteringflutter/ui/pages/intro_screen/intro_screen.dart';
import 'package:bwa_masteringflutter/ui/pages/login/login_binding.dart';
import 'package:bwa_masteringflutter/ui/pages/login/login_page.dart';
import 'package:bwa_masteringflutter/ui/pages/main_page/main_page.dart';
import 'package:bwa_masteringflutter/ui/pages/choose_seat_page/seat_page.dart';
import 'package:bwa_masteringflutter/ui/pages/main_page/main_page_binding.dart';
import 'package:bwa_masteringflutter/ui/pages/news_page/news_page.dart';
import 'package:bwa_masteringflutter/ui/pages/news_page/news_page_binding.dart';
import 'package:bwa_masteringflutter/ui/pages/news_page_detail/detail_news.dart';
import 'package:bwa_masteringflutter/ui/pages/news_page_detail/detail_news_binding.dart';
import 'package:bwa_masteringflutter/ui/pages/order_history/order_history_binding.dart';
import 'package:bwa_masteringflutter/ui/pages/order_history/order_history_page.dart';
import 'package:bwa_masteringflutter/ui/pages/payment_page/payment_binding.dart';
import 'package:bwa_masteringflutter/ui/pages/payment_page/payment_page.dart';
import 'package:bwa_masteringflutter/ui/pages/setting_page/setting_page.dart';
import 'package:bwa_masteringflutter/ui/pages/setting_page/setting_page_binding.dart';
import 'package:bwa_masteringflutter/ui/pages/sign_up/sign_up_binding.dart';
import 'package:bwa_masteringflutter/ui/pages/sign_up/sign_up_screen.dart';
import 'package:bwa_masteringflutter/ui/pages/splash_screen.dart';
import 'package:bwa_masteringflutter/ui/pages/transaction_page/trannsaction_page.dart';
import 'package:bwa_masteringflutter/ui/pages/transaction_page/transaction_binding.dart';
import 'package:bwa_masteringflutter/ui/pages/transaction_page/transaction_history/transaction_history.dart';
import 'package:bwa_masteringflutter/ui/pages/transaction_page/transaction_history/transaction_history_binding.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/animation.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

var appPages = [
  GetPage(
    name: SplashPage.routeName,
    page: () => SplashPage(),
  ),
  GetPage(
    name: GetStartedPage.routeName,
    page: () => GetStartedPage(),
  ),
  GetPage(
    name: SignUpScreen.routeName,
    page: () => SignUpScreen(),
    binding: SignUpBinding(),
    transition: Transition.cupertino,
    curve: Curves.easeInOut,
    transitionDuration: const Duration(milliseconds: 250),
  ),
  GetPage(
    name: BonusPage.routeName,
    page: () => BonusPage(),
    binding: BonusPageBinding(),
    transition: Transition.cupertino,
    curve: Curves.easeInOut,
    transitionDuration: const Duration(milliseconds: 250),
  ),
  GetPage(
    name: MainPage.routeName,
    page: () => MainPage(),
    binding: MainPageBinding(),
    transition: Transition.cupertino,
    curve: Curves.easeInOut,
    transitionDuration: const Duration(milliseconds: 250),
  ),
  GetPage(
    name: DetailPage.routeName,
    page: () => DetailPage(),
    binding: DetailPageBinding(),
    transition: Transition.cupertino,
    curve: Curves.easeInOut,
    transitionDuration: const Duration(milliseconds: 250),
  ),
  GetPage(
    name: ChooseSeatPage.routeName,
    page: () => ChooseSeatPage(),
    binding: SeatBinding(),
    transition: Transition.cupertino,
    curve: Curves.easeInOut,
    transitionDuration: const Duration(milliseconds: 250),
  ),
  GetPage(
    name: CheckoutPage.routeName,
    page: () => CheckoutPage(),
    binding: CheckoutPageBinding(),
    transition: Transition.cupertino,
    curve: Curves.easeInOut,
    transitionDuration: const Duration(milliseconds: 250),
  ),
  GetPage(
    name: SuccessCheckout.routeName,
    page: () => SuccessCheckout(),
    // binding: BonusPageBinding(),
    transition: Transition.cupertino,
    curve: Curves.easeInOut,
    transitionDuration: const Duration(milliseconds: 250),
  ),
  GetPage(
    name: SettingPage.routeName,
    page: () => SettingPage(),
    binding: SettingPageBinding(),
    transition: Transition.cupertino,
    curve: Curves.easeInOut,
    transitionDuration: const Duration(milliseconds: 250),
  ),
  GetPage(
    name: LoginPage.routeName,
    page: () => LoginPage(),
    binding: LoginPageBinding(),
    transition: Transition.cupertino,
    curve: Curves.easeInOut,
    transitionDuration: const Duration(milliseconds: 250),
  ),
  GetPage(
    name: TransactionPage.routeName,
    page: () => TransactionPage(),
    binding: TransactionBinding(),
    transition: Transition.cupertino,
    curve: Curves.easeInOut,
    transitionDuration: const Duration(milliseconds: 250),
  ),
  GetPage(
    name: CreditPage.routeName,
    page: () => CreditPage(),
    binding: CreditBinding(),
    transition: Transition.cupertino,
    curve: Curves.easeInOut,
    transitionDuration: const Duration(milliseconds: 250),
  ),
  GetPage(
    name: MidtransPaymentPage.routeName,
    page: () => MidtransPaymentPage(),
    binding: PaymentBinding(),
    transition: Transition.cupertino,
    curve: Curves.easeInOut,
    transitionDuration: const Duration(milliseconds: 250),
  ),
  GetPage(
    name: OrderHistoryPage.routeName,
    page: () => OrderHistoryPage(),
    binding: OrderHistoryBinding(),
    transition: Transition.cupertino,
    curve: Curves.easeInOut,
    transitionDuration: const Duration(milliseconds: 250),
  ),
  GetPage(
    name: NewsPage.routeName,
    page: () => NewsPage(),
    binding: NewsPageBinding(),
    transition: Transition.cupertino,
    curve: Curves.easeInOut,
    transitionDuration: const Duration(milliseconds: 250),
  ),
  GetPage(
    name: DetailNewsPage.routeName,
    page: () => DetailNewsPage(),
    binding: DetailNewsBinding(),
    transition: Transition.cupertino,
    curve: Curves.easeInOut,
    transitionDuration: const Duration(milliseconds: 250),
  ),
  GetPage(
    name: DisplayTopUp.routeName,
    page: () => DisplayTopUp(),
    transition: Transition.cupertino,
    curve: Curves.easeInOut,
    transitionDuration: const Duration(milliseconds: 250),
  ),
  GetPage(
    name: MapViewPage.routeName,
    page: () => MapViewPage(),
    transition: Transition.cupertino,
    curve: Curves.easeInOut,
    transitionDuration: const Duration(milliseconds: 250),
  ),
  GetPage(
    name: IntroScreen.routeName,
    page: () => IntroScreen(),
    binding: IntroBindings(),
    transition: Transition.cupertino,
    curve: Curves.easeInOut,
    transitionDuration: const Duration(milliseconds: 250),
  ),
  GetPage(
    name: BoardingPass.routeName,
    page: () => BoardingPass(),
    binding: BoardingPassBinding(),
    transition: Transition.cupertino,
    curve: Curves.easeInOut,
    transitionDuration: const Duration(milliseconds: 250),
  ),
  GetPage(
    name: TransactionHistory.routeName,
    page: () => TransactionHistory(),
    binding: TransactionHistoryBinding(),
    transition: Transition.cupertino,
    curve: Curves.easeInOut,
    transitionDuration: const Duration(milliseconds: 250),
  ),
  GetPage(
    name: DetailTicketPage.routeName,
    page: () => DetailTicketPage(),
    binding: DetailTicketBinding(),
    transition: Transition.cupertino,
    curve: Curves.easeInOut,
    transitionDuration: const Duration(milliseconds: 250),
  ),
];