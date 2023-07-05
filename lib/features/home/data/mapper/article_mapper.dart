import 'package:nuntium/features/home/data/response/article_response.dart';
import 'package:nuntium/features/home/domain/entity/article_entity.dart';

extension HomeResopnseMapper on ArticleResponse {
  ArticleEntity toDomain() {
    return ArticleEntity(
      author: author,
      content: content,
      description: description,
      imageUrl: imageUrl,
      publishedAt: publishedAt,
      title: title,
      url: url,
    );
  }
}
