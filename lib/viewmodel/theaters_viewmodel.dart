import 'package:fbl/base/baseviewmodel.dart';
import 'package:fbl/base/http/http.dart';
import 'package:fbl/common/constants/urlconst.dart';
import 'package:fbl/model/TheatersVo.dart';

class TheatersViewModel extends BaseViewModel {
  TheatersVo theaters;
  load() {
    Http.get(Urls.theaters, {}, success: (json) {
      theaters = TheatersVo.fromJson(json);
    });
  }
}
