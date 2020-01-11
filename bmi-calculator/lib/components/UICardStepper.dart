import 'package:bmi_calculator/components/UICard.dart';
import 'package:bmi_calculator/components/UIRoundedButton.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UICardStepperInput extends StatelessWidget {
  UICardStepperInput({
    this.label,
    this.onChange,
    this.value,
  });

  final dynamic value;
  final String label;
  final Function onChange;

  @override
  Widget build(BuildContext context) {
    return UiCard(
      color: kUICardBgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            label,
            style: kInputLabelTextStyle,
          ),
          Text(
            value.toString(),
            style: kInputValueTextStyle,
          ),
          SizedBox(
            height: 8.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 10.0),
                child: RoundedIconButton(
                  icon: FontAwesomeIcons.plus,
                  // FIXME: not so sold out with this
                  // external constant enum
                  // for testability reasons
                  onTap: () => onChange(Operation.increment),
                ),
              ),
              RoundedIconButton(
                icon: FontAwesomeIcons.minus,
                onTap: () => onChange(Operation.decrement),
              ),
            ],
          )
        ],
      ),
    );
  }
}
