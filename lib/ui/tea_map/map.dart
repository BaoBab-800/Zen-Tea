import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:zentea/data/paths/country_path_model.dart';
import 'package:zentea/data/paths/paths_of_countries.dart';

class Map extends StatelessWidget {
  final List<CountryPathModel> countries;

  const Map({
    super.key,
    required this.countries,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _CountriesPainter(countries),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final size = Size(
            constraints.maxWidth,
            constraints.maxHeight,
          );

          return SizedBox(
            width: size.width,
            height: size.height,
            child: _MapContent(size: size),
          );
        },
      ),
    );
  }
}

class _MapContent extends StatelessWidget {
  final Size size;

  const _MapContent({required this.size});

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
              pathsOfCountries,
            ),
          ),
        ),
      ],
    );
  }
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
      ..color = Colors.red.withValues(alpha: 0.4)
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