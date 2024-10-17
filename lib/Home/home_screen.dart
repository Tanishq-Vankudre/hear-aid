import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../Login Signup/Screen/AccountManagementScreen.dart';
import '../Login Signup/Widgets/bottom_nav_icon.dart';
import 'Sound_settings/sound_settings.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  bool isRecording = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // AppBar Row
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _appBarIconButton(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const SoundSettingsScreen(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.speaker,
                        size: 30,
                        color: Colors.blue,
                      ),
                    ),
                    _appBarIconButton(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const AccountManagementScreen(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.grid_view_rounded,
                        size: 30,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(), // Pushes content down to center the record button
              _recordButton(), // Central Record Button
              const SizedBox(height: 20), // Add spacing between the button and the text
              Center(
                child: Text(isRecording ? "Listening" : "Start Listening"), // Toggle text based on isRecording state
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  // Central Recording Button
  Widget _recordButton() {
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isRecording = !isRecording;
          });
        },
        child: Container(
          width: 180,
          height: 180,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isRecording ? Colors.red : Colors.blue, // Change color based on recording status
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Icon(
            isRecording ? Icons.stop : Icons.mic,
            color: Colors.white,
            size: 50,
          ),
        ),
      ),
    );
  }

  // Icon Button for the AppBar
  Widget _appBarIconButton({required VoidCallback onTap, required Icon icon}) {
    return InkWell(
      onTap: onTap,
      customBorder: const CircleBorder(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: icon,
      ),
    );
  }
}
