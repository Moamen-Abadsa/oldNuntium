import 'package:nuntium/features/home/presentation/model/atricle.dart';

import '../../domain/entity/article_entity.dart';

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
