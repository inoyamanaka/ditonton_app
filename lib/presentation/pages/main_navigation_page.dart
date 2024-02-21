import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/presentation/bloc/movies/movies_bloc.dart';
import 'package:movies/presentation/pages/movie/about_page.dart';
import 'package:movies/presentation/pages/movie/home_movie_page.dart';
import 'package:movies/presentation/pages/movie/search_page.dart';
import 'package:movies/presentation/pages/movie/watchlist_movies_page.dart';
import 'package:remixicon/remixicon.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:tv_series/presentation/bloc/tv_series/tv_series_bloc.dart';
import 'package:tv_series/presentation/pages/tv_series/home_tv_series.dart';
import 'package:tv_series/presentation/pages/tv_series/tv_series_search_page.dart';
import 'package:tv_series/presentation/pages/tv_series/watchlist_tv_series_page.dart';

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  _MainNavigationPageState createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  final List<Widget> _pages = [
    const HomePageMovie(),
    const TvSeriesHomePage(),
  ];

  ValueNotifier<int> indexPage = ValueNotifier<int>(0);
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () {
        BlocProvider.of<OnTheAirMovieBloc>(context).add(
          const OnTheAirMovieEvent(),
        );
        BlocProvider.of<PopularMovieBloc>(context).add(
          const PopularMovieEvent(),
        );
        BlocProvider.of<MovieTopRatedBloc>(context).add(
          const MovieTopRatedEvent(),
        );

        BlocProvider.of<OnTheAirTvSeriesBloc>(context).add(
          const OnTheAirTvSeriesEvent(),
        );
        BlocProvider.of<PopularTvSeriesBloc>(context).add(
          const PopularTvSeriesEvent(),
        );
        BlocProvider.of<TvSeriesTopRatedBloc>(context).add(
          const TvSeriesTopRatedEvent(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexPage,
      builder: (context, value, child) => Scaffold(
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: indexPage.value,
          backgroundColor: Colors.yellow[300],
          selectedItemColor: const Color(0xff000014),
          unselectedItemColor: Colors.black,
          onTap: (index) {
            indexPage.value = index;
          },
          items: [
            SalomonBottomBarItem(
              icon: const Icon(
                Remix.film_line,
              ),
              title: const Text('Movies'),
            ),
            SalomonBottomBarItem(
              icon: const Icon(
                Remix.tv_line,
              ),
              title: const Text(
                'TV Series',
              ),
            ),
          ],
        ),
        drawer: Drawer(
          child: Column(
            children: [
              const UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/circle-g.png'),
                ),
                accountName: Text('Ditonton'),
                accountEmail: Text('heralmabang128@gmail.com'),
              ),
              ListTile(
                leading: const Icon(Remix.film_line),
                title: const Text('Movies WatchList'),
                onTap: () {
                  Navigator.pushNamed(context, WatchlistMoviesPage.ROUTE_NAME);
                },
              ),
              ListTile(
                leading: const Icon(Icons.tv),
                title: const Text('Tv Series Watchlist'),
                onTap: () {
                  Navigator.pushNamed(
                      context, WatchlistTvSeriesPage.ROUTE_NAME);
                },
              ),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, AboutPage.ROUTE_NAME);
                },
                leading: const Icon(Icons.info_outline),
                title: const Text('About'),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text('Ditonton'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(
                    context,
                    indexPage.value == 0
                        ? SearchPage.ROUTE_NAME
                        : TvSeriesSearchPage.ROUTE_NAME);
              },
              icon: const Icon(Icons.search),
            )
          ],
        ),
        body: _pages[indexPage.value],
      ),
    );
  }
}
