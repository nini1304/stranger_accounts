// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// class PaymentMCubit extends Cubit<PaymentMethodsState> {
//   PaymentMCubit() : super(const PaymentMethodsState());

//   Future<void> getPaymentMethods() async {
//     //para mantener la data segura
//     final storage = FlutterSecureStorage();
//     // Le digo al frontend que estamos iniciando el proceso de login para eso usamos el estado loading de PageStatus
//     emit(state.copyWith(status: PageStatus.loading));
//     try {
//       // Aquí iría la llamada a la API para hacer el login
//       // Si el login es exitoso, guardamos el token en el storage
//       LoginResponseDto response = await LoginService.login(username, password);
//       // Si la autenticación fue exitosa Guardar el token y refresh
//       await storage
