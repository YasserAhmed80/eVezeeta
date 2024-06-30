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
  // users_list
  {
    'zqc3005u': {
      'ar': 'Search listings...',
      'en': 'Search listings...',
    },
    'kle0ski2': {
      'ar': 'Homes',
      'en': 'Homes',
    },
    '58fssrca': {
      'ar': 'Maidstone, San Antonio, Tx.',
      'en': 'Maidstone, San Antonio, TX.',
    },
    'bfrp8f3p': {
      'ar': '\$210/night',
      'en': '\$210/night',
    },
    'jwcq7gy1': {
      'ar': '32 miles away',
      'en': '32 miles away',
    },
    'w395ez76': {
      'ar': '4.25',
      'en': '4.25',
    },
    'i90szmlf': {
      'ar': 'Maidstone, San Antonio, Tx.',
      'en': 'Maidstone, San Antonio, TX.',
    },
    '2hixxbpd': {
      'ar': '\$210/night',
      'en': '\$210/night',
    },
    'qolmzxys': {
      'ar': '32 miles away',
      'en': '32 miles away',
    },
    'glg2xcbq': {
      'ar': '4.25',
      'en': '4.25',
    },
    '0jxi7yo6': {
      'ar': 'Beachfront',
      'en': 'Beachfront',
    },
    'oz5ub2ah': {
      'ar': 'Maidstone, San Antonio, Tx.',
      'en': 'Maidstone, San Antonio, TX.',
    },
    'xsxhdvqm': {
      'ar': '\$210/night',
      'en': '\$210/night',
    },
    'mboo8uua': {
      'ar': '32 miles away',
      'en': '32 miles away',
    },
    'xco7m9vm': {
      'ar': '4.25',
      'en': '4.25',
    },
    '2mbhbwpa': {
      'ar': 'Maidstone, San Antonio, Tx.',
      'en': 'Maidstone, San Antonio, TX.',
    },
    '0n1rj6mz': {
      'ar': '\$210/night',
      'en': '\$210/night',
    },
    '23so545p': {
      'ar': '32 miles away',
      'en': '32 miles away',
    },
    '3zlr8m63': {
      'ar': '4.25',
      'en': '4.25',
    },
    'jt3qepfm': {
      'ar': 'Nature',
      'en': 'Nature',
    },
    'fdegmn0c': {
      'ar': 'Maidstone, San Antonio, Tx.',
      'en': 'Maidstone, San Antonio, TX.',
    },
    '8eiyct01': {
      'ar': '\$210/night',
      'en': '\$210/night',
    },
    'gsfn18df': {
      'ar': '32 miles away',
      'en': '32 miles away',
    },
    'lebfxo8d': {
      'ar': '4.25',
      'en': '4.25',
    },
    '9obha45m': {
      'ar': 'Maidstone, San Antonio, Tx.',
      'en': 'Maidstone, San Antonio, TX.',
    },
    'l3caxu3n': {
      'ar': '\$210/night',
      'en': '\$210/night',
    },
    'yyzc1ogs': {
      'ar': '32 miles away',
      'en': '32 miles away',
    },
    'nm1rpl6x': {
      'ar': '4.25',
      'en': '4.25',
    },
    '4cjjo6x6': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // customer_new
  {
    'r5xm6v18': {
      'ar': 'profile',
      'en': 'profile. profile',
    },
  },
  // customer_new_initial
  {
    'mnyz4zrt': {
      'ar': 'السلام عليكم و رحمة الله',
      'en': 'Peace and mercy of God',
    },
    '06hjmisa': {
      'ar': 'الاسم ',
      'en': 'the name',
    },
    'mu9b7ani': {
      'ar': '',
      'en': '',
    },
    '22x5w1nj': {
      'ar': '',
      'en': '',
    },
    'vdvi26hu': {
      'ar': 'Page Title',
      'en': 'Page Title',
    },
    'xp2rice4': {
      'ar': 'profile',
      'en': 'profile. profile',
    },
  },
  // customer_details
  {
    'oa71bey1': {
      'ar': 'Active',
      'en': 'Active',
    },
    'ze135bsh': {
      'ar': 'Yasser, 30',
      'en': 'Yasser, 30',
    },
    '2vzjgpwz': {
      'ar': 'Cairo, NC, ffff',
      'en': 'Cairo, NC, ffff',
    },
    'm656jj1b': {
      'ar': 'معلومات هامه',
      'en': 'important information',
    },
    '7ot7qujv': {
      'ar': 'مواصفاتي',
      'en': 'My specifications',
    },
    'mzaaoth5': {
      'ar': 'معلومات اخري عني',
      'en': 'Other information about me',
    },
    '7f80cua4': {
      'ar': 'Details',
      'en': 'Details',
    },
    'v9mf8559': {
      'ar': 'profile',
      'en': 'profile. profile',
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
    'znilmdsm': {
      'ar': 'تخصص فرعي 1',
      'en': 'Subspecialty 1',
    },
    'hlw4lc6m': {
      'ar': 'Title',
      'en': 'Title',
    },
    'e44k3hae': {
      'ar': 'Title',
      'en': 'Title',
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
    'dbob9bdn': {
      'ar': 'Option 1',
      'en': '',
    },
    'o8gcmhfx': {
      'ar': '544545',
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
