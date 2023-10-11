import 'package:flutter/material.dart';
import 'package:newap/presentions/screens/web_veiw.dart';

Widget buildItems(newsata, context) => InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WebVeiwWidge(url: '${newsata['url']}')));
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                  child: Text(
                "${newsata['author']}",
                style: Theme.of(context).textTheme.bodyLarge,
              )),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: SizedBox(
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        "${newsata['title']}",
                        style: Theme.of(context).textTheme.bodyLarge,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      "${newsata['publishedAt']}",
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
