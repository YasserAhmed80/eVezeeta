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
    '4fdfux20': {
      'ar': 'Please enter the patients full name.',
      'en': 'Please enter the patients full name.',
    },
    '2nfyz3v8': {
      'ar': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '3toxbyy2': {
      'ar': 'Please enter an age for the patient.',
      'en': 'Please enter an age for the patient.',
    },
    '2waz6oz5': {
      'ar': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'j8b8j824': {
      'ar': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'pj1bs6gw': {
      'ar': 'Please enter the date of birth of the patient.',
      'en': 'Please enter the date of birth of the patient.',
    },
    'hl2z3v2y': {
      'ar': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'g60q7v3q': {
      'ar': 'Field is required',
      'en': 'Field is required',
    },
    'dak8g6t9': {
      'ar': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '36ztx53p': {
      'ar': 'بيانات الطبيب الاساسية',
      'en': 'Basic doctor information',
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
    'ahunvoqm': {
      'ar': 'Please enter the patients full name.',
      'en': 'Please enter the patients full name.',
    },
    'eem96jco': {
      'ar': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '4xzvoer1': {
      'ar': 'Please enter an age for the patient.',
      'en': 'Please enter an age for the patient.',
    },
    'bhaf9i8z': {
      'ar': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '677td51y': {
      'ar': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '323vhujx': {
      'ar': 'Please enter the date of birth of the patient.',
      'en': 'Please enter the date of birth of the patient.',
    },
    'xp52of87': {
      'ar': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'o62khzzu': {
      'ar': 'Field is required',
      'en': 'Field is required',
    },
    'bjpmmgis': {
      'ar': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '8kjzlm0z': {
      'ar': 'ادخل عنوان العمل',
      'en': 'Basic doctor information',
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
