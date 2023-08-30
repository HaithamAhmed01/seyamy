import 'package:equatable/equatable.dart';
import 'package:seyamy/core/utils/app_assets.dart';

class OnBoardingModel extends Equatable {
  final List<OnBoardingDetails> onBoardingDetails;

  const OnBoardingModel({
    required this.onBoardingDetails,
  });

  @override
  List<Object?> get props => [
        onBoardingDetails,
      ];
}

class OnBoardingDetails extends Equatable {
  final String text;
  final String title;
  final String image;

  const OnBoardingDetails({
    required this.text,
    required this.title,
    required this.image,
  });

  @override
  List<Object?> get props => [
        text,
        title,
        image,
      ];
}

List<OnBoardingDetails> onBoarding = [
  const OnBoardingDetails(
    text: '“ وسيلة جديدة وسهله للتذكير بالصيام ”',
    title: 'مرحبا بك في تطبيق صيامي',
    image: Assets.imagesOnboarding1,
  ),
  const OnBoardingDetails(
    text:
        'يمكنك بكل بسهولة اضافة عدد الايام المراد صيامها ويقوم التطبيق تلقائيا بارسال اشعارات يوميا للتنبيه بصيام هذه الايام وتقل تدريجيا بتأكيد صيامها ',
    title: 'سهولة في الاستخدام',
    image: Assets.imagesOnboarding2,
  ),
  const OnBoardingDetails(
    text:
        'يمكنكم ايضا الحصول علي اشعارات للتذكير بصيام النوافل اقتداءً بسنة النبي الكريم صلي الله عليه وسلم',
    title: 'المزيد من المميزات',
    image: Assets.imagesOnboarding3,
  ),
];
