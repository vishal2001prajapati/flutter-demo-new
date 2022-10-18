import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransitionAppBar extends StatelessWidget {
  final Widget avatar;
  final String title;
  final double extent;

  TransitionAppBar({required this.avatar, required this.title, this.extent = 250});


  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _TransitionAppBarDelegate(
          avatar: avatar, title: title, extent: extent > 200 ? extent : 200),
    );
  }
}

class _TransitionAppBarDelegate extends SliverPersistentHeaderDelegate {
  final _avatarMarginTween = EdgeInsetsTween(
    end: EdgeInsets.only(left: 14.0, top: 36.0),
  );

  final _titleMarginTween = EdgeInsetsTween(
    begin: EdgeInsets.only(bottom: 20),
    end: EdgeInsets.only(left: 64.0, top: 45.0),
  );

  final _avatarAlignTween =
  AlignmentTween(begin: Alignment.bottomCenter, end: Alignment.topLeft);
  final _iconAlignTween =
  AlignmentTween(begin: Alignment.bottomRight, end: Alignment.topRight);

  final Widget avatar;
  final String title;
  final double extent;

  _TransitionAppBarDelegate({required this.avatar, required this.title, this.extent = 250})
      : assert(avatar != null),
        assert(extent == null || extent >= 200),
        assert(title != null);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    double tempVal = 72 * maxExtent / 100;
    final progress = shrinkOffset > tempVal ? 1.0 : shrinkOffset / tempVal;
    final avatarMargin = _avatarMarginTween.lerp(progress);
    final titleMargin = _titleMarginTween.lerp(progress);

    final avatarAlign = _avatarAlignTween.lerp(progress);
    final iconAlign = _iconAlignTween.lerp(progress);

    final avatarSize = (1 - progress) * 200 + 32;

    return Stack(
      children: <Widget>[
        AnimatedContainer(
          duration: Duration(milliseconds: 100),
          height: 80,
          constraints: BoxConstraints(maxHeight: minExtent),
          color: Colors.white,
        ),
        Padding(
          padding: avatarMargin,
          child: Align(
            alignment: avatarAlign,
            child: SizedBox(
              height: avatarSize,
              width: avatarSize,
              child: avatar,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            height: progress < 0.4 ? 100 * (1 - progress) * 1.5 : 0,
            decoration: BoxDecoration(

               /* gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.pink[200]!.withOpacity(0.05),
                      Colors.pink[400]!.withOpacity(0.8),
                    ])*/),
          ),
        ),
        Padding(
          padding: titleMargin,
          child: Align(
            alignment: avatarAlign,
            child: Text(
             (title),
              style: TextStyle(

                color: progress < 0.4 ? Colors.white : Colors.black,
                fontSize: 18 + (5 * (1 - progress)),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Padding(
          padding: titleMargin,
          child: Align(
            alignment: iconAlign,
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: GestureDetector(
                onTap: () {
             /*     showSearch(
                    context: context,
                    delegate: SearchOptions(),
                  );*/
                },
                /*child: Icon(
                  Icons.search,
                  size: 30,
                  color: progress < 0.4 ? Colors.white : Colors.black,
                ),*/
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => extent;

  @override
  double get minExtent => 80;

  @override
  bool shouldRebuild(_TransitionAppBarDelegate oldDelegate) {
    return avatar != oldDelegate.avatar || title != oldDelegate.title;
  }
}