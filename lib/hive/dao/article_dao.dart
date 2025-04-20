import 'package:hive/hive.dart';
import 'package:university_magazine_project/app/model/article_vo.dart';
import 'package:university_magazine_project/hive/hive_constants.dart';

mixin ArticleDao {
  /// Persistence

  void saveArticle(ArticleVO? article) async {
    await getArticleBox().put(article?.id, article!);
  }

  void deleteArticle(String? id) async {
    await getArticleBox().delete(id);
  }

  void clearArticles() async {
    await getArticleBox().clear();
  }

  List<ArticleVO?>? getAllArticles() {
    return getArticleBox().values.toList();
  }

  /// Reactive
  Stream<void> getAllArticleEventStream() {
    return getArticleBox().watch();
  }

  Stream<List<ArticleVO?>?> getAllArticlesStream() {
    return Stream.value(getAllArticles());
  }

  /// Box
  Box<ArticleVO> getArticleBox() {
    return Hive.box<ArticleVO>(BOX_NAME_ARTICLE_VO);
  }
}
