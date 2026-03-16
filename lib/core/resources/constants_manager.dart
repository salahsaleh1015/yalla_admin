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