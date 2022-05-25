import 'package:flutter/material.dart';


class ModifySettings extends StatefulWidget {
  final List<bool> set;

  const ModifySettings({Key? key, required this.set}) : super(key: key);

  @override
  State<ModifySettings> createState() => _ModifySettingsState();
}

class _ModifySettingsState extends State<ModifySettings> {
  late bool changed_Color;
  late bool changed_Onoff;

  List status = [];

  @override
  void initState() {
    super.initState();
    changed_Color = widget.set[0];
    changed_Onoff = widget.set[1];
    print(changed_Color);
    status = [];
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
                    status.add(changed_Color);
                    status.add(changed_Onoff);
                    widget.set.add(changed_Color);
                    widget.set.add(changed_Onoff);
                  });
                  Navigator.pop(context,status);
                },
                child: const Text('확인')),
          ],
        ),
      ),
    );
  }
}
