import 'package:dash_board/core/utils/app_colors.dart';
import 'package:dash_board/core/utils/app_text_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class IsFeatureProducState extends StatefulWidget {
  const IsFeatureProducState({
    super.key,
    required this.onChanged,
  });
  final ValueChanged<bool>? onChanged;

  @override
  State<IsFeatureProducState> createState() => _IsFeatureProducStateState();
}

class _IsFeatureProducStateState extends State<IsFeatureProducState> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
            onTap: () {
              isChecked = !isChecked;
              widget.onChanged?.call(isChecked);
              setState(() {});
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                border: Border.all(
                    color: isChecked ? Colors.white : Colors.grey.shade400),
                color: isChecked ? AppColors.lightPrimaryColor : Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              child: isChecked
                  ? Icon(
                      Icons.check,
                      size: 18,
                      color: Colors.white,
                    )
                  : null,
            ),
          ),

        Text.rich(TextSpan(
            text: '',
            children: [
              TextSpan(
                text: 'is Feature Product',
                style: AppTextStyles.semiBold13.copyWith(
                  color: Colors.black,
                ),
              ),
            ],
          )),
      ],
    );
  }
}
