import 'package:flutter/material.dart';

class switchDemoScreen extends StatefulWidget {
  const switchDemoScreen({Key? key}) : super(key: key);

  @override
  _switchDemoScreenState createState() => _switchDemoScreenState();
}

enum SkillLevel { junior, middle, senior }

class _switchDemoScreenState extends State<switchDemoScreen> {
  bool _checket = false;
  bool _confirmAgreement=true;
  SkillLevel? _skillLevel = SkillLevel.junior;

  void _onCheckedChange(bool? val) {
    setState(() {
      _checket = !_checket;
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
        body: Center(
        child: Column(
        children: [

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
              Switch(value: _checket, onChanged: _onCheckedChange),
              const Text('Выбор'),
            ],
          ),
          SwitchListTile(
              title: const Text('Включить'),
              value: _checket,
              onChanged: _onCheckedChange),
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
        ]))));
  }
}
