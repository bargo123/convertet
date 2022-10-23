import 'package:converter/locator.dart';
import 'package:converter/src/models/country_model.dart';
import 'package:converter/src/screens/main/main_bloc.dart';
import 'package:converter/src/utils/bottom_sheets_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../utils/custom_state.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  CustomState<MainScreen, MainBloc> createState() => _MainScreenState();
}

class _MainScreenState extends CustomState<MainScreen, MainBloc> {
  TextEditingController convertFromController = TextEditingController();
  TextEditingController convertToController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            keyboardType: TextInputType.number,
            controller: convertFromController,
            decoration: InputDecoration(
                prefixIcon: StreamBuilder<CountryResult>(
                    stream: bloc.selectedFromCountryStream,
                    builder: (context, snapshot) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: InkWell(
                          onTap: () {
                            getIt<BottomSheetsUtil>().countriesBottomSheet(context,
                                countryData: bloc.listOfCountries?.country ?? [], onCountrySelected: (selectedCountry) {
                              bloc.setCountryFrom = selectedCountry;
                              Navigator.pop(context);
                            });
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              snapshot.data != null
                                  ? Row(children: [
                                      Image.network(snapshot.data?.image ?? ""),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      Text(snapshot.data?.currencyName ?? "")
                                    ])
                                  : const Text("Select Country"),
                              const Icon(Icons.arrow_drop_down)
                            ],
                          ),
                        ),
                      );
                    }),
                hintText: "Convert From",
                border: const OutlineInputBorder()),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () async {
                convertToController.text = await bloc.convert(convertFromController.text);
              },
              child: Text("Convert")),
          const SizedBox(
            height: 20,
          ),
          TextField(
            readOnly: true,
            onTap: () {
              getIt<BottomSheetsUtil>().countriesBottomSheet(context, countryData: bloc.listOfCountries?.country ?? [],
                  onCountrySelected: (selectedCountry) {
                bloc.setCountryTo = selectedCountry;
                Navigator.pop(context);
              });
            },
            keyboardType: TextInputType.number,
            controller: convertToController,
            decoration: InputDecoration(
                prefixIcon: StreamBuilder<CountryResult>(
                    stream: bloc.selectedToCountryStream,
                    builder: (context, snapshot) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            snapshot.data != null
                                ? Row(children: [
                                    Image.network(snapshot.data?.image ?? ""),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    Text(snapshot.data?.currencyName ?? "")
                                  ])
                                : const Text("Select Country"),
                            const Icon(Icons.arrow_drop_down)
                          ],
                        ),
                      );
                    }),
                hintText: "Convert To",
                border: const OutlineInputBorder()),
          )
        ],
      ),
    ));
  }

  @override
  void onStart() async {
    await bloc.getCountries();
  }

  @override
  void onStop() {}
}
