import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:zentea/core/l10n/l10n.dart';
import 'package:zentea/core/theme/app_theme.dart';

import 'package:zentea/data/teas/tea_types.dart';
import 'package:zentea/data/paths/paths_of_countries.dart';

import 'package:zentea/services/tea_collection/i_tea_collection_service.dart';

import 'map.dart';

class TeaMapBuilder extends StatefulWidget {
  const TeaMapBuilder({super.key});

  @override
  State<TeaMapBuilder> createState() => _TeaMapBuilderState();
}

class _TeaMapBuilderState extends State<TeaMapBuilder> {
  TeaCountries? _countryByCode(String code) {
    switch (code) {
      case 'CN':
        return TeaCountries.china;
      case 'GB':
        return TeaCountries.unitedKingdom;
      case 'IN':
        return TeaCountries.india;
      case 'JP':
        return TeaCountries.japan;
      case 'EG':
        return TeaCountries.egypt;
      case 'MA':
        return TeaCountries.morocco;
      case 'ZA':
        return TeaCountries.southAfrica;
      default:
        return null;
    }
  }

  void _showCountryTeasSheet(
      BuildContext context,
      ITeaCollectionService service,
      TeaCountries country,
      ) {
    final teas = service.teas.where((tea) => tea.country == country).toList();

    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  country.title(context),
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),

                Expanded(
                  child: ListView.builder(
                    itemCount: teas.length,
                    itemBuilder: (context, index) {
                      final tea = teas[index];
                      return ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,

                        leading: Icon(
                          tea.isUnlocked
                              ? Icons.emoji_food_beverage
                              : Icons.lock,
                        ),

                        title: Text(
                          tea.isUnlocked
                              ? tea.type.title(context)
                              : context.l10n.locked,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final service = context.read<ITeaCollectionService>();

    final countries = [
      (context.l10n.china, TeaCountries.china),
      (context.l10n.unitedKingdom, TeaCountries.unitedKingdom),
      (context.l10n.india, TeaCountries.india),
      (context.l10n.japan, TeaCountries.japan),
      (context.l10n.egypt, TeaCountries.egypt),
      (context.l10n.morocco, TeaCountries.morocco),
      (context.l10n.southAfrica, TeaCountries.southAfrica),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.teaMap,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(16),

            decoration: BoxDecoration(
              color: context.colors.surface,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2),
                  blurRadius: 8,
                  offset: const Offset(4, 6),
                ),
              ],
            ),

            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: AspectRatio(
                    aspectRatio: 1009.67 / 665.96,
                    child: Map(
                      countries: pathsOfCountries,
                      onCountryTap: (country) {
                        final teaCountry = _countryByCode(country.code);

                        if (teaCountry == null) {
                          debugPrint('No country mapping for code: ${country.code}');
                          return;
                        }

                        _showCountryTeasSheet(context, service, teaCountry);
                      },
                    ),
                  ),
                ),

                Column(
                  children: countries.map((country) {
                    return _countryTile(
                      context,
                      country.$1,
                      service.countryCounter(country.$2),
                      onTap: () => _showCountryTeasSheet(context, service, country.$2),
                    );
                  }).toList(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _countryTile(
      BuildContext context,
      String country,
      int count, {
        required VoidCallback onTap,
      }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),

      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    country,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: context.colors.primary,
                    borderRadius: BorderRadius.circular(12),
                  ),

                  child: Text(
                    '$count',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}