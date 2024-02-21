// ignore_for_file: constant_identifier_names

import 'package:core/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/presentation/bloc/movies/movies_bloc.dart';
import 'package:movies/presentation/widgets/movie/movie_card_list.dart';

class SearchPage extends StatelessWidget {
  static const ROUTE_NAME = '/search';

  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onSubmitted: (query) {
                BlocProvider.of<SearchMovieBloc>(context)
                    .add(SearchMovieEvent(query));
              },
              decoration: const InputDecoration(
                hintText: 'Search title',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.search,
            ),
            const SizedBox(height: 16),
            Text(
              'Search Result',
              style: kHeading6,
            ),
            BlocBuilder<SearchMovieBloc, MovieState>(
              builder: (context, state) {
                if (state is SearchMovieLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is SearchMovieFailure) {
                  return const Center(
                    child: Text('Tv Series not found'),
                  );
                }
                if (state is SearchMovieSuccess) {
                  final result = state.data;

                  return result.isEmpty
                      ? const Column(
                          children: [
                            SizedBox(height: 10),
                            Text(
                                'Tidak ada film dengan judul tersebut yang terdaftar'),
                            SizedBox(height: 40),
                            Icon(
                              Icons.cancel_outlined,
                              size: 120,
                            )
                          ],
                        )
                      : Expanded(
                          child: ListView.builder(
                            padding: const EdgeInsets.all(8),
                            itemBuilder: (context, index) {
                              final series = result[index];
                              return MovieCard(series);
                            },
                            itemCount: result.length,
                          ),
                        );
                }

                return const SizedBox();
              },
            )
          ],
        ),
      ),
    );
  }
}
