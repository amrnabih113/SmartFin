import 'package:smartFin/features/onboarding/domain/entities/onboarding_entity.dart';

class OnboardingModel extends OnboardingEntity {
  OnboardingModel(
      {required super.image, required super.title, required super.subtitle});

  factory OnboardingModel.fromJson(Map<String, dynamic> json) =>
      OnboardingModel(
          image: json['image'],
          title: json['title'],
          subtitle: json['subtitle']);

  Map<String, dynamic> toJson() => {
        'image': image,
        'title': title,
        'subtitle': subtitle,
      };

  OnboardingEntity toEntity() => OnboardingEntity(
      image: image, title: title, subtitle: subtitle);
}

