import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruby_blog/src/provider/blog_provider.dart';
import 'package:ruby_blog/src/widgets/drawer.dart';

import '../widgets/addTopic_widget.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    context.read<BlogProvider>().fetchTopics();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<BlogProvider>(
        builder: (context, blog, _) {
          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.blueGrey,
                  Color.fromRGBO(240, 185, 113, 100),
                ],
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top,
                left: MediaQuery.of(context).padding.left + 10,
                right: MediaQuery.of(context).padding.right + 10,
                bottom: MediaQuery.of(context).padding.bottom,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Scaffold.of(context).openDrawer(),
                        icon: const Icon(Icons.sort),
                        color: Colors.white,
                      ),
                      const Text(
                        'Ruby Blog',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.white70,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  Row(
                    children: const [
                      Text(
                        'Topics',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                      AddTopicWidget(),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (blog.topics?.isNotEmpty ?? false)
                    SizedBox(
                      width: double.infinity,
                      height: 150,
                      child: ListView.builder(
                        shrinkWrap: true,
                        primary: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: blog.topics?.length ?? 0,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/topic',
                                arguments: blog.topics?[index]);
                          },
                          child: Container(
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                image: NetworkImage(
                                  'https://r4.wallpaperflare.com/wallpaper/142/751/831/landscape-anime-digital-art-fantasy-art-wallpaper-9b468c3dc3116f4905f43bc9cddc0cf0.jpg',
                                ),
                                fit: BoxFit.fill,
                                opacity: 0.7,
                              ),
                            ),
                            margin: const EdgeInsets.all(15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  blog.topics?[index].title ?? '',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 20,
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
      drawer: const DrawerWidget(),
    );
  }
}
