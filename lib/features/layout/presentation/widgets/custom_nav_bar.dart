import 'package:flutter/material.dart';
import 'package:warqkm/core/extensions/res_size.dart';
import 'package:warqkm/core/themes/light/light_colors.dart';

class CustomNavBarWidget extends StatelessWidget {
  const CustomNavBarWidget({
    super.key,
    this.currentIndex = 0,
    required this.onTap,
    required this.navBarItems,
  });

  final int currentIndex;
  final List<dynamic> navBarItems;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewPadding.bottom, top: 9.ah),
      decoration: BoxDecoration(
        color: LightAppColors.primaryColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.asp)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              navBarItems.length,
              (index) => InkWell(
                onTap: () => onTap(index),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/${navBarItems[index]['icon']}.png',
                      width: 20.aw,
                      height: 20.aw,
                    ),
                    10.vsb,
                    Text(
                      navBarItems[index]['label'],
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 10.asp,
                            fontWeight: currentIndex != index ? FontWeight.w500 : FontWeight.w700,
                            color: Colors.white,
                          ),
                    ),
                    4.vsb,
                    Text(
                      '•',
                      style: TextStyle(
                        color: currentIndex != index ? Colors.transparent : Colors.white,
                        fontSize: 18.asp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
