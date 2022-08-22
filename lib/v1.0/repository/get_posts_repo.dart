import '../apis/get_posts_api.dart';
import '../model/list_of_post.dart';

class GetPostsRepository {
  Future<List<Posts>> fetchPosts() async {
    return await GetListOfPostAPI().getPosts();
  }
}
