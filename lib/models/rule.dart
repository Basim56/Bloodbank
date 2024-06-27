class Rule {
  final String antecedents;
  final String consequents;
  final double confidence;

  Rule(this.antecedents, this.consequents, this.confidence);

  factory Rule.fromJson(Map<String, dynamic> json) {
    return Rule(
      json['antecedents'],
      json['consequents'],
      (json['confidence'] as num).toDouble(),
    );
  }
}
