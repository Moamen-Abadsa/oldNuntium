import 'package:nuntium/features/home/data/mapper/article_mapper.dart';

import '../../domain/entity/home_entity.dart';
import '../response/home_response.dart';

extension HomeResopnseMapper on HomeResopnse {
  HomeEntity toDomain() {
    return HomeEntity(
      source: source,
      articles: articles
          .map(
            (article) => article.toDomain(),
          )
          .toList(),
    );
  }
}
