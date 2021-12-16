import 'package:farmers_app/apiRequests.dart';
import 'package:farmers_app/models/newsModel.dart';
import 'package:flutter/material.dart';

/// TODO: Top Headlines of India

class NewsTab extends StatelessWidget {
  const NewsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Top Headlines",style: TextStyle(fontSize: 20),),
                ),
                IconButton(onPressed: () async {
                  await APIRequests.fetchNews();
                }, icon: Icon(Icons.refresh))
              ],
            ),
            SizedBox(
              height: _screenSize.height*0.7,
              child: FutureBuilder<NewsListModel?>(
                future: APIRequests.fetchNews(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      print(snapshot.error.toString());
                      return const Text(
                        "There was a problem loading your headlines! Check in again later!");
                    } else if (snapshot.hasData) {
                      NewsListModel? newsListModel = snapshot.data;
                      return ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            ArticleModel? articleModel = newsListModel?.articles?[index];
                            if(articleModel != null) {
                            return Container(
                              // height: _screenSize.height * 0.30,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey[300] ?? Colors.blueGrey,
                                    offset: const Offset(
                                      5.0,
                                      5.0,
                                    ),
                                    blurRadius: 5.0,
                                    spreadRadius: 2.0,
                                  ),
                                ]
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(5)),
                                    child: Image.network(articleModel.urlToImage ?? "https://image.shutterstock.com/image-illustration/breaking-news-minimalistic-logo-on-260nw-1298244646.jpg",
                                        height: _screenSize.height * 0.2,
                                        width: _screenSize.width - 10,
                                        fit: BoxFit.fitWidth,
                                      ),
                                  ),
                                  const SizedBox(height: 2,),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                    child: Text(articleModel.title?.split("-").first ?? "Empty Title",overflow: TextOverflow.clip,maxLines: 2,),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                    child: Text(articleModel.sourceName ?? "Anonymous Source",overflow: TextOverflow.clip, maxLines: 2,style: TextStyle(fontSize: 10,fontStyle: FontStyle.italic),),
                                  ),
                                  // Text(articleModel.description ?? "Empty Description", overflow: TextOverflow.clip,),
                                  // Expanded(
                                  //   child: Padding(
                                  //     padding: const EdgeInsets.all(8.0),
                                  //     child: Column(
                                  //       crossAxisAlignment: CrossAxisAlignment
                                  //           .start,
                                  //       children: const [
                                  //         Text("Phosphorus",
                                  //             style: TextStyle(fontSize: 20)),
                                  //         Text("Quantity"),
                                  //         Text("Repetition"),
                                  //         Text("Application Method")
                                  //       ],
                                  //     ),
                                  //   ),
                                  // )
                                ],
                              ),
                            );
                          }else {
                              return const Text(
                                "Oops! Couldn't load this article");
                            }
                            },
                          separatorBuilder: (context, index) {
                            return const Padding(padding: EdgeInsets.all(10));
                          },
                          itemCount: newsListModel?.articles?.length ?? 5);
                    }
                  }
                  return Center(child: CircularProgressIndicator());
                }
              ),
            ),
          ],
        )
    );
  }
}
