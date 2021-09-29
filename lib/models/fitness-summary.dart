class FitnessSummary {
  int id;
  // ignore: non_constant_identifier_names
  double BMI;
  double weight;
  double muscleRatio;
  double height;
  double fatRatio;
  double fitnessRatio;
  double totalBodyWater;
  double dryLeanBath;
  double bodyFatMass;
  double opacityRatio;
  double protein;
  // ignore: non_constant_identifier_names
  double SMM;
  String updatedAt;
  String memberName;

  FitnessSummary({
    this.id,
    this.BMI,
    this.SMM,
    this.bodyFatMass,
    this.dryLeanBath,
    this.fatRatio,
    this.fitnessRatio,
    this.height,
    this.muscleRatio,
    this.opacityRatio,
    this.protein,
    this.totalBodyWater,
    this.weight,
    this.updatedAt,
    this.memberName,
  });

  factory FitnessSummary.fromJson(Map<String, dynamic> json) {
    return FitnessSummary(
      id: json['id'],
      BMI: json['BMI'],
      weight: json['weight'],
      muscleRatio: json['muscle_ratio'],
      height: json['height'],
      fatRatio: json['fat_ratio'],
      fitnessRatio: json['fitness_ratio'],
      totalBodyWater: json['total_body_water'],
      dryLeanBath: json['dry_lean_bath'],
      bodyFatMass: json['body_fat_mass'],
      opacityRatio: json['opacity_ratio'],
      protein: json['protein'],
      SMM: json['SMM'],
      updatedAt: json['updated_at'],
      memberName: json['name'] ?? '',
    );
  }
}
