import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:navigator_lamp_switch_app/vol1/message.dart';

class ModifySettings extends StatefulWidget {
  final List<bool> set;

  const ModifySettings({Key? key, required this.set}) : super(key: key);

  @override
  State<ModifySettings> createState() => _ModifySettingsState();
}

class _ModifySettingsState extends State<ModifySettings> {
  late bool changed_Color;
  late bool changed_Onoff;

  @override
  void initState() {
    super.initState();
    changed_Color = widget.set[0];
    changed_Onoff = widget.set[1];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(changed_Color ? 'red' : 'yellow'),
                Switch(
                    value: changed_Color,
                    onChanged: (value) {
                      setState(() {
                        changed_Color = value;

                      });
                    }),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(changed_Onoff ? '온' : '오프'),
                Switch(
                    value: changed_Onoff,
                    onChanged: (value) {
                      setState(() {
                        changed_Onoff = value;
                      });
                    }),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    widget.set.add(changed_Color);
                    widget.set.add(changed_Onoff);

                    switchSetting.lamp_color = changed_Color;
                    switchSetting.on_off = changed_Onoff;

                  });
                  Navigator.pop(context);
                },
                child: const Text('확인')),
          ],
        ),
      ),
    );
  }
}
