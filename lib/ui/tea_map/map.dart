import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zentea/core/extensions/map_colors_x.dart';

import 'package:zentea/data/paths/country_path_model.dart';

import 'package:zentea/services/tea_collection/i_tea_collection_service.dart';

class Map extends StatelessWidget {
  final List<CountryPathModel> countries;
  final ValueChanged<CountryPathModel>? onCountryTap;

  const Map({
    super.key,
    required this.countries,
    this.onCountryTap,
  });

  @override
  Widget build(BuildContext context) {
    final service = context.watch<ITeaCollectionService>();
    final teas = service.teas.where((tea) => tea.isUnlocked == true).toList();

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
              totalTeas: service.teas.length,
              openedTeas: teas.length,
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
  final int totalTeas;
  final int openedTeas;

  const _MapContent({
    required this.size,
    required this.countries,
    required this.totalTeas,
    required this.openedTeas,
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
              totalTeas,
              openedTeas,
              countries,
              context.mapColors.countryBase,
              context.mapColors.countryActive
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
  final int totalTeas;
  final int openedTeas;
  final List<CountryPathModel> countries;
  final Color baseColor;
  final Color targetColor;

  const _CountriesPainter(
    this.totalTeas,
    this.openedTeas,
    this.countries,
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

    final progress = openedTeas / totalTeas;

    final scaleX = size.width / svgW;
    final scaleY = size.height / svgH;

    final matrix = Matrix4.identity()
      ..scale(scaleX, scaleY);

    final paint = Paint()
      ..color = determineTheColor(progress)
      ..style = PaintingStyle.fill;

    for (final country in countries) {
      final transformed = country.path.transform(matrix.storage);
      canvas.drawPath(transformed, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _CountriesPainter oldDelegate) => oldDelegate.countries != countries;
}