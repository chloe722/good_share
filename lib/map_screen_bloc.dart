import 'package:good_share/fixtures/locations.dart';
import 'package:good_share/models.dart';
import 'package:rxdart/subjects.dart';

class MapScreenBloc {
  final locationInFocus = BehaviorSubject<int>()..add(0);
  final locations = BehaviorSubject<List<LocationModel>>()
    ..add(locationFixtures);

  close() {
    locationInFocus.close();
    locations.close();
  }
}
