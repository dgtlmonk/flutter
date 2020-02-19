import 'package:ab_menu/components/item_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:uuid/uuid.dart';

class ProductGridList extends StatelessWidget {
  const ProductGridList({
    Key key,
    @required this.source,
  }) : super(key: key);
  final List source;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: new StaggeredGridView.count(
          padding: EdgeInsets.all(8.0),
          primary: false,
          crossAxisCount: MediaQuery.of(context).size.width > 1000 ? 8 : 6,
          children: source.map<Widget>(
            (item) {
              return new ItemDetailCard(
                  key: Key(
                    new Uuid().v4(),
                  ),
                  item: item);
            },
          ).toList(),
          staggeredTiles:
              source.map<StaggeredTile>((_) => StaggeredTile.fit(2)).toList(),
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
      ),
    );
  }
}
