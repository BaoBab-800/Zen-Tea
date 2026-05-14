import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:zentea/core/l10n/l10n.dart';
import 'package:zentea/core/theme/app_theme.dart';

import 'package:zentea/data/teas/tea_types.dart';

import 'package:zentea/services/tea_collection/tea_collection_service.dart';

import 'map.dart';

class TeaMap extends StatelessWidget {
  const TeaMap({super.key});

  @override
  Widget build(BuildContext context) {
    final service = context.read<TeaCollectionService>();

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
        title: const Text(
          'Tea Map',
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
                    child: Map(),
                  ),
                ),

                Column(
                  children: countries.map((country) {
                    return _countryTile(
                      context,
                      country.$1,
                      service.countryCounter(country.$2),
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

  Widget _countryTile(BuildContext context, String country, int count) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),

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
    );
  }
}