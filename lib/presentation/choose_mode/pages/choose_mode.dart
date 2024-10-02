import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/presentation/choose_mode/bloc/theme_cubit.dart';
import '../../../common/widgets/button/basic_app_button.dart';
import '../../../core/config/assets/app_images.dart';
import '../../../core/config/assets/app_vectors.dart';
import '../../../core/config/theme/app_colors.dart';

class ChooseModePage extends StatefulWidget {
  ChooseModePage({super.key});

  @override
  State<ChooseModePage> createState() => _ChooseModePageState();
}

class _ChooseModePageState extends State<ChooseModePage> {
  bool darkSelected = true;
  bool lightSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      AppImages.chooseModeBG,
                    ))),
          ),
          Container(
            color: Colors.black.withOpacity(0.15),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(AppVectors.logo),
                ),
                const Spacer(),
                const Text(
                  'Choose Mode',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.read<ThemeCubit>().updateTheme(ThemeMode.dark);
                            setState(() {
                              darkSelected = true;
                              lightSelected = false;
                            });
                          },
                          child: ClipOval(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                    color: const Color(0xff30393C).withOpacity(0.5),
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          color: darkSelected
                                              ? Colors.grey.shade300
                                              : Colors.transparent)
                                    ]),
                                child: SvgPicture.asset(
                                  AppVectors.moon,
                                  fit: BoxFit.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'Dark Mode',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 17, color: AppColors.grey),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.read<ThemeCubit>().updateTheme(ThemeMode.light);
                            setState(() {
                              darkSelected = false;
                              lightSelected = true;
                            });
                          },
                          child: ClipOval(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                    color: const Color(0xff30393C).withOpacity(0.5),
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          color: lightSelected
                                              ? Colors.grey.shade300
                                              : Colors.transparent)
                                    ]),
                                child: SvgPicture.asset(
                                  AppVectors.sun,
                                  fit: BoxFit.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'Light Mode',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 17, color: AppColors.grey),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                BasicAppButton(
                    onPressed: () {
                      //  Navigator.push(
                      //    context,
                      //    MaterialPageRoute(
                      //      builder: (BuildContext context) => const SignupOrSigninPage()
                      //    )
                      // );
                    },
                    title: 'Continue')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
