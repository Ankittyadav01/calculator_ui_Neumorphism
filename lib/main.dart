import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculator UI",
      home: CalculatorUiApp(),
    );
  }
}

const Color colorDark = Color(0xFF374352);
const Color colorLight = Color(0xFFe6eeff);

class CalculatorUiApp extends StatefulWidget {
  const CalculatorUiApp({super.key});

  @override
  State<CalculatorUiApp> createState() => _CalculatorUiAppState();
}

bool darkMode = true;

class _CalculatorUiAppState extends State<CalculatorUiApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: darkMode ? colorDark : colorLight,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                color: Colors.red,
                child: const Text('Result'),
              ),
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buttonRounded(
                            title: 'C',
                            textColor:
                                darkMode ? Colors.green : Colors.redAccent),
                        _buttonRounded(title: '('),
                        _buttonRounded(title: ')'),
                        _buttonRounded(
                            title: '/',
                            textColor:
                                darkMode ? Colors.green : Colors.redAccent)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buttonRounded(title: '7'),
                        _buttonRounded(title: '8'),
                        _buttonRounded(title: '9'),
                        _buttonRounded(
                            title: 'x',
                            textColor:
                                darkMode ? Colors.green : Colors.redAccent)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buttonRounded(title: '4'),
                        _buttonRounded(title: '5'),
                        _buttonRounded(title: '6'),
                        _buttonRounded(
                            title: '-',
                            textColor:
                                darkMode ? Colors.green : Colors.redAccent)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buttonRounded(title: '1'),
                        _buttonRounded(title: '2'),
                        _buttonRounded(title: '3'),
                        _buttonRounded(
                            title: '+',
                            textColor:
                                darkMode ? Colors.green : Colors.redAccent)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buttonRounded(title: '0'),
                        _buttonRounded(title: ','),
                        _buttonRounded(
                            icon: Icons.backpack_outlined,
                            iconColor:
                                darkMode ? Colors.green : Colors.redAccent),
                        _buttonRounded(
                            title: '=',
                            textColor:
                                darkMode ? Colors.green : Colors.redAccent)
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        )));
  }
}

Widget _buttonRounded(
    {String title,
    double padding = 17,
    IconData icon,
    Color iconColor,
    Color textColor}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: NevContainer(
        darkMode: darkMode,
        borderRadius: BorderRadius.circular(40),
        padding: EdgeInsets.all(padding),
        child: Container(
          width: padding * 2,
          height: padding * 2,
          child: Center(
              child: title != null
                  ? Text(
                      title,
                      style: TextStyle(
                          color: textColor != null
                              ? textColor
                              : darkMode
                                  ? Colors.white
                                  : Colors.black,
                          fontSize: 30),
                    )
                  : Icon(
                      icon,
                      color: iconColor,
                      size: 30,
                    )),
        )),
  );
}

class NevContainer extends StatefulWidget {
  final bool darkMode;
  final Widget child;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry padding;

  const NevContainer(
      {super.key,
      this.darkMode = false,
      required this.child,
      required this.borderRadius,
      required this.padding});

  @override
  State<NevContainer> createState() => _NevContainerState();
}

class _NevContainerState extends State<NevContainer> {
  bool _isPressed = false;
  void _onPointerDown(PointerDownEvent event) {
    setState(() {
      _isPressed = true;
    });
  }

  void _onPointerUp(PointerUpEvent event) {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool darkMode = widget.darkMode;
    return Listener(
      onPointerDown: _onPointerDown,
      onPointerUp: _onPointerUp,
      child: Container(
          padding: widget.padding,
          decoration: BoxDecoration(
              color: darkMode ? colorDark : colorLight,
              borderRadius: widget.borderRadius,
              boxShadow: _isPressed
                  ? null
                  : [
                      BoxShadow(
                        color: darkMode
                            ? Colors.black54
                            : Colors.blueGrey.shade200,
                        offset: const Offset(4.0, 4.0),
                        blurRadius: 15.0,
                        spreadRadius: 1.0,
                      ),
                      BoxShadow(
                          color: darkMode
                              ? Colors.blueGrey.shade700
                              : Colors.white,
                          offset: const Offset(4.0, 4.0),
                          blurRadius: 15.0,
                          spreadRadius: 1.0)
                    ]),
          child: widget.child),
    );
  }
}
