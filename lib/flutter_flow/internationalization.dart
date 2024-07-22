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
      'ar': 'من هنا يتواصل المريض و الطبيب',
      'en': 'From here the patient and doctor communicate',
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
      'en': 'Choose your main specialty',
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
      'en': 'Please enter your full name',
    },
    '2nfyz3v8': {
      'ar': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '6wm72l75': {
      'ar': 'من فضلم ادخل لقبك المهني',
      'en': 'Please enter your professional title',
    },
    'dak8g6t9': {
      'ar': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '4570g8p3': {
      'ar': 'من فضلك اكتب بعض المعلومات عنك',
      'en': 'Please write some information about yourself',
    },
    'a9kf89oi': {
      'ar': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '36ztx53p': {
      'ar': 'بيانات الطبيب الاساسية',
      'en': 'Basic doctor information',
    },
    '0jhzugac': {
      'ar': 'main',
      'en': 'main',
    },
  },
  // doctor_data_address
  {
    'mn65y5fg': {
      'ar': 'عنوان العمل',
      'en': 'work address',
    },
    'tpioyxvu': {
      'ar': 'Option 1',
      'en': 'Option 1',
    },
    'o18jjifm': {
      'ar': '544545',
      'en': '544545',
    },
    '4yr1vpwp': {
      'ar': 'البلد',
      'en': 'Country',
    },
    'pin0z8yp': {
      'ar': 'Search for an item...',
      'en': 'Search for an item...',
    },
    'o8gcmhfx': {
      'ar': 'rttrtrtrtr',
      'en': 'rttrtrtrtr',
    },
    '31ybbkso': {
      'ar': 'hkjh',
      'en': 'hkjh',
    },
    'gx6jm4zr': {
      'ar': 'المحافظة',
      'en': 'Governorate',
    },
    'xmcegdz5': {
      'ar': 'اختار المحافظة',
      'en': 'Choose the governorate',
    },
    '9u51dwbp': {
      'ar': 'Option 1',
      'en': 'Option 1',
    },
    'yzudth5d': {
      'ar': '544545',
      'en': '544545',
    },
    'nbr48oan': {
      'ar': 'المنطقة / المركز',
      'en': 'Region/center',
    },
    'onqssuu2': {
      'ar': 'اختار المنطقة',
      'en': 'Select the region',
    },
    'jnsaxmuk': {
      'ar': 'Option 1',
      'en': 'Option 1',
    },
    'icvimrzq': {
      'ar': '544545',
      'en': '544545',
    },
    '6b0nzqut': {
      'ar': 'الحي',
      'en': 'District',
    },
    'pm4psr0u': {
      'ar': 'اختار الحي',
      'en': 'Choose the neighborhood',
    },
    'lno0cklc': {
      'ar': 'العنوان (الشارع و المبني)',
      'en': 'Address (street and building)',
    },
    'n3k69oum': {
      'ar': 'تليفونات الحجز',
      'en': 'Reservation telephones',
    },
    'rjy1mmws': {
      'ar': 'تليفون عمل 1',
      'en': 'Business phone 1',
    },
    '5hmaj61p': {
      'ar': 'تليفون عمل 2 ',
      'en': 'Business phone 2',
    },
    'a2puizon': {
      'ar': 'موقع العمل علي الخريطة',
      'en': 'Work location on the map',
    },
    'y15qo9sj': {
      'ar': 'Map will be shwon here ',
      'en': 'Map will be shown here',
    },
    'l98y3n2a': {
      'ar': 'حفظ البانات',
      'en': 'Save data',
    },
    '6z4kdjmt': {
      'ar': 'من فضلك ادخل عنوان الشارع و المبني',
      'en': 'Please enter the street and building address',
    },
    'bjpmmgis': {
      'ar': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'swbyk6o7': {
      'ar': 'من فضلك ادخل تليفون 1',
      'en': 'Please enter phone 1',
    },
    '53enuda5': {
      'ar': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'wg1mjq5j': {
      'ar': 'من فضلك ادخل تليفون 2 ',
      'en': 'Please enter phone 2',
    },
    'jh7zlt2c': {
      'ar': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '8kjzlm0z': {
      'ar': 'ادخل عنوان العمل',
      'en': 'Enter the business address',
    },
    '54hdqaol': {
      'ar': 'address',
      'en': 'address',
    },
  },
  // doctor_data_images
  {
    'c1uxqt35': {
      'ar': 'صورة الطبيب',
      'en': 'Image of a doctor',
    },
    'erp0r5xv': {
      'ar': 'صور العيادة',
      'en': 'Clinic photos',
    },
    'h0mvthzk': {
      'ar': '1',
      'en': '1',
    },
    'myvv12n7': {
      'ar': '2',
      'en': '2',
    },
    '1qrdz17y': {
      'ar': 'صورة إثبات بطاقة مزاولة المهنة*',
      'en': 'A copy of proof of your professional practice card*',
    },
    'g1qvau7w': {
      'ar': 'صورة إثبات اللقب المهني ',
      'en': 'A copy of proof of professional title',
    },
    'jx7kwnlm': {
      'ar': 'ادخال صور العمل',
      'en': 'Insert pictures of work',
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
      'en': 'Search for a doctor',
    },
    'mk3ixzfg': {
      'ar': 'Patients matching search',
      'en': 'Patients matching search',
    },
    'as03cqmg': {
      'ar': '24',
      'en': '24',
    },
    'xusv17x9': {
      'ar': 'قائمة الاطباء',
      'en': 'List of doctors',
    },
    'zrwrju63': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // doctor_data_schedule
  {
    'je4d3pi9': {
      'ar': 'تحديد نوع الحجز',
      'en': 'Determine the type of reservation',
    },
    'y13ugeif': {
      'ar': 'الحجز مسبقا و الدخول بأسبقية الحضور',
      'en': 'Booking in advance and entry is first come first served',
    },
    'k05jud6y': {
      'ar': 'الدخول بميعاد محدد',
      'en': 'Entry at a specified time',
    },
    'ack7v2zu': {
      'ar': 'سعر الخدمة',
      'en': 'Detection price',
    },
    '9qjj5x91': {
      'ar': 'سعر الكشف',
      'en': '',
    },
    '8e4f1sar': {
      'ar': '',
      'en': '',
    },
    'zci0rcuq': {
      'ar': '400',
      'en': '200',
    },
    'd11vlahx': {
      'ar': 'سعر الاستشارة',
      'en': '',
    },
    'ex11evko': {
      'ar': '',
      'en': '',
    },
    '3tln7xty': {
      'ar': '100',
      'en': '200',
    },
    'sp1i0d4e': {
      'ar': 'متوسط عدد الكشوفات في الساعة',
      'en': 'Average number of statements per hour',
    },
    '8bgl4phv': {
      'ar': 'متوسط عدد الكشف في الساعة',
      'en': '',
    },
    'yx8jp0ks': {
      'ar': '',
      'en': '',
    },
    'c6j7nwi3': {
      'ar': '1',
      'en': '',
    },
    'jea1h2ss': {
      'ar': 'تحديد مواعيد العمل',
      'en': 'Determine work hours',
    },
    's12hc0up': {
      'ar': 'تحديد نوع و سعر الكشف',
      'en': 'Determine the type and price of the statement',
    },
    '9l5mesmo': {
      'ar': 'Shop',
      'en': 'Shop',
    },
  },
  // doctor_profile
  {
    'yh9rfatj': {
      'ar': '/',
      'en': '',
    },
    'xhzlp0e3': {
      'ar': 'البيانات الاساسية',
      'en': '',
    },
    '9ji1bh67': {
      'ar': 'تعديل البيانات الاساسية',
      'en': '',
    },
    'c6lvktt1': {
      'ar': ' تعديل عنوان العمل',
      'en': '',
    },
    'wsn4fi11': {
      'ar': 'تعديل الصور و الملفات',
      'en': '',
    },
    'cjvoijbi': {
      'ar': 'تحديد سعر الكشف و مواعيد العمل',
      'en': '',
    },
    'v88doy9y': {
      'ar': 'بيانات الحساب',
      'en': '',
    },
    'qkfwbr0r': {
      'ar': 'تعديل كلمة المرور',
      'en': '',
    },
    '3ju9mk5k': {
      'ar': 'خروج',
      'en': '',
    },
    'ty0y41np': {
      'ar': 'وضع التطبيق',
      'en': '',
    },
    '2l7vc9l1': {
      'ar': 'نهاري',
      'en': '',
    },
    'ftfu7qf5': {
      'ar': 'ليلي',
      'en': '',
    },
    '8bzssxpu': {
      'ar': '__',
      'en': '',
    },
  },
  // doctor_search
  {
    'v0je1rj0': {
      'ar': '123 ',
      'en': '',
    },
    'cxjmtw70': {
      'ar': 'تقيم',
      'en': '',
    },
    '59aurkjt': {
      'ar': 'احجز الان',
      'en': 'save',
    },
    '30msy7c2': {
      'ar': 'اختار البحث ',
      'en': '',
    },
    'njmm9cav': {
      'ar': 'المنطقة',
      'en': '',
    },
    'gsjq71hc': {
      'ar': 'التخصص',
      'en': '',
    },
    'rmxrt49s': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // doctor_book_visit
  {
    'jjcwgkrh': {
      'ar': 'book a day',
      'en': '',
    },
    'mu62r1ss': {
      'ar': 'Page Title',
      'en': 'Page Title',
    },
    'lhav9xod': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // custom_navbar
  {
    'i8qid52y': {
      'ar': 'حجوزات',
      'en': 'Reservations',
    },
    'znzmwi2a': {
      'ar': 'حسابات',
      'en': 'Accounts',
    },
    'we55qr2t': {
      'ar': 'ملفي',
      'en': 'My file',
    },
  },
  // DayScheduleComponent
  {
    'o3hh004v': {
      'ar': 'يمكنك تحديد و حفظ  ساعات العمل ... ',
      'en': 'You can set and save working hours...',
    },
    'mlgytsf8': {
      'ar': 'حفظ',
      'en': 'save',
    },
    'b98rywxu': {
      'ar': 'لم يتم اخيار هذا اليوم',
      'en': '',
    },
  },
  // search_address_component
  {
    'btjw459l': {
      'ar': 'اختار العنوان',
      'en': '',
    },
    '7afu9atg': {
      'ar': 'حذف التصفية',
      'en': '',
    },
    'pbi9jm7j': {
      'ar': 'حفظ التصفية',
      'en': '',
    },
  },
  // search_category_component
  {
    'nsi0q9x1': {
      'ar': 'اختار التخصص',
      'en': '',
    },
    'y7v25toa': {
      'ar': 'حذف التصفية',
      'en': '',
    },
    '77tg89tk': {
      'ar': 'حفظ التصفية',
      'en': '',
    },
  },
  // search_item_component
  {
    '909hr4d3': {
      'ar': 'حذف التصفية',
      'en': '',
    },
    'xhib85h7': {
      'ar': 'حفظ التصفية',
      'en': '',
    },
    'ip5583wu': {
      'ar': 'من',
      'en': '',
    },
    'kse66a1z': {
      'ar': 'الي',
      'en': '',
    },
  },
  // DayBookingComponent
  {
    'oz3ag78l': {
      'ar': 'لم يتم اخيار هذا اليوم',
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
