import 'package:flutter_test/flutter_test.dart';
import 'package:nytimes/interfaces/news.dart';
import 'package:nytimes/models/articles.dart';
import 'package:nytimes/providers/news.dart';
import 'package:mockito/mockito.dart';


class MockNewsInterface extends Mock implements NewsInterface {}

void main() {

    MockNewsInterface mockNewsInterface;
    NewsProvider newsProvider;
    final mockResponse = {
      "results": [
        {
          "uri": "nyt://article/505a6610-c23b-5443-a627-145ef2bcf3ad",
          "url":
          "https://www.nytimes.com/2023/10/20/us/politics/progressive-jews-united-states.html",
          "id": 100000009139787,
          "asset_id": 100000009139787,
          "source": "New York Times",
          "published_date": "2023-10-20",
          "updated": "2023-10-21 09:01:30",
          "section": "U.S.",
          "subsection": "Politics",
        },
        {
          "uri": "nyt://article/ebea86c4-06fd-5c41-90a3-39d1a27b6d65",
          "url":
          "https://www.nytimes.com/2023/10/18/world/middleeast/gaza-hospital-israel-hamas-explained.html",
          "id": 100000009138223,
          "asset_id": 100000009138223,
          "source": "New York Times",
          "published_date": "2023-10-18",
          "updated": "2023-10-20 11:36:22",
          "section": "World",
          "subsection": "Middle East",
        },
      ],
    };
    mockNewsInterface = MockNewsInterface();
    setUp(() {
      mockNewsInterface = MockNewsInterface();
    });
    group('API Test', () {
      test('Fetch List of Data', () async {
        final api = NewsProvider(mockNewsInterface);

        final data = await api.fetchArticles();

        expect(data, isNotNull);
        expect(data is List, isTrue);
      });

      test('test fetchArticles', () async {
        newsProvider = NewsProvider(mockNewsInterface);
        when(newsProvider.fetchArticles()).thenAnswer((_) async =>  Article.convertToList(mockResponse["results"] ?? []));

        newsProvider = NewsProvider(mockNewsInterface);
        final result = await newsProvider.fetchArticles();

        final expectedArticles =
        Article.convertToList(mockResponse["results"] ?? []);
        expect(result, expectedArticles);
      });
    });


    }


