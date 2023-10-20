import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nytimes/models/articles.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatefulWidget {
  static const routeName = "/detailScreen";
  final Article? article;
  const DetailScreen({Key? key, this.article}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Article? get _article {
    DetailScreen args =
        ModalRoute.of(context)!.settings.arguments as DetailScreen;
    return args.article;
  }

  @override
  Widget build(BuildContext context) {
    final data = _article!;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)),
        title: Text(
          data.title,
          style: const TextStyle(fontSize: 14),
        ),
      ),
      body: ListView(
        children: [
          if (data.media.isNotEmpty)
            Image.network(
              data.media[0].mediaMetadata[2].url,
              fit: BoxFit.fitWidth,
            ),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Source: ${data.source}",style: const TextStyle(fontWeight: FontWeight.w700,fontSize: 15,color: Colors.black),),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.red),
                        height: 40,
                        child: TextButton(
                            onPressed: () => _launchInBrowser(),
                            child: const Text(
                              "View In Browser",
                              style: TextStyle(color: Colors.white, fontSize: 18),
                            ))),
                  ],
                ),
                const SizedBox(height: 20,),
                Text(
                  data.title,
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Published Date : ${data.publishedDate}",
                      style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 13,
                          color: Colors.red),
                    ),
                    Text(
                      data.type,
                      style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 15,
                          color: Colors.green),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  data.byline,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.blueGrey),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  data.adxKeywords,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 17),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  data.abstract,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),


        ],
      ),
    );
  }

  Future<void> _launchInBrowser() async {
    final Uri url = Uri.parse(_article!.url);
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }
}
