import 'package:equatable/equatable.dart';
import '../dto/ItemDto.dart';
import 'PageStatus.dart';

class ItemState extends Equatable {
  final PageStatus status;
  final List<ItemDto> data;
  final String? errorMessage;

  const ItemState({
    this.status = PageStatus.initial,
    this.data = const [],
    this.errorMessage,
  });

  ItemState copyWith({
    PageStatus? status,
    List<ItemDto>? data,
    String? errorMessage,
  }) {
    return ItemState(
      status: status ?? this.status,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        data,
        errorMessage,
      ];
}
