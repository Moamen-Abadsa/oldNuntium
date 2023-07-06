import '../../domain/mapper/article_mapper.dart';
import '../../presentation/model/article.dart';
import '../../presentation/model/home.dart';
import '../entity/home_entity.dart';

extension HomeEntityMapper on HomeEntity {
  Home toPresentation() {
    return Home(
      source: source,
      articles: articles
              ?.map(
                (article) => article.toPresentation(),
              )
              .toList() ??
          <Article>[],
    );
  }
}
