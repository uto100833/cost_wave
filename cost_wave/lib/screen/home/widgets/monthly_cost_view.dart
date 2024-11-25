import 'package:cost_wave/components/widgets/curve_painter.dart';
import 'package:cost_wave/main.dart';
import 'package:flutter/material.dart';
import '../../../app_theme.dart';

class MonthlyCostView extends StatelessWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;

  const MonthlyCostView({super.key, this.animationController, this.animation});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 30 * (1.0 - animation!.value), 0.0),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 24, right: 24, top: 16, bottom: 18),
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                    topRight: Radius.circular(68.0),
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: AppTheme.grey.withOpacity(0.2),
                        offset: const Offset(1.1, 1.1),
                        blurRadius: 10.0),
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 16, left: 16, right: 16),
                      child: Center(
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: <Widget>[
                            Container(
                              width: 300,
                              height: 300,
                              decoration: BoxDecoration(
                                color: AppTheme.white,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(150.0),
                                ),
                                border: Border.all(
                                  width: 4,
                                  color:
                                      AppTheme.nearlyDarkBlue.withOpacity(0.2),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    '${(1503 * animation!.value).toInt()}',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontFamily: AppTheme.fontName,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 32,
                                      letterSpacing: 0.0,
                                      color: AppTheme.nearlyDarkBlue,
                                    ),
                                  ),
                                  Text(
                                    '円',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: AppTheme.fontName,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      letterSpacing: 0.0,
                                      color: AppTheme.grey.withOpacity(0.5),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            CustomPaint(
                              painter: CurvePainter(
                                colors: [
                                  AppTheme.nearlyDarkBlue,
                                  HexColor("#8A98E8"),
                                  HexColor("#8A98E8"),
                                ],
                                angle: 140 +
                                    (360 - 140) * (1.0 - animation!.value),
                              ),
                              child: const SizedBox(
                                width: 300,
                                height: 300,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 24, right: 24, top: 8, bottom: 8),
                      child: Container(
                        height: 2,
                        decoration: const BoxDecoration(
                          color: AppTheme.background,
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 24, right: 24, top: 8, bottom: 16),
                      child: Wrap(
                        spacing: 16.0, // 横方向の間隔
                        runSpacing: 16.0, // 縦方向の間隔
                        children: <Widget>[
                          _buildCostCard(
                            title: 'Sales',
                            progressValue: animation!.value * (70 / 1.2),
                            progressColor: HexColor('#87A0E5'),
                            remaining: '10,000yen left',
                          ),
                          _buildCostCard(
                            title: 'Materials',
                            progressValue:
                                animationController!.value * (70 / 2),
                            progressColor: HexColor('#F56E98'),
                            remaining: '100,000yen left',
                          ),
                          _buildCostCard(
                            title: 'Labor',
                            progressValue:
                                animationController!.value * (70 / 2.5),
                            progressColor: HexColor('#F1B440'),
                            remaining: '50,000yen left',
                          ),
                          _buildCostCard(
                            title: 'Utilities',
                            progressValue:
                                animationController!.value * (70 / 3),
                            progressColor: HexColor('#34A853'),
                            remaining: '20,000yen left',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildCostCard({
    required String title,
    required double progressValue,
    required Color progressColor,
    required String remaining,
  }) {
    return SizedBox(
      width: 150, // 各カードの幅
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: AppTheme.fontName,
              fontWeight: FontWeight.w500,
              fontSize: 16,
              letterSpacing: -0.2,
              color: AppTheme.darkText,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Container(
              height: 4,
              width: 70,
              decoration: BoxDecoration(
                color: progressColor.withOpacity(0.2),
                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    width: progressValue,
                    height: 4,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        progressColor,
                        progressColor.withOpacity(0.5),
                      ]),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(4.0)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              remaining,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: AppTheme.fontName,
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: AppTheme.grey.withOpacity(0.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
