import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SoundSettingsScreen extends StatefulWidget {
  const SoundSettingsScreen({super.key});

  @override
  _SoundSettingsScreenState createState() => _SoundSettingsScreenState();
}

class _SoundSettingsScreenState extends State<SoundSettingsScreen> {
  // Variables for each sound option
  bool babyCrying = false;
  bool doorBell = false;
  bool glassBreaking = false;
  bool alarm = false;
  bool rain = false;

  late Future<void> _loadSettingsFuture;

  @override
  void initState() {
    super.initState();
    _loadSettingsFuture = _loadSettings(); // Load settings on initialization
  }

  // Load the saved preferences for the sound settings
  Future<void> _loadSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      babyCrying = prefs.getBool('babyCrying') ?? false;
      doorBell = prefs.getBool('doorBell') ?? false;
      glassBreaking = prefs.getBool('glassBreaking') ?? false;
      alarm = prefs.getBool('alarm') ?? false;
      rain = prefs.getBool('rain') ?? false;
    });
  }

  // Save preferences whenever a toggle switch is changed
  Future<void> _saveSetting(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value); // Make sure to await the saving process
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0, // Remove shadow for a flat, modern look
        backgroundColor: Colors.white, // White app bar for clean appearance
        iconTheme: const IconThemeData(color: Colors.blue),
        title: const Text(
          'Sound Settings',
          style: TextStyle(
            color: Colors.blue, // Blue text for AppBar title
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      ),
      body: FutureBuilder(
        future: _loadSettingsFuture, // Load preferences before building UI
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a loading indicator while settings are loading
            return const Center(child: CircularProgressIndicator());
          }

          // If loading is complete, show the switches
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                SwitchListTile(
                  title: const Text('Baby Crying'),
                  value: babyCrying,
                  onChanged: (bool value) {
                    setState(() {
                      babyCrying = value;
                    });
                    _saveSetting('babyCrying', value); // Save the state
                  },
                ),
                SwitchListTile(
                  title: const Text('Door Bell'),
                  value: doorBell,
                  onChanged: (bool value) {
                    setState(() {
                      doorBell = value;
                    });
                    _saveSetting('doorBell', value); // Save the state
                  },
                ),
                SwitchListTile(
                  title: const Text('Glass Breaking'),
                  value: glassBreaking,
                  onChanged: (bool value) {
                    setState(() {
                      glassBreaking = value;
                    });
                    _saveSetting('glassBreaking', value); // Save the state
                  },
                ),
                SwitchListTile(
                  title: const Text('Alarm'),
                  value: alarm,
                  onChanged: (bool value) {
                    setState(() {
                      alarm = value;
                    });
                    _saveSetting('alarm', value); // Save the state
                  },
                ),
                SwitchListTile(
                  title: const Text('Rain'),
                  value: rain,
                  onChanged: (bool value) {
                    setState(() {
                      rain = value;
                    });
                    _saveSetting('rain', value); // Save the state
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
