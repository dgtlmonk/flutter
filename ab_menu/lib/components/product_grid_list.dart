import 'package:ab_menu/components/item_detail.dart';
import 'package:flutter/material.dart';

class ProductGridList extends StatelessWidget {
  const ProductGridList({
    Key key,
    @required this.source,
  }) : super(key: key);
  final List source;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Flexible(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverPadding(
              padding: EdgeInsets.all(20.0),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 30.0,
                  crossAxisSpacing: 20.0,
                  childAspectRatio: 1.1,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return new ItemDetailCard(
                      item: source[index],
                    );
                  },
                  childCount: source.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
