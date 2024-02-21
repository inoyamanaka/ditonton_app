import 'package:core/common/constants.dart';
import 'package:core/common/http_certificate.dart';
import 'package:core/common/utils.dart';
import 'package:ditonton/firebase_options.dart';
import 'package:ditonton/injection.dart' as di;
import 'package:ditonton/presentation/pages/main_navigation_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/presentation/bloc/movies/movies_bloc.dart';
import 'package:movies/presentation/pages/movie/about_page.dart';
import 'package:movies/presentation/pages/movie/movie_detail_page.dart';
import 'package:movies/presentation/pages/movie/popular_movies_page.dart';
import 'package:movies/presentation/pages/movie/search_page.dart';
import 'package:movies/presentation/pages/movie/top_rated_movies_page.dart';
import 'package:movies/presentation/pages/movie/watchlist_movies_page.dart';
import 'package:provider/provider.dart';
import 'package:tv_series/presentation/bloc/tv_series/tv_series_bloc.dart';
import 'package:tv_series/presentation/pages/tv_series/on_the_air_tv_series.dart';
import 'package:tv_series/presentation/pages/tv_series/popular_tv_series_page.dart';
import 'package:tv_series/presentation/pages/tv_series/tv_series_detail_page.dart';
import 'package:tv_series/presentation/pages/tv_series/tv_series_search_page.dart';
import 'package:tv_series/presentation/pages/tv_series/tv_series_top_rated_page.dart';
import 'package:tv_series/presentation/pages/tv_series/watchlist_tv_series_page.dart';

Future<void> main() async {
  try {
    di.init();
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await HttpCustom.init();

    runApp(const MyApp());
  } catch (e) {
    runApp(const SslFailed());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (context) => di.locator<OnTheAirMovieBloc>(),
        ),
        BlocProvider(
          create: (context) => di.locator<PopularMovieBloc>(),
        ),
        BlocProvider(
          create: (context) => di.locator<MovieTopRatedBloc>(),
        ),
        BlocProvider(
          create: (context) => di.locator<DetailMovieBloc>(),
        ),
        BlocProvider(
          create: (context) => di.locator<SearchMovieBloc>(),
        ),
        BlocProvider<RecommendationMovieBloc>(
          create: (context) => di.locator<RecommendationMovieBloc>(),
        ),
        BlocProvider<MovieStatusWatchListBloc>(
          create: (context) => di.locator<MovieStatusWatchListBloc>(),
        ),
        BlocProvider<InsertWatchListMovieBloc>(
          create: (context) => di.locator<InsertWatchListMovieBloc>(),
        ),
        BlocProvider<RemoveWatchListMovieBloc>(
          create: (context) => di.locator<RemoveWatchListMovieBloc>(),
        ),
        BlocProvider(
          create: (context) => di.locator<RecommendationMovieBloc>(),
        ),
        BlocProvider(
          create: (context) => di.locator<OnTheAirTvSeriesBloc>(),
        ),
        BlocProvider(
          create: (context) => di.locator<PopularTvSeriesBloc>(),
        ),
        BlocProvider(
          create: (context) => di.locator<TvSeriesTopRatedBloc>(),
        ),
        BlocProvider(
          create: (context) => di.locator<DetailTvSeriesBloc>(),
        ),
        BlocProvider(
          create: (context) => di.locator<SearchTvSeriesBloc>(),
        ),
        BlocProvider(
          create: (context) => di.locator<RecommendationTvSeriesBloc>(),
        ),
        BlocProvider(
          create: (context) => di.locator<StatusWatchListBloc>(),
        ),
        BlocProvider(
          create: (context) => di.locator<InsertWatchListBloc>(),
        ),
        BlocProvider(
          create: (context) => di.locator<RemoveWatchListBloc>(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: false,
          colorScheme: kColorScheme,
          primaryColor: kRichBlack,
          scaffoldBackgroundColor: kRichBlack,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const MainNavigationPage(),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/home':
              return MaterialPageRoute(
                  builder: (_) => const MainNavigationPage());
            case PopularMoviesPage.ROUTE_NAME:
              return CupertinoPageRoute(
                  builder: (_) => const PopularMoviesPage());
            case TopRatedMoviesPage.ROUTE_NAME:
              return CupertinoPageRoute(
                  builder: (_) => const TopRatedMoviesPage());
            case MovieDetailPage.ROUTE_NAME:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => MovieDetailPage(id: id),
                settings: settings,
              );
            case SearchPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => const SearchPage());
            case WatchlistMoviesPage.ROUTE_NAME:
              return MaterialPageRoute(
                  builder: (_) => const WatchlistMoviesPage());
            case AboutPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => const AboutPage());
            case PopularTvSeriesPage.ROUTE_NAME:
              return CupertinoPageRoute(
                  builder: (context) => const PopularTvSeriesPage());
            case TvSeriesTopRatedPage.ROUTE_NAME:
              return CupertinoPageRoute(
                  builder: (context) => const TvSeriesTopRatedPage());
            case OnTheAirTvSeriesPage.ROUTE_NAME:
              return CupertinoPageRoute(
                  builder: (context) => const OnTheAirTvSeriesPage());
            case TvSeriesDetailPage.ROUTE_NAME:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => TvSeriesDetailPage(id: id),
                settings: settings,
              );
            case WatchlistTvSeriesPage.ROUTE_NAME:
              return MaterialPageRoute(
                  builder: (_) => const WatchlistTvSeriesPage());
            case TvSeriesSearchPage.ROUTE_NAME:
              return CupertinoPageRoute(
                  builder: (_) => const TvSeriesSearchPage());
            default:
              return MaterialPageRoute(builder: (_) {
                return const Scaffold(
                  body: Center(
                    child: Text('Page not found :('),
                  ),
                );
              });
          }
        },
      ),
    );
  }
}

class SslFailed extends StatelessWidget {
  const SslFailed({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text("FAILED VERIFY CERTIFICATE"),
        ),
      ),
    );
  }
}
