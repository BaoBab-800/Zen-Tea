import 'package:zentea/l10n/generated/app_localizations.dart';
import 'package:zentea/core/theme/app_palette.dart';

extension AppPaletteTypeX on AppPaletteType {
  String label(AppLocalizations l10n) => switch (this) {
    AppPaletteType.orange => l10n.orange,
    AppPaletteType.green => l10n.green,
  };
}
