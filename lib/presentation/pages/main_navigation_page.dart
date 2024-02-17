import 'package:ditonton/presentation/bloc/tv_series/tv_series_bloc.dart';
import 'package:ditonton/presentation/pages/movie/about_page.dart';
import 'package:ditonton/presentation/pages/movie/home_movie_page.dart';
import 'package:ditonton/presentation/pages/movie/search_page.dart';
import 'package:ditonton/presentation/pages/movie/watchlist_movies_page.dart';
import 'package:ditonton/presentation/pages/tv_series/home_tv_series.dart';
import 'package:ditonton/presentation/pages/tv_series/tv_series_search_page.dart';
import 'package:ditonton/presentation/pages/tv_series/watchlist_tv_series_page.dart';
import 'package:ditonton/presentation/provider/movie_list_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:remixicon/remixicon.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainNavigationPage extends StatefulWidget {
  @override
  _MainNavigationPageState createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  final List<Widget> _pages = [
    HomePageMovie(),
    TvSeriesHomePage(),
  ];

  ValueNotifier<int> indexPage = ValueNotifier<int>(0);
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => Provider.of<MovieListNotifier>(context, listen: false)
          ..fetchNowPlayingMovies()
          ..fetchPopularMovies()
          ..fetchTopRatedMovies());

    BlocProvider.of<TvSeriesBloc>(context).add(
      OnTheAirTvSeriesEvent(),
    );
    BlocProvider.of<PopularTvSeriesBloc>(context).add(
      PopularTvSeriesEvent(),
    );
    BlocProvider.of<TopRatedTvSeriesBloc>(context).add(
      TopRatedTvSeriesEvent(),
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
          selectedItemColor: Color(0xff000014),
          unselectedItemColor: Colors.black,
          onTap: (index) {
            indexPage.value = index;
          },
          items: [
            SalomonBottomBarItem(
              icon: Icon(
                Remix.film_line,
              ),
              title: Text('Movies'),
            ),
            SalomonBottomBarItem(
              icon: Icon(
                Remix.tv_line,
              ),
              title: Text(
                'TV Series',
              ),
            ),
          ],
        ),
        drawer: Drawer(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/circle-g.png'),
                ),
                accountName: Text('Ditonton'),
                accountEmail: Text('heralmabang128@gmail.com'),
              ),
              ListTile(
                leading: Icon(Remix.film_line),
                title: Text('Movies WatchList'),
                onTap: () {
                  Navigator.pushNamed(context, WatchlistMoviesPage.ROUTE_NAME);
                },
              ),
              ListTile(
                leading: Icon(Icons.tv),
                title: Text('Tv Series Watchlist'),
                onTap: () {
                  Navigator.pushNamed(
                      context, WatchlistTvSeriesPage.ROUTE_NAME);
                },
              ),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, AboutPage.ROUTE_NAME);
                },
                leading: Icon(Icons.info_outline),
                title: Text('About'),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text('Ditonton'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(
                    context,
                    indexPage == 0
                        ? SearchPage.ROUTE_NAME
                        : TvSeriesSearchPage.ROUTE_NAME);
              },
              icon: Icon(Icons.search),
            )
          ],
        ),
        body: _pages[indexPage.value],
      ),
    );
  }
}
