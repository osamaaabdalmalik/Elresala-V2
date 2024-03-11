import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_images.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_routes.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_svgs.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_text_styles.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
import 'package:hiwayda_oracion_islamica/views/pages/LearnSalah/PracticalLearn/practical_learn_page.dart';
import 'package:hiwayda_oracion_islamica/views/pages/Qibla/qibla_compass.dart';
import 'package:hiwayda_oracion_islamica/views/widgets/platform_alert_dialog.dart';

import '../../../features/home/presentation/widgets/section_item_homeP_page_widget.dart';
import '../PrayerTimes/prayer_times_page.dart';
import 'LearnTahara/base_learn.dart';

class LearnSalah extends StatelessWidget {
  const LearnSalah({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) async => await showDialog(
          context: context,
          builder: (BuildContext context) => const PlatformAlertDialog(
                title: 'Salida?',
                content: 'Quieres salir?',
                defaultActionText: 'ok',
                cancelActionText: 'Cancelar',
              )),
      child: Scaffold(
        backgroundColor: AppColors.kPrimaryColor,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: 10.aEdge,
                    padding: 15.aEdge,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(AppImages.salah
                            //fit: BoxFit.fitWidth,
                            ),
                      ),
                      borderRadius: BorderRadius.circular(15),
                      // color: AppColors.kWhiteColor.withOpacity(0.6),
                    ),
                    width: context.width,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15), color: AppColors.kWhiteColor.withOpacity(0.1)),
                      child: Text(
                        'De Abdallah Ibn Masúd que dijo:\n\n'
                        '“Pregunté al Mensajero de Allah ﷺ : “¿Cuál es la obra más amada por Allah?”\n'
                        'Dijo: “Realizar la oración a su tiempo”. (en un otro relato: en su primer momento)........\n'
                        'Bujari y muslim',
                        style: AppTextStyles.h6amber,
                      ),
                    ),
                  ),
                  /*Container(
                    width: context.width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      // Image border
                      child: SizedBox.fromSize(
                          size: Size.fromRadius(context.width * 0.2),
                          // Image radius
                          child: Image.asset(
                            AppImages.salah,
                            fit: BoxFit.fitWidth,
                          )),
                    ),
                  ),*/
                  2.hSize,
                  const Text(
                    'Aprender Salah',
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  width: context.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: 8.aEdge,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SectionItemHomePageWidget(
                            onTap: () {
                              Get.to(const BaseLearn(isBasic: true));
                            },
                            sectionIcon: AppSvgs.salahrokoa,
                            sectionName: 'Educación teórica básica.',
                            sectionSubtitle: ''),
                        SectionItemHomePageWidget(
                          onTap: () {
                            Get.to(() => const PracticalLearnPage());
                          },
                          sectionIcon: AppSvgs.learnSalah,
                          sectionName: 'Practico Aprende a orar',
                          sectionSubtitle: '',
                        ),
                        SectionItemHomePageWidget(
                            onTap: () {
                              AppRoutes.routeTo(
                                  context,
                                  const BaseLearn(
                                    isBasic: false,
                                  ));
                            },
                            sectionIcon: AppSvgs.salahrokoa,
                            sectionName: 'Educación avanzada',
                            sectionSubtitle: ''),
                        SectionItemHomePageWidget(
                            onTap: () {
                              Get.to(() => const PermissionprayerPage());
                            },
                            sectionIcon: AppSvgs.prayerTimes,
                            sectionName: 'Tiempos de oracio\'n',
                            sectionSubtitle: ''),
                        SectionItemHomePageWidget(
                            onTap: () {
                              Get.to(() => const QiblaCompass());
                            },
                            sectionIcon: AppSvgs.qibla,
                            sectionName: 'Qibla',
                            sectionSubtitle: ''),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}