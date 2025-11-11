class RuleResult {
  final int prediction;
  final String rule;

  RuleResult(this.prediction, this.rule);
}

RuleResult classifyDiabetes({
  required int age,
  required double glucose,
  required double bmi,
  required double dpf,
}) {
  // --- Rules for 1.0 ---
  if (glucose > 101 && glucose <= 154 && bmi > 43.3 && age > 29) {
    return RuleResult(1, "Rule 1 for 1.0 → Glucose>101 ≤154, BMI>43.3, Age>29");
  }
  if (glucose > 154) {
    return RuleResult(1, "Rule 2 for 1.0 → Glucose>154");
  }
  if (glucose > 101 && bmi > 26.7 && dpf > 0.464 && age > 29) {
    return RuleResult(
      1,
      "Rule 3 for 1.0 → Glucose>101, BMI>26.7, DPF>0.464, Age>29",
    );
  }

  // --- Rules for 0.0 ---
  if (glucose <= 154 && bmi <= 26.7) {
    return RuleResult(0, "Rule 1 for 0.0 → Glucose≤154, BMI≤26.7");
  }
  if (glucose <= 101) {
    return RuleResult(0, "Rule 2 for 0.0 → Glucose≤101");
  }
  if (glucose <= 154 && age <= 29) {
    return RuleResult(0, "Rule 3 for 0.0 → Glucose≤154, Age≤29");
  }
  if (dpf > 0.287 && dpf <= 0.307) {
    return RuleResult(0, "Rule 4 for 0.0 → 0.287<DPF≤0.307");
  }
  if (glucose <= 154 && bmi <= 43.3 && dpf <= 0.464) {
    return RuleResult(0, "Rule 5 for 0.0 → Glucose≤154, BMI≤43.3, DPF≤0.464");
  }

  // Default
  return RuleResult(0, "Default: No matching rule (→ 0)");
}
