import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zentea/core/extensions/map_colors_x.dart';

import 'package:zentea/data/paths/country_path_model.dart';
import 'package:zentea/data/teas/tea_types.dart';

import 'package:zentea/services/tea_collection/i_tea_collection_service.dart';

class WorldMap extends StatelessWidget {
  final List<CountryPathModel> countries;
  final ValueChanged<CountryPathModel>? onCountryTap;

  const WorldMap({
    super.key,
    required this.countries,
    this.onCountryTap,
  });

  @override
  Widget build(BuildContext context) {
    final service = context.watch<ITeaCollectionService>();
    final totalTeasByCountry = <String, int>{};
    final openedTeasByCountry = <String, int>{};

    for (final tea in service.teas) {
      final countryCode = _teaCountryCode(tea.country);
      totalTeasByCountry[countryCode] = (totalTeasByCountry[countryCode] ?? 0) + 1;

      if (tea.isUnlocked) {
        openedTeasByCountry[countryCode] = (openedTeasByCountry[countryCode] ?? 0) + 1;
      }
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final size = Size(
          constraints.maxWidth,
          constraints.maxHeight,
        );

        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTapDown: onCountryTap == null
              ? null
              : (details) {
            final country = _findCountryByPosition(
              details.localPosition,
              size,
              countries,
            );

            if (country != null) {
              onCountryTap!(country);
            }
          },

          child: SizedBox(
            width: size.width,
            height: size.height,
            child: _MapContent(
              size: size,
              countries: countries,
              totalTeasByCountry: totalTeasByCountry,
              openedTeasByCountry: openedTeasByCountry,
            ),
          ),
        );
      },
    );
  }
}

class _MapContent extends StatelessWidget {
  final Size size;
  final List<CountryPathModel> countries;
  final Map<String, int> totalTeasByCountry;
  final Map<String, int> openedTeasByCountry;

  const _MapContent({
    required this.size,
    required this.countries,
    required this.totalTeasByCountry,
    required this.openedTeasByCountry,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: SvgPicture.asset(
            'assets/world.svg',
            fit: BoxFit.fill,
          ),
        ),

        Positioned.fill(
          child: CustomPaint(
            painter: _CountriesPainter(
              countries,
              totalTeasByCountry,
              openedTeasByCountry,
              context.mapColors.countryBase,
              context.mapColors.countryActive,
            ),
          ),
        ),
      ],
    );
  }
}

CountryPathModel? _findCountryByPosition(
    Offset localPosition,
    Size renderedSize,
    List<CountryPathModel> countries,
    ) {
  const svgW = 1009.67;
  const svgH = 665.96;

  final mapX = localPosition.dx * svgW / renderedSize.width;
  final mapY = localPosition.dy * svgH / renderedSize.height;
  final mapPosition = Offset(mapX, mapY);

  for (final country in countries) {
    if (country.path.contains(mapPosition)) {
      return country;
    }
  }

  return null;
}

class _CountriesPainter extends CustomPainter {
  final List<CountryPathModel> countries;
  final Map<String, int> totalTeasByCountry;
  final Map<String, int> openedTeasByCountry;
  final Color baseColor;
  final Color targetColor;

  const _CountriesPainter(
    this.countries,
    this.totalTeasByCountry,
    this.openedTeasByCountry,
    this.baseColor,
    this.targetColor,
  );

  Color determineTheColor(double progress) {
    return Color.lerp(
      baseColor,
      targetColor,
      progress.clamp(0.0, 1.0),
    )!;
  }

  @override
  void paint(Canvas canvas, Size size) {
    const svgW = 1009.67;
    const svgH = 665.96;

    final scaleX = size.width / svgW;
    final scaleY = size.height / svgH;

    final matrix = Matrix4.identity()
      ..scaleByDouble(scaleX, scaleY, 1.0, 1.0);

    for (final country in countries) {
      final totalTeas = totalTeasByCountry[country.code] ?? 0;
      final openedTeas = openedTeasByCountry[country.code] ?? 0;
      final progress = totalTeas == 0 ? 0.0 : openedTeas / totalTeas;

      final paint = Paint()
        ..color = determineTheColor(progress)
        ..style = PaintingStyle.fill;

      final transformed = country.path.transform(matrix.storage);
      canvas.drawPath(transformed, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _CountriesPainter oldDelegate) =>
      oldDelegate.countries != countries ||
      oldDelegate.totalTeasByCountry != totalTeasByCountry ||
      oldDelegate.openedTeasByCountry != openedTeasByCountry ||
      oldDelegate.baseColor != baseColor ||
      oldDelegate.targetColor != targetColor;
}

String _teaCountryCode(TeaCountries country) {
  switch (country) {
    case TeaCountries.china:
      return 'CN';
    case TeaCountries.unitedKingdom:
      return 'GB';
    case TeaCountries.india:
      return 'IN';
    case TeaCountries.japan:
      return 'JP';
    case TeaCountries.egypt:
      return 'EG';
    case TeaCountries.morocco:
      return 'MA';
    case TeaCountries.southAfrica:
      return 'ZA';
    case TeaCountries.brazil:
      return 'BR';
    case TeaCountries.ukraine:
      return 'UA';
  }
}