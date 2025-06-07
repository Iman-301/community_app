import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/user_model.dart';
import '../../data/repositories/auth_repository.dart';
import 'package:dio/dio.dart';

// Dio provider
final dioProvider = Provider<Dio>((ref) {
  return Dio(BaseOptions(baseUrl: 'http://localhost:5000/api'));
});

// DO NOT redefine authRepositoryProvider! Use the generated one.

final authProvider = StateNotifierProvider<AuthNotifier, AsyncValue<UserModel?>>((ref) {
  final repo = ref.watch(authRepositoryProvider(ref.watch(dioProvider)).notifier);
  return AuthNotifier(repo);
});

class AuthNotifier extends StateNotifier<AsyncValue<UserModel?>> {
  final AuthRepository repo;
  String? _token;

  AuthNotifier(this.repo) : super(const AsyncValue.data(null));

  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();
    final result = await repo.login(email: email, password: password);
    if (result != null && result['user'] != null) {
      _token = result['token'];
      state = AsyncValue.data(UserModel.fromJson(result['user']));
    } else {
      state = AsyncValue.error('Login failed', StackTrace.current);
    }
  }

  Future<void> register(Map<String, dynamic> data) async {
    state = const AsyncValue.loading();
    final result = await repo.register(data: data);
    if (result != null && result['user'] != null) {
      _token = result['token'];
      state = AsyncValue.data(UserModel.fromJson(result['user']));
    } else {
      state = AsyncValue.error('Registration failed', StackTrace.current);
    }
  }

  Future<void> getMe() async {
    if (_token == null) {
      state = const AsyncValue.data(null);
      return;
    }
    state = const AsyncValue.loading();
    final user = await repo.getMe(token: _token!);
    if (user != null) {
      state = AsyncValue.data(user);
    } else {
      state = AsyncValue.error('Failed to fetch user', StackTrace.current);
    }
  }
}