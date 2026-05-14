import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:zentea/data/paths/country_path_model.dart';
import 'package:zentea/data/paths/paths_of_countries.dart';

const svgW = 1009.6727;
const svgH = 665.96301;

class Map extends StatelessWidget {
  const Map({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
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
              size: size,
            ),
          ),
        ),
      ],
    );
  }
}

class _CountriesPainter extends CustomPainter {
  final List<CountryPathModel> countries;
  final Size size;

  const _CountriesPainter(this.countries, {required this.size});

  @override
  void paint(Canvas canvas, Size _) {
    const svgW = 1009.6727;
    const svgH = 665.96301;

    final matrix = Matrix4.identity()
      ..scale(
        size.width / svgW,
        size.height / svgH,
      );

    final paint = Paint()
      ..color = Colors.red.withValues(alpha: 0.4)
      ..style = PaintingStyle.fill;

    for (final country in countries) {
      final path = country.path.transform(matrix.storage);
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _CountriesPainter oldDelegate) =>
      oldDelegate.countries != countries || oldDelegate.size != size;
}