import 'base_request.dart';
import 'dio_client.dart';

class NormalRequest extends BaseRequest<NormalRequest> {
  final DioClient client;
  Map<String, dynamic> _data;

  NormalRequest(this.client) : super(client);

  BaseRequest addData(String dataKey, dynamic dataValue) {
    if (_data == null) {
      _data = {};
    }
    _data[dataKey] = dataValue;
    return this;
  }

  BaseRequest addDatas(Map<String, dynamic> map) {
    if (_data == null) {
      _data = {};
    }
    _data.addAll(map);
    return this;
  }

  @override
  Map<String, dynamic> generateData() {
    return _data;
  }
}
