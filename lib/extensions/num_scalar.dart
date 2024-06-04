import 'package:real_estate/ui/common/device_scaler.dart';

extension NumScaler on num {
  double get scale => DeviceScaler().scale(toDouble());
  double get sf => DeviceScaler().scaleFont(toDouble());
}
