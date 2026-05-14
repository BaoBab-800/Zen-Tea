import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:zentea/data/paths/country_path_model.dart';

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
            child: _MapContent(size: size, countries: countries),
          ),
        );
      },
    );
  }
}

class _MapContent extends StatelessWidget {
  final Size size;
  final List<CountryPathModel> countries;

  const _MapContent({
    required this.size,
    required this.countries,
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

  const _CountriesPainter(this.countries);

  @override
  void paint(Canvas canvas, Size size) {
    const svgW = 1009.67;
    const svgH = 665.96;

    final scaleX = size.width / svgW;
    final scaleY = size.height / svgH;

    final matrix = Matrix4.identity()
      ..scale(scaleX, scaleY);

    final paint = Paint()
      ..color = Colors.green.withValues(alpha: 0.55)
      ..style = PaintingStyle.fill;

    for (final country in countries) {
      final transformed = country.path.transform(matrix.storage);
      canvas.drawPath(transformed, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _CountriesPainter oldDelegate) {
    return oldDelegate.countries != countries;
  }
}