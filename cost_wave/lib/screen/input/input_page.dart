import 'package:cost_wave/app_theme.dart';
import 'package:cost_wave/components/widgets/custom_app_bar.dart';
import 'package:cost_wave/components/widgets/custom_text_field.dart';
import 'package:cost_wave/components/widgets/dropdown_menu.dart';
import 'package:cost_wave/screen/input/widgets/input_cost_view.dart';
import 'package:cost_wave/screen/input/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

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

  TextEditingController nameController = TextEditingController();
  String selectedCategory = choices.first;
  TextEditingController amountController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  @override
  void initState() {
    topBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: widget.animationController!,
        curve: const Interval(0, 0.5, curve: Curves.fastOutSlowIn),
      ),
    );
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

  Future<void> saveCostDetails() async {
    final Map<String, dynamic> costData = {
      'cost_name': nameController.text,
      'cost_category': selectedCategory,
      'amount': int.tryParse(amountController.text),
      'expensed_at': dateController.text,
      'note': noteController.text
    };
    try {
      await FirebaseFirestore.instance.collection('cost_details').add(costData);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Data saved successfully')),
        );
        _clearForm(); // フォームをリセット
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving data: $e')),
        );
      }
    }
  }

  void _clearForm() {
    nameController.clear();
    amountController.clear();
    dateController.clear();
    noteController.clear();
    setState(() {
      selectedCategory = choices.first; // 初期値にリセット
    });
  }

  void addListData() {
    const int count = 9;

    listViews.add(
      InputCostView(
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController!,
            curve: const Interval((1 / count) * 1, 1.0,
                curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController!,
        widgets: [
          CustomTextField(labelText: 'Cost Name', controller: nameController),
          DropdownButtonMenu(
            labelText: 'Cost Category',
            value: selectedCategory,
            onChanged: (String value) {
              setState(() {
                selectedCategory = value; // 値を更新
              });
            },
          ),
          CustomTextField(
              labelText: 'Cost Amount', controller: amountController),
          CustomTextField(labelText: 'Cost Date', controller: dateController),
          CustomTextField(labelText: 'Cost Note', controller: noteController),
          const SizedBox(height: 24), // ボタンとの間隔
          SubmitButton(
            onPressed: saveCostDetails, // 保存処理をボタンに渡す
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Stack(
        children: <Widget>[
          getMainListViewUI(),
          CustomAppBar(
            animationController: widget.animationController!,
            topBarAnimation: topBarAnimation!,
            titleTxt: 'Input Cost',
          ),
        ],
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
          return const Center(child: CircularProgressIndicator());
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
            itemBuilder: (BuildContext context, int index) {
              widget.animationController?.forward();
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: listViews[index],
              );
            },
          );
        }
      },
    );
  }
}
