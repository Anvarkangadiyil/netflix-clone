import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone_app/application/search/search_bloc.dart';
import 'package:netflix_clone_app/core/constants.dart';
import 'package:netflix_clone_app/presentation/search/widgets/title.dart';

const imageUrl =
    "https://media.themoviedb.org/t/p/w250_and_h141_face/1F2RnXLc0fmRt7iWfBK4mNVsjno.jpg";

class SearchIdleList extends StatelessWidget {
  const SearchIdleList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTile(
          title: "Top Search",
        ),
        kheight,
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.isError) {
                return const Center(
                  child: Text('Error While getting Search'),
                );
              } else if (state.idleList.isEmpty) {
                return const Center(
                  child: Text('List is Empty'),
                );
              }
              return ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => const TopSearchItemTile(),
                separatorBuilder: (context, index) => kheight20,
                itemCount: state.idleList.length,
              );
            },
          ),
        ),
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 60,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageUrl),
            ),
          ),
        ),
        kwidth,
        kwidth,
        const Expanded(
          child: Text(
            "Movie name",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        const Icon(
          CupertinoIcons.play_circle,
          color: Colors.white,
          size: 50,
        )
      ],
    );
  }
}
