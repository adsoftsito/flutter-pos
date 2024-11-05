import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'blog_row.dart';

const String query = """
query   Links {
  links{
    url
    description    
  }
}
""";

class LogsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //var appState = context.watch<MyAppState>();
    return  Query(
                options: QueryOptions(
                    document: gql(query),
                    variables: const <String, dynamic>{"variableName": "value"}),
                builder: (result, {fetchMore, refetch}) {
                  if (result.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  print(result);
                  if (result.data == null) {
                    return const Center(
                      child: Text("No logs found!"),
                    );
                  }
                  final posts = result.data!['links'];
                  return ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      final post = posts[index];
                      final url = post['url'];
                      final description = post['description'];
                      return BlogRow(
                        url: url,
                        description: description,
                      );
                    },
                  );
});
}
}
