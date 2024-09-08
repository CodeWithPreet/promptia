import 'package:form_builder_validators/form_builder_validators.dart';

class Validator {
  // Validator for required title fields
  static String? requiredTitle(String? value) {
    return FormBuilderValidators.compose([
      FormBuilderValidators.required(),
      FormBuilderValidators.minLength(5),
      FormBuilderValidators.maxLength(50),
    ])(value);
  }

  // Validator for required prompt fields
  static String? requiredPrompt(String? value) {
    return FormBuilderValidators.compose([
      FormBuilderValidators.required(),
      FormBuilderValidators.minLength(30),
      FormBuilderValidators.maxLength(500),
    ])(value);
  }

  // Validator for required fields
  static String? required(String? value) {
    return FormBuilderValidators.required()(value);
  }

  // Validator for email fields
  static String? email(String? value) {
    return FormBuilderValidators.compose([
      FormBuilderValidators.required(),
      FormBuilderValidators.email(),
    ])(value);
  }

  // Validator for passwords with minimum length
  static String? password(String? value) {
    return FormBuilderValidators.compose([
      FormBuilderValidators.required(),
      FormBuilderValidators.minLength(8),
      FormBuilderValidators.maxLength(20),
    ])(value);
  }

  // Custom validator for confirming passwords
  static String? confirmPassword(String? value, String? otherPassword) {
    if (value != otherPassword) {
      return 'Passwords do not match';
    }
    return null;
  }
}
