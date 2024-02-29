part of 'promo_bloc.dart';

sealed class PromoState extends Equatable {
  const PromoState();
  
  @override
  List<Object> get props => [];
}

final class PromoInitial extends PromoState {}
