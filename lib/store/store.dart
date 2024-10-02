import 'package:redux/redux.dart';
import '/models/app_state.dart';
import '/reducers/app_reducer.dart';

// Membuat inisialisasi Store dengan menggunakan appReducer dan state awal
final store = Store<AppState>(
  appReducer,
  initialState: AppState.initialState(),
);
