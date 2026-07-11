import 'package:crafty_bay/app/providers/auth_controller.dart';
import 'package:crafty_bay/core/service/network_caller/network_caller.dart';

NetworkCaller getNetworkCaller() {
  // Map<String, String> headers = {'content-type': 'application/json'};
  // if (AuthController.accessToken != null) {
  //   headers['token'] = AuthController.accessToken!;
  // }
  //
  // return NetworkCaller(headers: () => headers);

  return NetworkCaller(
    headers: () => {
      'content-type': 'application/json',
      if (AuthController.accessToken != null)
        'token': AuthController.accessToken!,
    },
  );
}

/// Uses
// NetworkResponse response = await getNetworkCaller().getRequest('url');
// if (response.isSuccess) {
//
// } else {
// response.errorMessage!
// }
