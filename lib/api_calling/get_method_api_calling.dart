import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:untitled/api_calling/api_client.dart';

import 'UserListGetMethod.dart';

class GetApiUserList extends StatefulWidget {
  const GetApiUserList({Key? key}) : super(key: key);

  @override
  State<GetApiUserList> createState() => _GetApiUserListState();
}

class _GetApiUserListState extends State<GetApiUserList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Method API Calling'),
      ),
      body: _buildBody(context),
    );
  }

  FutureBuilder<UserListGetMethod> _buildBody(BuildContext context) {
    final client = ApiClient(Dio(BaseOptions(contentType: "application/json")));

    return FutureBuilder<UserListGetMethod>(
        future: client.getUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final List<Data>? posts = snapshot.data?.data;
            print('api data is:--->$posts');

            return _buildPosts(context, posts);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  ListView _buildPosts(BuildContext context, List<Data>? posts) {
    return ListView.builder(
      itemBuilder: (context, index) {
        var item = posts![index];
        print('UserListGetMethod data is:--->${posts![index].email}');
        return Card(
          elevation: 4,
          child: ListTile(
            title: Text(item.firstName.toString()),
            leading:
                Image.network(item.avatar.toString()),
            subtitle: Text(item.email.toString()),
          ),
        );
      },
      itemCount: posts?.length,
      padding: EdgeInsets.all(8),
    );
  }
}
