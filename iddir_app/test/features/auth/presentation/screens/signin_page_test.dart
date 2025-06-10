import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iddir_app/core/widgets/button.dart';
import 'package:iddir_app/features/auth/data/models/user_model.dart';
import 'package:iddir_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:iddir_app/features/auth/presentation/screens/signin_page.dart';
import 'package:iddir_app/features/profile/presentation/providers/profile_provider.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([AuthNotifier, ProfileNotifier])
import 'signin_page_test.mocks.dart';

void main() {
  late MockAuthNotifier mockAuthNotifier;
  late MockProfileNotifier mockProfileNotifier;
  late ProviderContainer container;

  final testUser = UserModel(
    id: '1',
    name: 'Test User',
    email: 'test@example.com',
    role: 'user',
  );

  setUp(() {
    mockAuthNotifier = MockAuthNotifier();
    mockProfileNotifier = MockProfileNotifier();

    container = ProviderContainer(
      overrides: [
        authProvider.overrideWith((ref) => mockAuthNotifier),
        profileProvider.overrideWith((ref) => mockProfileNotifier),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  Widget createWidgetUnderTest() {
    return UncontrolledProviderScope(
      container: container,
      child: MaterialApp(
        home: const SigninPage(),
        routes: {
          '/announcement': (context) => const Scaffold(body: Text('Announcement Page')),
          '/admin-announcement': (context) => const Scaffold(body: Text('Admin Announcement Page')),
        },
      ),
    );
  }

  // Helper function to find text fields
  Future<void> enterCredentials(WidgetTester tester, String email, String password) async {
    // Find text fields by their label text
    final emailField = find.byWidgetPredicate(
      (widget) => widget is CustomTextField && widget.labelText == 'Email',
    );
    final passwordField = find.byWidgetPredicate(
      (widget) => widget is CustomTextField && widget.labelText == 'Password',
    );

    // Enter text
    await tester.enterText(emailField, email);
    await tester.enterText(passwordField, password);
    await tester.pump();
  }

  group('SigninPage Widget Tests', () {
    testWidgets('renders all UI elements correctly', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      // Verify header elements
      expect(find.text('Signin'), findsOneWidget);
      expect(find.byType(GestureDetector), findsOneWidget);

      // Verify form elements
      expect(find.byType(CustomTextField), findsNWidgets(2));
      expect(find.text('Log in'), findsOneWidget);
      expect(find.text('Email'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
    });

    testWidgets('handles text input correctly', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      await enterCredentials(tester, 'test@example.com', 'password123');

      // Verify entered text
      expect(find.text('test@example.com'), findsOneWidget);
      expect(find.text('password123'), findsOneWidget);
    });

    testWidgets('shows loading indicator during login', (WidgetTester tester) async {
      when(mockAuthNotifier.login(any, any)).thenAnswer((_) async {
        await Future.delayed(const Duration(milliseconds: 100));
        container.read(authProvider.notifier).state = AsyncData(testUser);
      });

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      await enterCredentials(tester, 'test@example.com', 'password123');

      // Tap login button
      await tester.tap(find.text('Log in'));
      await tester.pump();

      // Verify loading indicator
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('navigates to announcement page on successful user login',
        (WidgetTester tester) async {
      when(mockAuthNotifier.login(any, any)).thenAnswer((_) async {
        container.read(authProvider.notifier).state = AsyncData(testUser);
      });
      when(mockProfileNotifier.initializeProfile()).thenAnswer((_) async {});

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      await enterCredentials(tester, 'test@example.com', 'password123');

      // Tap login button
      await tester.tap(find.text('Log in'));
      await tester.pumpAndSettle();

      // Verify navigation
      expect(find.text('Announcement Page'), findsOneWidget);
      verify(mockAuthNotifier.login('test@example.com', 'password123')).called(1);
      verify(mockProfileNotifier.initializeProfile()).called(1);
    });

    testWidgets('navigates to admin announcement page on successful admin login',
        (WidgetTester tester) async {
      final adminUser = UserModel(
        id: '1',
        name: 'Admin User',
        email: 'admin@example.com',
        role: 'admin',
      );

      when(mockAuthNotifier.login(any, any)).thenAnswer((_) async {
        container.read(authProvider.notifier).state = AsyncData(adminUser);
      });
      when(mockProfileNotifier.initializeProfile()).thenAnswer((_) async {});

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      await enterCredentials(tester, 'admin@example.com', 'password123');

      // Tap login button
      await tester.tap(find.text('Log in'));
      await tester.pumpAndSettle();

      // Verify navigation
      expect(find.text('Admin Announcement Page'), findsOneWidget);
      verify(mockAuthNotifier.login('admin@example.com', 'password123')).called(1);
      verify(mockProfileNotifier.initializeProfile()).called(1);
    });

    testWidgets('shows error message on login failure', (WidgetTester tester) async {
      when(mockAuthNotifier.login(any, any)).thenAnswer((_) async {
        container.read(authProvider.notifier).state = AsyncError(
          Exception('Invalid credentials'),
          StackTrace.current,
        );
      });

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      await enterCredentials(tester, 'test@example.com', 'wrongpassword');

      // Tap login button
      await tester.tap(find.text('Log in'));
      await tester.pumpAndSettle();

      // Verify error message
      expect(find.text('Exception: Invalid credentials'), findsOneWidget);
    });

    testWidgets('handles back button navigation', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      // Find and tap back button
      final backButton = find.byType(GestureDetector).first;
      expect(backButton, findsOneWidget);
      await tester.tap(backButton);
      await tester.pumpAndSettle();

      // Verify navigation (SigninPage should be popped)
      expect(find.byType(SigninPage), findsNothing);
    });

    testWidgets('clears form after successful login', (WidgetTester tester) async {
      when(mockAuthNotifier.login(any, any)).thenAnswer((_) async {
        container.read(authProvider.notifier).state = AsyncData(testUser);
      });
      when(mockProfileNotifier.initializeProfile()).thenAnswer((_) async {});

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      await enterCredentials(tester, 'test@example.com', 'password123');

      // Verify fields are filled
      expect(find.text('test@example.com'), findsOneWidget);
      expect(find.text('password123'), findsOneWidget);

      // Tap login button
      await tester.tap(find.text('Log in'));
      await tester.pumpAndSettle();

      // Verify navigation
      expect(find.text('Announcement Page'), findsOneWidget);

      // Navigate back to signin page
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      // Verify form is cleared
      expect(find.text('test@example.com'), findsNothing);
      expect(find.text('password123'), findsNothing);
    });
  });
}
