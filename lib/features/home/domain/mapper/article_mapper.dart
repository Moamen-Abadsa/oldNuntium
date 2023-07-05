
import '../../domain/entity/article_entity.dart';
import '../../presentation/model/article.dart';

extension ArticleEntityMapper on ArticleEntity {
  Article toPresentation() {
    return Article(
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
