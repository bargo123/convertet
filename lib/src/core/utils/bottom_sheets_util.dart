import 'package:cached_network_image/cached_network_image.dart';
import 'package:converter/src/core/models/country_model.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class BottomSheetsUtil {
  Future countriesBottomSheet(BuildContext context,
      {required List<CountryResult> countryData, required Function(CountryResult) onCountrySelected}) {
    return showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25),
          ),
        ),
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Select Country",
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .8,
                  child: ListView.separated(
                      separatorBuilder: ((context, index) {
                        return const Divider();
                      }),
                      itemCount: countryData.length,
                      itemBuilder: (context, count) {
                        return InkWell(
                          onTap: () {
                            onCountrySelected(countryData[count]);
                          },
                          child: Row(children: [
                            CachedNetworkImage(
                              imageUrl: countryData[count].image!,
                              placeholder: (context, s) {
                                return const Icon(Icons.image);
                              },
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(countryData[count].currencyName ?? "")
                          ]),
                        );
                      }),
                )
              ],
            ),
          );
        });
  }
}
