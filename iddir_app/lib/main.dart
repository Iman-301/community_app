import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iddir_app/admin_announcements_page.dart';
import 'package:iddir_app/features/auth/presentation/screens/profile_page.dart';
import 'package:iddir_app/features/auth/presentation/screens/signin_page.dart';
import 'package:iddir_app/features/auth/presentation/screens/signup_page.dart';
import 'package:iddir_app/member_management_detail_page.dart';
import 'package:iddir_app/onboarding_page.dart';
import 'package:iddir_app/otp_verification_page.dart';
import 'package:iddir_app/profile_form_page.dart';
import 'package:iddir_app/service_request_page.dart';
import 'package:iddir_app/splash_screen.dart';
import 'announcement_page.dart' show AnnouncementPage;
import 'package:iddir_app/add_announcement_page.dart';
import 'package:iddir_app/financial_management_page.dart';
import 'package:iddir_app/event_approval_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:iddir_app/features/auth/presentation/providers/auth_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  final prefs = await SharedPreferences.getInstance();
  
  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Iddir',
      initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/onboarding': (context) => const Onboarding(),
          '/register': (context) =>  SignUpPage(),
          '/otp-verification': (context) => OtpVerificationPage(),
          '/signin': (context) => const SigninPage(),
          '/announcement': (context) => const AnnouncementPage(), 
          '/profile': (context) => const ProfilePage(),
          '/profile-form': (context) => const ProfileFormPage(),
          '/service-request': (context) => const ServiceRequestPage(),
          '/member-management': (context) => const MemberManagementDetailPage(), 
          '/admin-announcement': (context) => const AdminAnnouncementsPage(),
          '/add-announcement': (context) => const AddAnnouncementPage(),
          '/financial-management': (context) => const FinancialManagementPage(),
          '/event-approval': (context)=> const EventApprovalPage()

        },
    );
  }
}


