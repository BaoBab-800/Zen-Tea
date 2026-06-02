import 'package:zentea/services/storage/i_key_value_storage.dart';
import 'package:zentea/services/welcome_dialog/i_welcome_dialog_service.dart';

class WelcomeDialogService implements IWelcomeDialogService {
  static const _hasSeenDialogKey = 'has_seen_dialog';

  final IKeyValueStorage _storage;
  bool? _hasSeenDialog;

  WelcomeDialogService(this._storage);

  @override
  Future<bool> consumeWelcomeDialogIfNeeded() async {
    final cachedHasSeenDialog = _hasSeenDialog;
    final hasSeenDialog = cachedHasSeenDialog ??
        (await _storage.get<bool>(_hasSeenDialogKey) ?? false);

    if (hasSeenDialog) {
      _hasSeenDialog = true;
      return false;
    }

    _hasSeenDialog = true;
    await _storage.put<bool>(_hasSeenDialogKey, true);
    return true;
  }
}
