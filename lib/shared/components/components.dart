
import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:gnews/shared/cubit/cubit.dart';

import '../../layout/WebVeiw_Screen/WebVeiw.dart';

Widget bulidItem(article, context) {
  return InkWell(
    onTap: (){
      Navigator.push(context,
          MaterialPageRoute(
            builder: (context) => WebView_Screen(article['url']),
          )
      );
    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            width: 120.0,
            height: 120.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10.0,
              ),
              image: DecorationImage(
                image: NetworkImage((article['urlToImage'] == null ||
                        article['urlToImage'] == ' '
                    ? 'https://media-cldnry.s-nbcnews.com/image/upload/newscms/2019_01/2705191/nbc-social-default.png'
                    : article['urlToImage'])),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: SizedBox(
              height: 120.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      // 'title',
                      '${article['title']}',
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    // 'date',
                    article['publishedAt'].toString()
                        .substring(0,
                        article['publishedAt'].toString().indexOf('T')
                     ),
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 15.0,
          ),
        ],
      ),
    ),
  );
}

Widget myDivider(context) => Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Container(
        width: double.infinity,
        // color: AppCubit.get(context).isDark ? Colors.black:Colors.white ,
        height: 1.0,

      ),
    );

Widget articleBuilder(list,context,function) => ConditionalBuilder(
        condition: list.length > 0,
        builder: (context) => ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => bulidItem(list[index], context),
        separatorBuilder: (context, index) => myDivider(context),
        itemCount: list.length,
      ),
      fallback: (context) => function,
    );

