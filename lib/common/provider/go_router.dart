import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:real_dear_conimal/care/view/care_category_screen.dart';
import 'package:real_dear_conimal/care/view/care_detail_screen.dart';
import 'package:real_dear_conimal/care/view/care_reservation_screen.dart';
import 'package:real_dear_conimal/care/view/care_screen.dart';
import 'package:real_dear_conimal/care/view/reservation_detail_screen.dart';
import 'package:real_dear_conimal/care/view/reservation_list_screen.dart';
import 'package:real_dear_conimal/my_pet/view/create_pet_screen.dart';
import 'package:real_dear_conimal/my_pet/view/create_pet_select_hospital_screen.dart';
import 'package:real_dear_conimal/my_pet/view/my_pet_screen.dart';
import 'package:real_dear_conimal/product/view/product_category_screen.dart';

import '../../home/view/home_screen.dart';
import '../../order/view/create_order_screen.dart';
import '../../order/view/order_detail_screen.dart';
import '../../order/view/order_list_screen.dart';
import '../../product/view/product_detail_screen.dart';
import '../../product/view/product_screen.dart';
import '../../product_cart/view/product_cart_screen.dart';
import '../../user/view/certification_screen.dart';
import '../../user/view/custom_sns_screen.dart';
import '../../user/view/edit_profile_screen.dart';
import '../../user/view/input_info_screen.dart';
import '../../user/view/login_screen.dart';
import '../../user/view/profile_screen.dart';
import '../view/completion_screen.dart';
import '../view/completion_screen_to_email_login.dart';
import '../view/error_screen.dart';
import '../view/scaffold_with_nav.dart';
import '../view/splash_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  redirect: null,
  initialLocation: '/splash',
  routes: routes,
  errorBuilder: (context, state) => ErrorScreen(
    error: state.error.toString(),
  ),
  debugLogDiagnostics: true,
);

List<RouteBase> get routes => [
      StatefulShellRoute.indexedStack(
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: "/home",
                name: HomeScreen.routeName,
                builder: (context, state) => HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: "/product",
                name: ProductScreen.routeName,
                builder: (context, state) => ProductScreen(),
                routes: [
                  GoRoute(
                    parentNavigatorKey: _rootNavigatorKey,
                    path: "category",
                    name: ProductCategoryScreen.routeName,
                    builder: (context, state) => ProductCategoryScreen(),
                  ),
                  GoRoute(
                    parentNavigatorKey: _rootNavigatorKey,
                    path: ":id",
                    name: ProductDetailScreen.routeName,
                    builder: (context, state) {
                      final String id = state.pathParameters['id']!;
                      return ProductDetailScreen(id: id);
                    },
                  )
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: "/my_pet",
                name: MyPetScreen.routeName,
                builder: (context, state) => MyPetScreen(),
                routes: [
                  GoRoute(
                    parentNavigatorKey: _rootNavigatorKey,
                    path: "create-pet",
                    name: CreatePetScreen.routeName,
                    builder: (context, state) => CreatePetScreen(),
                    routes: [
                      GoRoute(
                        parentNavigatorKey: _rootNavigatorKey,
                        path: "create-pet",
                        name: CreatePetSelectHospitalScreen.routeName,
                        builder: (context, state) =>
                            CreatePetSelectHospitalScreen(),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: "/care",
                name: CareScreen.routeName,
                builder: (context, state) => CareScreen(),
                routes: [
                  GoRoute(
                    parentNavigatorKey: _rootNavigatorKey,
                    path: "category",
                    name: CareCategoryScreen.routeName,
                    builder: (context, state) => CareCategoryScreen(),
                  ),
                  GoRoute(
                    parentNavigatorKey: _rootNavigatorKey,
                    path: ":id",
                    name: CareDetailScreen.routeName,
                    builder: (context, state) {
                      final String id = state.pathParameters['id']!;
                      return CareDetailScreen(id: id);
                    },
                    routes: [
                      GoRoute(
                        parentNavigatorKey: _rootNavigatorKey,
                        path: "create-reservation",
                        name: CareCreateReservationScreen.routeName,
                        builder: (context, state) {
                          final String id = state.pathParameters['id']!;
                          return CareCreateReservationScreen(id: id);
                        },
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                name: ProfileScreen.routeName,
                builder: (context, state) => ProfileScreen(),
                routes: [
                  GoRoute(
                    parentNavigatorKey: _rootNavigatorKey,
                    path: 'edit',
                    name: EditProfileScreen.routeName,
                    builder: (context, state) => EditProfileScreen(),
                  ),
                ],
              ),
            ],
          ),
        ],
        builder: (BuildContext context, GoRouterState state,
            StatefulNavigationShell navigationShell) {
          return ScaffoldWithNav(navigationShell: navigationShell);
        },
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/splash',
        name: SplashScreen.routeName,
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: '/completion/:title',
        name: CompletionScreen.routeName,
        builder: (context, state) {
          final String title = state.pathParameters['title']!;

          return CompletionScreen(title: title);
        },
      ),
      GoRoute(
        path: '/completion_find/:title',
        name: CompletionScreenToEmailLogin.routeName,
        builder: (context, state) {
          final parameters = GoRouterState.of(context).pathParameters;

          return CompletionScreenToEmailLogin(title: parameters['title']!);
        },
      ),
      GoRoute(
        path: '/sns/:title',
        name: CustomSnsScreen.routeName,
        builder: (context, state) => CustomSnsScreen(),
      ),
      GoRoute(
        path: '/login',
        name: LoginScreen.routeName,
        builder: (context, state) => LoginScreen(),
        routes: [
          GoRoute(
            path: 'certification',
            name: CertificationScreen.routeName,
            builder: (context, state) => CertificationScreen(),
            routes: [
              GoRoute(
                path: 'input_info',
                name: InputInfoScreen.routeName,
                builder: (context, state) => InputInfoScreen(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/cart',
        name: ProductCartScreen.routeName,
        builder: (context, state) => ProductCartScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/create_order',
        name: CreateOrderScreen.routeName,
        builder: (context, state) => CreateOrderScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/order_list',
        name: OrderListScreen.routeName,
        builder: (context, state) => OrderListScreen(),
        routes: [
          GoRoute(
            parentNavigatorKey: _rootNavigatorKey,
            path: ':id',
            name: OrderDetailScreen.routeName,
            builder: (context, state) {
              String id = state.pathParameters['id']!;
              return OrderDetailScreen(id: id);
            },
          ),
        ],
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/reservation_list',
        name: ReservationListScreen.routeName,
        builder: (context, state) => ReservationListScreen(),
        routes: [
          GoRoute(
            parentNavigatorKey: _rootNavigatorKey,
            path: ':id',
            name: ReservationDetailScreen.routeName,
            builder: (context, state) {
              String id = state.pathParameters['id']!;
              return ReservationDetailScreen(id: id);
            },
          ),
        ],
      ),
    ];
