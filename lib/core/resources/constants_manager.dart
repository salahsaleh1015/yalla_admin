class AppConstant{

  static const int maxLinesOfOrderDetails = 10;
  static const int managementTabBarLength = 3;

  static  String? Function(String?)? emailValidation = (val) {
    if (val == null || val.isEmpty) {
      return "ادخل البريد الالكتروني";
    }

    // Email Regex
    final emailRegex = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    );

    if (!emailRegex.hasMatch(val.trim())) {
      return "ادخل البريد الالكتروني بشكل صحيح";
    }

    return null;
  };


  static  String? Function(String?)? phoneValidation = (value) {
    if (value != null && value.isNotEmpty) {

      final normalized = normalizeArabicNumbers(value.replaceAll(" ", ""));

      final regex = RegExp(r'^01[0-2,5]{1}[0-9]{8}$');
      if (!regex.hasMatch(normalized)) {
        return "أدخل رقم هاتف مصري صحيح مثل 01012345678";
      }
    }
    return null;
  };




  static  String? Function(String?)? rateValidator = (String? val) {
    // 1. التأكد أن الحقل ليس فارغاً
    if (val == null || val.isEmpty) {
      return "ادخل القيمه الصحيحه";
    }

    // 2. محاولة تحويل النص إلى رقم
    final score = int.tryParse(val);

    // 3. التأكد أنه رقم صحيح ومن 1 إلى 5
    if (score == null) {
      return "يرجى إدخال رقم صحيح فقط";
    }
    if (score < 1 || score > 5) {
      return "التقييم يجب أن يكون بين 1 و 5";
    }

    return null;
  };
}


String normalizeArabicNumbers(String input) {
  const arabicToEnglish = {
    '٠': '0',
    '١': '1',
    '٢': '2',
    '٣': '3',
    '٤': '4',
    '٥': '5',
    '٦': '6',
    '٧': '7',
    '٨': '8',
    '٩': '9',
  };

  return input.split('').map((char) {
    return arabicToEnglish[char] ?? char;
  }).join();




}