import 'article_entity.dart';

class HomeEntity {
  String source;
  List<ArticleEntity> articles;

  HomeEntity({
    required this.articles,
    required this.source,
  });
}
