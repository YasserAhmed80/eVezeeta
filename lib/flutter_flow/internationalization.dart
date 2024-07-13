import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['ar', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? arText = '',
    String? enText = '',
  }) =>
      [arText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // login
  {
    'mmtzs3pc': {
      'ar': 'من فضلك ... سجل بيانات الدخول',
      'en': 'Please... Register your login details',
    },
    '2b3tu2tf': {
      'ar': 'البريد الاليكتروني',
      'en': 'E-mail',
    },
    '4tahq65f': {
      'ar': '',
      'en': '',
    },
    '4k0o0v9m': {
      'ar': 'كلمه المرور',
      'en': 'password',
    },
    'mbd18kf1': {
      'ar': '',
      'en': '',
    },
    '2k6yfsd7': {
      'ar': 'تسجيل',
      'en': 'registration',
    },
    'm8ynqm4f': {
      'ar': 'هل نسيت كلمة المرور ... اضغط هنا',
      'en': 'Forgot your password? Click here',
    },
    'ylusi3yg': {
      'ar': 'يمكنك التسجيل عن طريق  ',
      'en': 'You can register via',
    },
    '8xrq1lb7': {
      'ar': 'تسجيل بواسطة جوجل',
      'en': 'Register with Google',
    },
    'lxuugrkf': {
      'ar': 'تسجيل بواسطة ابل',
      'en': 'Register with Apple',
    },
    '7ensyeii': {
      'ar': 'login',
      'en': 'login',
    },
  },
  // Onboarding01
  {
    '9rbskk2w': {
      'ar': 'مرحبا بيكم',
      'en': 'welcome',
    },
    '0hz2qnow': {
      'ar': 'منصة تعارف آمن بمنهج علمي لتحقيق زواج ناجح',
      'en':
          'A safe dating platform with a scientific approach to achieve a successful marriage',
    },
    'vn1dbwt6': {
      'ar': 'انشاء حساب جديد',
      'en': 'Create a new account',
    },
    '7459r62u': {
      'ar': 'تسجيل الدخول',
      'en': 'sign in',
    },
    'wcmrbk29': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // appSettings
  {
    '6yhu1gmm': {
      'ar': 'تغير اعدادات التطبيق',
      'en': 'Change application settings',
    },
    'nbzq4bgj': {
      'ar': 'يمكن تغير الاعدادات العامة من هنا',
      'en': 'General settings can be changed from here',
    },
    'i1xngnkt': {
      'ar': 'تغير اللغة',
      'en': 'change the language',
    },
    'fiha96f0': {
      'ar': 'تغير اللغة الي العربيه او الانجليزية',
      'en': 'Change the language to Arabic or English',
    },
    'ogdv0dqu': {
      'ar': 'تغير الي الوضع الليلي',
      'en': 'Change to night mode',
    },
    'fumvhh72': {
      'ar': 'تغير اعدادات من الوضع ليلا او نهارا',
      'en': 'Change settings for day or night mode',
    },
    '2rtdap9j': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // doctor_data_main
  {
    '8dwjbrx4': {
      'ar': 'المعلومات الشخصية',
      'en': 'personal information',
    },
    '7s6gi8uu': {
      'ar': 'الاسم كامل',
      'en': 'Full Name',
    },
    'izwsz2k2': {
      'ar': 'النوع',
      'en': 'Type',
    },
    'cgudykpx': {
      'ar': 'دكتور',
      'en': 'doctor',
    },
    'f8fhku49': {
      'ar': 'دكتورة',
      'en': 'female doctor',
    },
    'fxzrnu78': {
      'ar': 'اللقب المهني',
      'en': 'Professional title',
    },
    '8o7ug2yh': {
      'ar': 'أستاذ',
      'en': 'Mr',
    },
    'zjgjh0yg': {
      'ar': 'مدرس',
      'en': 'Teacher',
    },
    'iupucnt8': {
      'ar': 'أخصائي',
      'en': 'specialist',
    },
    'y3izu3yh': {
      'ar': 'استشاري',
      'en': 'Advisor',
    },
    '8rzau5l8': {
      'ar': 'اللقب المهني كامل ',
      'en': 'Full professional title',
    },
    'yh1dvx8k': {
      'ar': 'معلومات عنك',
      'en': 'information about you',
    },
    'unkdvfww': {
      'ar': 'معلومات عنك',
      'en': 'information about you',
    },
    'colegrlm': {
      'ar': 'التخصص الرئيسي',
      'en': 'Main specialty',
    },
    'dv0oiqps': {
      'ar': 'Option 1',
      'en': 'Option 1',
    },
    'umljheqw': {
      'ar': 'من فضلك اختار التخصص',
      'en': 'Please choose your specialty',
    },
    '9et69ohs': {
      'ar': 'اختار التخصص الرئيسي',
      'en': 'Sister main specialty',
    },
    '6hwqf5z6': {
      'ar': 'التخصص الفرعي',
      'en': 'Subspecialty',
    },
    'r2angc5b': {
      'ar': 'حفظ البانات',
      'en': 'Save data',
    },
    'wpiz9b8i': {
      'ar': 'من فضلك ادخل اسمك كامل',
      'en': '',
    },
    '2nfyz3v8': {
      'ar': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '6wm72l75': {
      'ar': 'من فضلم ادخل لقبك المهني',
      'en': '',
    },
    'dak8g6t9': {
      'ar': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '4570g8p3': {
      'ar': 'من فضلك اكتب بعض المعلومات عنك',
      'en': '',
    },
    'a9kf89oi': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    '36ztx53p': {
      'ar': 'بيانات الطبيب الاساسية',
      'en': 'Basic doctor information',
    },
    '229rzvtz': {
      'ar': 'Save',
      'en': '',
    },
    '0jhzugac': {
      'ar': 'main',
      'en': 'Home',
    },
  },
  // doctor_data_address
  {
    'mn65y5fg': {
      'ar': 'عنوان العمل',
      'en': 'personal information',
    },
    'tpioyxvu': {
      'ar': 'Option 1',
      'en': '',
    },
    'o18jjifm': {
      'ar': '544545',
      'en': '',
    },
    '4yr1vpwp': {
      'ar': 'البلد',
      'en': '',
    },
    'pin0z8yp': {
      'ar': 'Search for an item...',
      'en': '',
    },
    'o8gcmhfx': {
      'ar': 'rttrtrtrtr',
      'en': '',
    },
    '31ybbkso': {
      'ar': 'hkjh',
      'en': '',
    },
    'gx6jm4zr': {
      'ar': 'المحافظة',
      'en': '',
    },
    'xmcegdz5': {
      'ar': 'اختار المحافظة',
      'en': '',
    },
    '9u51dwbp': {
      'ar': 'Option 1',
      'en': '',
    },
    'yzudth5d': {
      'ar': '544545',
      'en': '',
    },
    'nbr48oan': {
      'ar': 'المنطقة / المركز',
      'en': '',
    },
    'onqssuu2': {
      'ar': 'اختار المنطقة',
      'en': '',
    },
    'jnsaxmuk': {
      'ar': 'Option 1',
      'en': '',
    },
    'icvimrzq': {
      'ar': '544545',
      'en': '',
    },
    '6b0nzqut': {
      'ar': 'الحي',
      'en': '',
    },
    'pm4psr0u': {
      'ar': 'اختار الحي',
      'en': '',
    },
    'lno0cklc': {
      'ar': 'العنوان (الشارع و المبني)',
      'en': 'Full professional title',
    },
    'n3k69oum': {
      'ar': 'تليفونات الحجز',
      'en': 'Subspecialty',
    },
    'rjy1mmws': {
      'ar': 'تليفون عمل 1',
      'en': 'Full professional title',
    },
    '5hmaj61p': {
      'ar': 'تليفون عمل 2 ',
      'en': 'Full professional title',
    },
    'a2puizon': {
      'ar': 'موقع العمل علي الخريطة',
      'en': 'Professional title',
    },
    'y15qo9sj': {
      'ar': 'Map will be shwon here ',
      'en': '',
    },
    'l98y3n2a': {
      'ar': 'حفظ البانات',
      'en': 'Save data',
    },
    '6z4kdjmt': {
      'ar': 'من فضلك ادخل عنوان الشارع و المبني',
      'en': '',
    },
    'bjpmmgis': {
      'ar': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'swbyk6o7': {
      'ar': 'من فضلك ادخل تليفون 1',
      'en': '',
    },
    '53enuda5': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    'wg1mjq5j': {
      'ar': 'من فضلك ادخل تليفون 2 ',
      'en': '',
    },
    'jh7zlt2c': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    '8kjzlm0z': {
      'ar': 'ادخل عنوان العمل',
      'en': 'Basic doctor information',
    },
    '9ydlp7cy': {
      'ar': 'Save',
      'en': '',
    },
    '54hdqaol': {
      'ar': 'address',
      'en': 'Home',
    },
  },
  // doctor_data_images
  {
    'c1uxqt35': {
      'ar': 'صورة الطبيب',
      'en': '',
    },
    'erp0r5xv': {
      'ar': 'صور العيادة',
      'en': '',
    },
    'h0mvthzk': {
      'ar': '1',
      'en': '',
    },
    'myvv12n7': {
      'ar': '2',
      'en': '',
    },
    '1qrdz17y': {
      'ar': 'صورة إثبات بطاقة مزاولة المهنة*',
      'en': '',
    },
    'g1qvau7w': {
      'ar': 'صورة إثبات اللقب المهني ',
      'en': '',
    },
    'jx7kwnlm': {
      'ar': 'ادخال صور العمل',
      'en': 'Page Title',
    },
    'e1umpmqd': {
      'ar': 'Shop',
      'en': 'Shop',
    },
  },
  // doctor_List
  {
    'hcx1qnsu': {
      'ar': 'بحث عن دكتور',
      'en': '',
    },
    'mk3ixzfg': {
      'ar': 'Patients matching search',
      'en': '',
    },
    'as03cqmg': {
      'ar': '24',
      'en': '',
    },
    'xusv17x9': {
      'ar': 'قائمة الاطباء',
      'en': '',
    },
    'zrwrju63': {
      'ar': 'Home',
      'en': '',
    },
  },
  // testAppstate
  {
    'mu62r1ss': {
      'ar': 'Page Title',
      'en': '',
    },
    'mxas0rf6': {
      'ar': 'Button',
      'en': '',
    },
    'rmxrt49s': {
      'ar': 'Home',
      'en': '',
    },
  },
  // doctor_data_schedule
  {
    'je4d3pi9': {
      'ar': 'تحديد نوع الحجز',
      'en': '',
    },
    'y13ugeif': {
      'ar': 'الحجز مسبقا و الدخول بأسبقية الحضور',
      'en': '',
    },
    '8znwf8sh': {
      'ar': 'Option 1',
      'en': '',
    },
    'e8s704tv': {
      'ar': 'Option 1',
      'en': '',
    },
    'k05jud6y': {
      'ar': 'الدخول بميعاد محدد',
      'en': '',
    },
    'ack7v2zu': {
      'ar': 'سعر الكشف',
      'en': '',
    },
    '8e4f1sar': {
      'ar': 'سعر الكشف',
      'en': '',
    },
    'zci0rcuq': {
      'ar': '200',
      'en': '',
    },
    'sp1i0d4e': {
      'ar': 'متوسط عدد الكشوفات في الساعة',
      'en': '',
    },
    '764t5gdr': {
      'ar': 'عدد الكشوفات',
      'en': '',
    },
    'gyf54g18': {
      'ar': '1',
      'en': '',
    },
    'jea1h2ss': {
      'ar': 'تحديد مواعيد العمل',
      'en': '',
    },
    's12hc0up': {
      'ar': 'تحديد نوع و سعر الكشف',
      'en': '',
    },
    '9l5mesmo': {
      'ar': 'Shop',
      'en': '',
    },
  },
  // emptyListComponent
  {
    'agis7jk9': {
      'ar': 'من فضلك اختار التخصص الرئيسي',
      'en': '',
    },
  },
  // DayScheduleComponent
  {
    '5qu9dms6': {
      'ar': '',
      'en': '',
    },
    '7e60lzmb': {
      'ar': 'من',
      'en': '',
    },
    'uzy5jnfx': {
      'ar': 'Option 1',
      'en': '',
    },
    'ct61wsts': {
      'ar': 'Please select...',
      'en': '',
    },
    'jhvkq47u': {
      'ar': 'Search for an item...',
      'en': '',
    },
    'wwg94a4r': {
      'ar': 'الي',
      'en': '',
    },
    '7gsir4g4': {
      'ar': 'Option 1',
      'en': '',
    },
    '632gtyll': {
      'ar': 'Please select...',
      'en': '',
    },
    'rgftlc01': {
      'ar': 'Search for an item...',
      'en': '',
    },
  },
  // Miscellaneous
  {
    '3by7px0n': {
      'ar': 'Label here...',
      'en': 'Label here...',
    },
    'd04dzvhy': {
      'ar': '',
      'en': '',
    },
    'kf0v8l5w': {
      'ar': '',
      'en': '',
    },
    'zvyob3a7': {
      'ar': '',
      'en': '',
    },
    'teyi6a8s': {
      'ar': '',
      'en': '',
    },
    'vpx9t9m3': {
      'ar': '',
      'en': '',
    },
    'hx9bipe8': {
      'ar': '',
      'en': '',
    },
    'g4xthqtl': {
      'ar': '',
      'en': '',
    },
    '505rr5xq': {
      'ar': '',
      'en': '',
    },
    '41ygp9fw': {
      'ar': '',
      'en': '',
    },
    '53ej067p': {
      'ar': '',
      'en': '',
    },
    '9zlcnctm': {
      'ar': '',
      'en': '',
    },
    'cs8e3bah': {
      'ar': '',
      'en': '',
    },
    '74ep2yyb': {
      'ar': '',
      'en': '',
    },
    'kq9jp9wu': {
      'ar': '',
      'en': '',
    },
    'gn0g872w': {
      'ar': '',
      'en': '',
    },
    'itis32qz': {
      'ar': '',
      'en': '',
    },
    'j2g4fwiu': {
      'ar': '',
      'en': '',
    },
    '04j2u9cm': {
      'ar': '',
      'en': '',
    },
    'kvbcwg86': {
      'ar': '',
      'en': '',
    },
    'bp12vk3d': {
      'ar': '',
      'en': '',
    },
    '44itbqhw': {
      'ar': '',
      'en': '',
    },
    'ilnlhwno': {
      'ar': '',
      'en': '',
    },
    'u3yhq0uq': {
      'ar': '',
      'en': '',
    },
    'xsu01n3g': {
      'ar': '',
      'en': '',
    },
    '6kqmmlr4': {
      'ar': '',
      'en': '',
    },
    'j89rbf1o': {
      'ar': '',
      'en': '',
    },
    '3dhrutq9': {
      'ar': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
