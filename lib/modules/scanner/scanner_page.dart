import 'dart:async';

import 'package:fleet_manager/shared/themes/app_colors.dart';
import 'package:fleet_manager/shared/themes/app_text_styles.dart';
import 'package:fleet_manager/widgets/app_bar.dart';
import 'package:fleet_manager/widgets/app_buttons.dart';
import 'package:fleet_manager/widgets/app_form_field.dart';
import 'package:fleet_manager/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({super.key});

  @override
  _ScannerPageState createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  String _scanBarcode = 'Unknown';
  final _initialValueController = TextEditingController();
  final _finalValueController = TextEditingController();
  String _initialValue = '';
  String _finalValue = '';
  bool isEnabled = false;
  @override
  void initState() {
    super.initState();
  }

  Future<void> scanQR() async {
    String code;
    try {
      code = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancelar', true, ScanMode.QR);
    } on PlatformException {
      code = 'Failed to get platform version.';
    }
    if (!mounted) return;

    if (code != '-1') {
      isEnabled = true;
      setState(() {
        _scanBarcode = code;
      });
    }
  }

  Future<void> _showMyDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.greyBackground2,
          title: const Center(child: Text('Confirmação!')),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text('Veículo: $_scanBarcode'),
                if (_initialValue.isNotEmpty)
                  Text('Kilometragem inicial: $_initialValue'),
                if (_finalValue.isNotEmpty)
                  Text('Kilometragem inicial: $_finalValue'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Enviar',
                style: AppTextStyles.body1.copyWith(
                  color: AppColors.blackBlue,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onPressed: () {
                setState(() {
                  _initialValue = '';
                  _finalValue = '';
                  _scanBarcode = '';
                  _finalValueController.clear();
                  _initialValueController.clear();
                  Navigator.of(context).pop();
                  isEnabled = false;
                });
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBarWidget(
        title: 'Scanner',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20)
            .add(const EdgeInsets.only(bottom: 20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: AppTextFormField(
                          label: 'KM inicial',
                          controller: _initialValueController,
                          onChanged: (value) => _initialValue = value,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: AppTextFormField(
                          label: 'KM final',
                          controller: _finalValueController,
                          onChanged: (value) => _finalValue = value,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                  ],
                ),
                LabelIconButton(
                  onPressed: () => scanQR(),
                  icon: Icons.qr_code_2_outlined,
                )
              ],
            ),
            const SizedBox(
              height: 150,
            ),
            AppButton(
              isEnabled: isEnabled,
              onPressed: () {
                _showMyDialog();
              },
              label: 'Registrar',
            ),
          ],
        ),
      ),
    );
  }
}

class _ScanButton extends StatelessWidget {
  const _ScanButton({required this.onPressed});

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
