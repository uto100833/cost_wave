import 'package:cost_wave/app_theme.dart';
import 'package:cost_wave/components/ui_view/custom_card_view.dart';
import 'package:cost_wave/components/ui_view/custom_app_bar.dart';
import 'package:cost_wave/components/ui_view/title_view.dart';
import 'package:cost_wave/components/widgets/custom_text_field.dart';
import 'package:cost_wave/components/widgets/dropdown_menu.dart';
import 'package:flutter/material.dart';

class InputCostPage extends StatefulWidget {
  const InputCostPage({super.key, this.animationController});

  final AnimationController? animationController;

  @override
  _InputCostPageState createState() => _InputCostPageState();
}

class _InputCostPageState extends State<InputCostPage>
    with TickerProviderStateMixin {
  Animation<double>? topBarAnimation;

  List<Widget> listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;

  @override
  void initState() {
    topBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: widget.animationController!,
            curve: const Interval(0, 0.5, curve: Curves.fastOutSlowIn)));
    addListData();

    scrollController.addListener(() {
      if (scrollController.offset >= 24) {
        if (topBarOpacity != 1.0) {
          setState(() {
            topBarOpacity = 1.0;
          });
        }
      } else if (scrollController.offset <= 24 &&
          scrollController.offset >= 0) {
        if (topBarOpacity != scrollController.offset / 24) {
          setState(() {
            topBarOpacity = scrollController.offset / 24;
          });
        }
      } else if (scrollController.offset <= 0) {
        if (topBarOpacity != 0.0) {
          setState(() {
            topBarOpacity = 0.0;
          });
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    widget.animationController!.dispose();
    super.dispose();
  }

  void addListData() {
    const int count = 9;

    listViews.add(
      TitleView(
        titleTxt: 'Input Cost',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController!,
            curve: const Interval((1 / count) * 0, 1.0,
                curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController!,
      ),
    );

    listViews.add(CustomCardView(
      animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: widget.animationController!,
          curve: const Interval((1 / count) * 0, 1.0,
              curve: Curves.fastOutSlowIn))),
      animationController: widget.animationController!,
      widgets: const [
        CustomTextField(labelText: 'Cost Name'),
        DropdownButtonMenu(labelText: 'Cost Category'),
        CustomTextField(labelText: 'Cost Amount'),
        CustomTextField(labelText: 'Cost Date'),
        CustomTextField(labelText: 'Cost Note'),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            getMainListViewUI(),
            CustomAppBar(
                animationController: widget.animationController!,
                topBarAnimation: topBarAnimation!,
                titleTxt: 'Home'),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            )
          ],
        ),
      ),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  Widget getMainListViewUI() {
    return FutureBuilder<bool>(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox();
        } else {
          return ListView.builder(
            controller: scrollController,
            padding: EdgeInsets.only(
              top: AppBar().preferredSize.height +
                  MediaQuery.of(context).padding.top +
                  24,
              bottom: 62 + MediaQuery.of(context).padding.bottom,
            ),
            itemCount: listViews.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              widget.animationController?.forward();
              return listViews[index];
            },
          );
        }
      },
    );
  }
}
