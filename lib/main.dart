import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/DI/getx_di.dart';
import 'core/services/app_router.dart';

void main() {
  runApp(const MyApp());
}

//Create UI
//Refresh Indicator
//Api Get Posts
//Show Details
//Create Search
//Use DI
//Use GetX

/// Create Pagination
/// Create Animation
/// Unit Testing

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialBinding: AppBindings(),
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.transparent,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.light().textTheme,
          ),
        ),
        getPages: AppRouter.pages,
      ),
    );
  }
}
