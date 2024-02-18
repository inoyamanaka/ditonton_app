import 'package:ditonton/common/constants.dart';
import 'package:ditonton/common/utils.dart';
import 'package:ditonton/injection.dart' as di;
import 'package:ditonton/presentation/bloc/tv_series/tv_series_bloc.dart';
import 'package:ditonton/presentation/pages/main_navigation_page.dart';
import 'package:ditonton/presentation/pages/movie/about_page.dart';
import 'package:ditonton/presentation/pages/movie/movie_detail_page.dart';
import 'package:ditonton/presentation/pages/movie/search_page.dart';
import 'package:ditonton/presentation/pages/movie/watchlist_movies_page.dart';
import 'package:ditonton/presentation/pages/tv_series/on_the_air_tv_series.dart';
import 'package:ditonton/presentation/pages/tv_series/popular_tv_series_page.dart';
import 'package:ditonton/presentation/pages/tv_series/tv_series_detail_page.dart';
import 'package:ditonton/presentation/pages/tv_series/tv_series_search_page.dart';
import 'package:ditonton/presentation/pages/tv_series/tv_series_top_rated_page.dart';
import 'package:ditonton/presentation/pages/tv_series/watchlist_tv_series_page.dart';
import 'package:ditonton/presentation/provider/movie_detail_notifier.dart';
import 'package:ditonton/presentation/provider/movie_list_notifier.dart';
import 'package:ditonton/presentation/provider/movie_search_notifier.dart';
import 'package:ditonton/presentation/provider/popular_movies_notifier.dart';
import 'package:ditonton/presentation/provider/top_rated_movies_notifier.dart';
import 'package:ditonton/presentation/provider/watchlist_movie_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'presentation/pages/movie/popular_movies_page.dart';
import 'presentation/pages/movie/top_rated_movies_page.dart';

void main() {
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => di.locator<MovieListNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<MovieDetailNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<MovieSearchNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<TopRatedMoviesNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<PopularMoviesNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<WatchlistMovieNotifier>(),
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
        home: MainNavigationPage(),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/home':
              return MaterialPageRoute(builder: (_) => MainNavigationPage());
            case PopularMoviesPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => PopularMoviesPage());
            case TopRatedMoviesPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => TopRatedMoviesPage());
            case MovieDetailPage.ROUTE_NAME:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => MovieDetailPage(id: id),
                settings: settings,
              );
            case SearchPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => SearchPage());
            case WatchlistMoviesPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => WatchlistMoviesPage());
            case AboutPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => AboutPage());
            case PopularTvSeriesPage.ROUTE_NAME:
              return CupertinoPageRoute(
                  builder: (context) => PopularTvSeriesPage());
            case TvSeriesTopRatedPage.ROUTE_NAME:
              return CupertinoPageRoute(
                  builder: (context) => TvSeriesTopRatedPage());
            case OnTheAirTvSeriesPage.ROUTE_NAME:
              return CupertinoPageRoute(
                  builder: (context) => OnTheAirTvSeriesPage());
            case TvSeriesDetailPage.ROUTE_NAME:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => TvSeriesDetailPage(id: id),
                settings: settings,
              );
            case WatchlistTvSeriesPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => WatchlistTvSeriesPage());
            case TvSeriesSearchPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => TvSeriesSearchPage());
            default:
              return MaterialPageRoute(builder: (_) {
                return Scaffold(
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
