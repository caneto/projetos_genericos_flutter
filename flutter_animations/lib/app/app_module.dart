import 'package:flutter_modular/flutter_modular.dart';

import 'modules/flutter_animations/presenter/pages/explicit_animation_page.dart';
import 'modules/flutter_animations/presenter/pages/hero_page.dart';
import 'modules/flutter_animations/presenter/pages/home_page.dart';
import 'modules/flutter_animations/presenter/pages/implicit_animation_page.dart';
import 'shared/constants/app_routes.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          AppRoutes.animatedBallPage,
          child: (context, args) => const ExplicitAnimationPage(),
          transition: TransitionType.leftToRight,
        ),
        ChildRoute(
          AppRoutes.heroPage,
          child: (context, args) => const HeroPage(),
        ),
        ChildRoute(
          AppRoutes.home,
          child: (context, args) => const HomePage(),
          transition: TransitionType.leftToRight,
        ),
        ChildRoute(
          AppRoutes.implicitAnimationPage,
          child: (context, args) => const ImplicitAnimationPAge(),
          transition: TransitionType.leftToRight,
        ),
      ];
}
