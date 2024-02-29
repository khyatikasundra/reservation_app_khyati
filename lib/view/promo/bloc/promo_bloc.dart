import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'promo_event.dart';
part 'promo_state.dart';

class PromoBloc extends Bloc<PromoEvent, PromoState> {
  PromoBloc() : super(PromoInitial()) {
    on<PromoEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
