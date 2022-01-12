import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class switchDemoScreen extends StatefulWidget {
  const switchDemoScreen({Key? key}) : super(key: key);

  @override
  _switchDemoScreenState createState() => _switchDemoScreenState();
}

enum SkillLevel { junior, middle, senior }

class _switchDemoScreenState extends State<switchDemoScreen> {
  int _slimeDrouse = 0;
  bool _checket = false;
  bool _checket2 = true;
  bool _confirmAgreement=true;
  SkillLevel? _skillLevel = null;//SkillLevel.middle;

  void _onCheckedChange(bool? val) {
    setState(() {
      _checket = !_checket;
      _checket2 = !_checket2;
    });
  }

  void _onSkillLevelChanged (SkillLevel? value) {
    setState(() {
      _skillLevel = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(),
        body:
        Center(
        child: SingleChildScrollView(
        child: Column(
        children: [
          ToggleSwitch(
            changeOnTap: true,
            minHeight: 36,
            minWidth: 300.0,
            animate: true,
            animationDuration: 200,
            cornerRadius: 36.0,
            activeBgColors: const [[Color(0xFF0079D0)], [Color(0xFF0079D0)]],
            activeFgColor: Colors.white,
            inactiveBgColor: const Color(0xFFECEFF1),
            inactiveFgColor: const Color.fromRGBO(0,0,0,0.4),
            initialLabelIndex: _slimeDrouse,
            totalSwitches: 2,
            fontSize: 16.0,
            labels: const ['Обычное тесто', 'Тонкое тесто'],
            //customTextStyles: const [TextStyle(letterSpacing: -1.0),
            //  TextStyle(letterSpacing: -1.0)],
            radiusStyle: true,
            onToggle: (index) {_slimeDrouse = index;
              setState(() {_slimeDrouse = index;} );
            },
          ),

          Container(
            child: Text("_slimeDrouse=$_slimeDrouse'"
                ""
                ),
          ),
            Row(
              children: [
                Checkbox(value: _checket, onChanged: _onCheckedChange),
                const Text('Выбор'),
              ],
            ),
                CheckboxListTile(
                    title: const Text('Принять условие соглашения'),
                    value: _confirmAgreement, onChanged: (val) {setState(() {
                  _confirmAgreement = !_confirmAgreement;
                });
                    }),
            Row(
              children: [
                Switch(value: _checket, onChanged: _onCheckedChange,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    splashRadius: 1000, ),
                const Text('Выбор'),
              ],
            ),
            Row(
              children: [
                Expanded(flex: 1,
                  child:
                Container(
                  child: SizedBox(width: 160,
                    child: SwitchListTile(
                        contentPadding: const EdgeInsets.only(left: 30),
                        activeTrackColor: Colors.lightGreenAccent,
                        activeColor: Colors.green,
                        title: const Text('Включить'),
                        value: _checket,
                        onChanged: _onCheckedChange),
                  ),
                ),
                ),
                Expanded(flex: 1,
                  child:
                Container(
                  //color: Color.fromRGBO(0, 0, 0, 0.6),
                  child: SizedBox(width: 160,
                    child: SwitchListTile(
                        tileColor: Colors.red,
                        contentPadding: const EdgeInsets.only(right: 30),
                        activeTrackColor: Colors.lightGreenAccent,
                        //activeColor: Colors.green,
                        title: const Text('Выключить'),
                        value: _checket2,
                        onChanged: _onCheckedChange),
                  ),
                ),
                ),
              ],
            ),
            const Text('Уровень навыков'),
            RadioListTile<SkillLevel>(
                title: const Text('junior'),
                value: SkillLevel.junior,
                groupValue: _skillLevel,
                onChanged: _onSkillLevelChanged,
            ),
            RadioListTile<SkillLevel>(
              title: const Text('middle'),
              value: SkillLevel.middle,
              groupValue: _skillLevel,
              onChanged: _onSkillLevelChanged,
              ),
            RadioListTile<SkillLevel>(
              title: const Text('senior'),
              value: SkillLevel.senior,
              groupValue: _skillLevel,
              onChanged: _onSkillLevelChanged,
            ),

          ])))));
  }
}
