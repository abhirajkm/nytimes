import 'package:flutter/material.dart';
import 'package:nytimes/Screens/detail-screen.dart';
import 'package:nytimes/models/articles.dart';
import 'package:provider/provider.dart';

import '../providers/news.dart';
import '../utils/apploader.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final articleProvider =
        Provider.of<NewsProvider>(context, listen: false).fetchArticles();
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60), child: CustomAppBar()),
      body: RefreshIndicator(
        onRefresh: () => articleProvider,
        child: FutureBuilder(
            future: articleProvider,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const AppLoader();
              } else {
                if (snapshot.hasData) {
                  List<Article> _articles = snapshot.data as List<Article>;
                  return Scaffold(
                      extendBody: true,
                      body: ArticleList(
                        articleList: _articles,
                      ));
                } else {
                  return const Center(
                    child: Text("No Data Found"),
                  );
                }
              }
            }),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Icon(Icons.vertical_split_outlined),
      title: Text(
        "NY Times Most Popular",
        style: Theme.of(context)
            .textTheme
            .headline6!
            .copyWith(color: Colors.white),
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 25,
            )),
        const Icon(Icons.more_vert)
      ],
    );
  }
}

class ArticleList extends StatelessWidget {
  final List<Article> articleList;
  const ArticleList({
    Key? key,
    required this.articleList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: articleList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return ArticleItem(
          article: articleList[index],
          onTap: () {
            Navigator.pushNamed(context, DetailScreen.routeName,
                arguments: DetailScreen(
                  article: articleList[index],
                ));
          },
        );
      },
    );
  }
}

class ArticleItem extends StatelessWidget {
  final Article article;
  final void Function()? onTap;

  const ArticleItem({
    Key? key,
    required this.article,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
                width: 50,
                child: CircleAvatar(
                  backgroundImage: article.media.isNotEmpty
                      ? NetworkImage(article.media[0].mediaMetadata[0].url)
                      : const NetworkImage(
                          "https://images.unsplash.com/photo-1541963463532-d68292c34b19?auto=format&fit=crop&q=80&w=1000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8Ym9va3xlbnwwfHwwfHx8MA%3D%3D"),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 17),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      article.byline,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w300),
                    ),
                    Row(
                      children: [
                        Expanded(child: Text(article.section)),
                        const Icon(
                          Icons.calendar_month_outlined,
                          size: 12,
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(article.publishedDate),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              const Icon(
                Icons.arrow_forward_ios_sharp,
                color: Colors.grey,
                size: 15,
              )
            ],
          ),
          SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }
}
