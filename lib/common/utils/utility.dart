import 'dart:developer' as developer;

void cprint(dynamic data, {String? errorIn, String? event, String? warningIn}) {
  if (errorIn != null) {
    developer.log('[Error]', time: DateTime.now(), error: data, name: errorIn);
  } else if (data != null) {
    developer.log(
      data.toString(),
      time: DateTime.now(),
      name: warningIn ?? '',
    );
  }
}
