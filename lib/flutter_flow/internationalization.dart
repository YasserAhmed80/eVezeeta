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
    'syf05cif': {
      'ar': 'admin',
      'en': '',
    },
    'f1a1e4hm': {
      'ar': 'Dcotor',
      'en': '',
    },
    'v1eloqo4': {
      'ar': 'Customr',
      'en': '',
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
    'oqigkybd': {
      'ar': 'حفظ البانات',
      'en': '',
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
    '24qishu0': {
      'ar': 'حفظ البانات',
      'en': '',
    },
    '6z4kdjmt': {
      'ar': 'من فضلك ادخل عنوان الشارع و المبني',
      'en': 'Please enter the street and building address',
    },
    'z00u4mvd': {
      'ar': 'عنوان قصير جدا',
      'en': '',
    },
    'yz6lqgv9': {
      'ar': 'عنوان طويل جدا',
      'en': '',
    },
    'bjpmmgis': {
      'ar': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'swbyk6o7': {
      'ar': 'من فضلك ادخل تليفون 1',
      'en': 'Please enter phone 1',
    },
    'ebgspkuj': {
      'ar': 'رقم تليفون خطا',
      'en': '',
    },
    'dvwg4rz2': {
      'ar': 'رقم تليفون خطا',
      'en': '',
    },
    '53enuda5': {
      'ar': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'wg1mjq5j': {
      'ar': 'من فضلك ادخل تليفون 2 ',
      'en': 'Please enter phone 2',
    },
    'rvgsuoa3': {
      'ar': 'رقم تليفون خطا',
      'en': '',
    },
    'krpy6lli': {
      'ar': 'رقم تليفون خطا',
      'en': '',
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
      'ar': 'صورة إثبات بطاقة مزاولة المهنة',
      'en': 'A copy of proof of your professional practice card*',
    },
    'g1qvau7w': {
      'ar': 'صورة إثبات اللقب المهني ',
      'en': 'A copy of proof of professional title',
    },
    'wpyko5ui': {
      'ar': 'تم حفظ الصور',
      'en': '',
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
  // doctor_data_schedule
  {
    'je4d3pi9': {
      'ar': 'تحديد نوع الحجز',
      'en': 'Determine the type of reservation',
    },
    'ul5liiua': {
      'ar': 'الحجز مسبقا و الدخول بأسبقية الحضور',
      'en': '',
    },
    'wsmj66dd': {
      'ar': 'الدخول بميعاد محدد',
      'en': '',
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
      'en': '',
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
    'viipde9x': {
      'ar': 'يجب حفظ اي تعديلات من اعلي ...',
      'en': '',
    },
    'sxed3ivk': {
      'ar': 'حفظ',
      'en': '',
    },
    'cebuldfc': {
      'ar': 'تحديد مواعيد العمل',
      'en': '',
    },
    'nhj89g6w': {
      'ar': 'تم حفظ البيانات',
      'en': '',
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
  // doctor_account
  {
    'yh9rfatj': {
      'ar': '/',
      'en': '',
    },
    'qiz74anp': {
      'ar': 'يمكنك الاشتراك الان لكي تسفيد من خدماتنا',
      'en': '',
    },
    'x9rflpgd': {
      'ar': 'اشترك الان',
      'en': '',
    },
    'y0fywy1a': {
      'ar': 'حاله اشتراك فعالة ',
      'en': '',
    },
    'uuc4s6t5': {
      'ar': 'ستنتهي',
      'en': '',
    },
    'orkbicxt': {
      'ar': 'حاله اشتراك غير فعاله ',
      'en': '',
    },
    'xhzlp0e3': {
      'ar': 'بيانات ملفك',
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
    'z3u38xyt': {
      'ar': 'مشاهدة ملفك',
      'en': '',
    },
    'v88doy9y': {
      'ar': 'اشتراكي',
      'en': '',
    },
    'bj2eghvz': {
      'ar': 'تجديد الاشتراك',
      'en': '',
    },
    'xa04spla': {
      'ar': 'فواتيري',
      'en': '',
    },
    'd8ghcrj4': {
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
    'oj9wm83v': {
      'ar': 'بيانات الحساب',
      'en': '',
    },
    '8bzssxpu': {
      'ar': '__',
      'en': '',
    },
  },
  // doctor_search
  {
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
    '8sb6xxlx': {
      'ar': 'يمكنك حجز ميعاد مع',
      'en': '',
    },
    'sa762x1x': {
      'ar': 'يستقبل الطبيب عدد ',
      'en': '',
    },
    'yx2o8ywj': {
      'ar': 'حاله في الساعه',
      'en': '',
    },
    'piqs1vm9': {
      'ar': 'سعر الكشف',
      'en': '',
    },
    'ykncurgm': {
      'ar': 'سعر الاستشارة',
      'en': '',
    },
    'vgx1x8xb': {
      'ar': 'غير متاح',
      'en': '',
    },
    'w5idfjyt': {
      'ar': ' متاح',
      'en': '',
    },
    'g5iey1q2': {
      'ar': ' كامل العدد',
      'en': '',
    },
    'gqb5d1ww': {
      'ar': ' متاح جزئي',
      'en': '',
    },
    'j0d5xvx1': {
      'ar': 'تم أختيار بيانات الحجز الاتية:',
      'en': '',
    },
    'xhutvc8b': {
      'ar': 'الساعة ',
      'en': '',
    },
    '7y1had1u': {
      'ar': 'احجز الان',
      'en': '',
    },
    '4gpuj5t4': {
      'ar': 'لكي يتم الحجز يجب اختيار اليوم و الوقت من اعلي!',
      'en': '',
    },
    'zrwrju63': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // doctor_booking_center
  {
    '8hgydiqf': {
      'ar': 'مركز الحجوزات',
      'en': '',
    },
    '2v6kz8vp': {
      'ar': 'يمكن تصفية الحجوزات حسب الحاله  باخر واحدة من اسفل',
      'en': '',
    },
    'z4h0z9fh': {
      'ar': 'الكل',
      'en': '',
    },
    'f0kkfdt6': {
      'ar': 'الكل',
      'en': '',
    },
    'd6s6tbdi': {
      'ar': 'سنة',
      'en': '',
    },
    '5vrn36l0': {
      'ar': 'ملفات المريض',
      'en': '',
    },
    'zv7hc4a5': {
      'ar': 'الوقت: ',
      'en': '',
    },
    'bi918btg': {
      'ar': 'التاريخ: ',
      'en': '',
    },
    'hew2lx5z': {
      'ar': 'تليفون: ',
      'en': '',
    },
    'zcs3d7sl': {
      'ar': 'حاله الحجز:  ',
      'en': '',
    },
    'ct1vwy38': {
      'ar': 'تأكيد الحجز',
      'en': '',
    },
    'ashzpyjf': {
      'ar': 'تم الكشف',
      'en': '',
    },
    'e0roigc0': {
      'ar': 'الغاء الحجز',
      'en': '',
    },
    'y2k7kykw': {
      'ar': 'Home',
      'en': '',
    },
  },
  // doctor_dashboard
  {
    'i4fc6f89': {
      'ar': 'اليوم',
      'en': '',
    },
    '5ui3vb00': {
      'ar': 'امس',
      'en': '',
    },
    'duou9dxb': {
      'ar': 'اسبوع',
      'en': '',
    },
    'pmg9dnce': {
      'ar': 'شهر',
      'en': '',
    },
    'r7n4ex3s': {
      'ar': 'سنة',
      'en': '',
    },
    '4q5ixzyp': {
      'ar': 'في فترة معينه ',
      'en': '',
    },
    'rp4qpw29': {
      'ar': 'من: ',
      'en': '',
    },
    'ehtdk25c': {
      'ar': 'الي: ',
      'en': '',
    },
    'nc72ebae': {
      'ar': 'عدد الحجوزات المنفذة',
      'en': '',
    },
    'pmoe3wwx': {
      'ar': 'قيمة الحجوزات المنفذة',
      'en': '',
    },
    'w9cmv2h1': {
      'ar': 'كل الحجوزات',
      'en': '',
    },
    'a78qj9go': {
      'ar': 'حجوزات منفذة',
      'en': '',
    },
    'n3n0koyg': {
      'ar': 'حجوزات ملغية',
      'en': '',
    },
    'hukzgep6': {
      'ar': 'Y',
      'en': '',
    },
    'col6lta5': {
      'ar': 'Day',
      'en': '',
    },
    '2rupwhsz': {
      'ar': 'Count',
      'en': '',
    },
    '1lj2g4jk': {
      'ar': 'تفاصيل الحجوزات',
      'en': '',
    },
    'auz2m6ux': {
      'ar': 'اليوم',
      'en': '',
    },
    '6xmrj46s': {
      'ar': 'سعر كشف',
      'en': '',
    },
    'nttaob5c': {
      'ar': 'خدمه',
      'en': '',
    },
    '883lff91': {
      'ar': 'الحاله',
      'en': '',
    },
    's9j82ivr': {
      'ar': 'تحاليل البيانات',
      'en': '',
    },
    '052g7vpz': {
      'ar': 'Shop',
      'en': '',
    },
  },
  // congratultion_doctor
  {
    '8bvm3x03': {
      'ar': 'سعدا باشتراكم',
      'en': '',
    },
    'xri1wd5q': {
      'ar': 'اوك',
      'en': '',
    },
    'llio5c17': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // doctor_payment
  {
    '09xbqlcw': {
      'ar': 'مدة الاشتراك ',
      'en': '',
    },
    '2zrnqpx5': {
      'ar': 'شهري',
      'en': '',
    },
    'rr5ews9r': {
      'ar': 'من تاريخ:',
      'en': '',
    },
    'qu15npbq': {
      'ar': 'الي تاريخ:',
      'en': '',
    },
    'c1zfj8ws': {
      'ar': 'قيمة الشتراك',
      'en': '',
    },
    'gjcedkj7': {
      'ar': ' جنية',
      'en': '',
    },
    'sde5ojob': {
      'ar': 'قيمة خدمة كل حجز',
      'en': '',
    },
    '3k9igkml': {
      'ar': ' جنية',
      'en': '',
    },
    'pnwfi74v': {
      'ar': 'اجمالي خدمة الحجوزات السابقة',
      'en': '',
    },
    '2kibxlvy': {
      'ar': ' جنية',
      'en': '',
    },
    'w17e4nu9': {
      'ar': 'هل يوجد معكك كود خصم',
      'en': '',
    },
    'qhku7rum': {
      'ar': 'كود خصم',
      'en': '',
    },
    'mcqu9s6j': {
      'ar': 'كود خصمك',
      'en': '',
    },
    'v3amwzua': {
      'ar': '1234567899999',
      'en': '',
    },
    'pmr4nktu': {
      'ar': 'قيمة خصمك',
      'en': '',
    },
    'g4v6qhil': {
      'ar': 'الاجمالي',
      'en': '',
    },
    'jx1m2e24': {
      'ar': ' جنية',
      'en': '',
    },
    'ocj7khjr': {
      'ar': 'طريقة الدفع',
      'en': '',
    },
    'p9iq3cc8': {
      'ar': 'فودافون كاش',
      'en': '',
    },
    'su49mfy6': {
      'ar': 'فوري',
      'en': '',
    },
    'z0i4kvhc': {
      'ar': 'ادخل كود الدفع',
      'en': '',
    },
    'd0eqwg6t': {
      'ar': '',
      'en': '',
    },
    'gyf54g18': {
      'ar': '1234567890',
      'en': '',
    },
    'sn0smvi1': {
      'ar': 'تأكيد',
      'en': '',
    },
    '54yrsvgo': {
      'ar': 'اشترك الان',
      'en': '',
    },
    '4iqlx6x3': {
      'ar': 'تسجيل الاشتراك',
      'en': '',
    },
    '271lfrvo': {
      'ar': 'Home',
      'en': '',
    },
  },
  // doctor_billing
  {
    'nb5qrywx': {
      'ar': 'مدة الاشتراك الحالية',
      'en': '',
    },
    'ffj88nfe': {
      'ar': 'من تاريخ:',
      'en': '',
    },
    'fwhy8fh1': {
      'ar': 'الي تاريخ:',
      'en': '',
    },
    'kltmtloy': {
      'ar': 'قيمة الشتراك',
      'en': '',
    },
    'zminikox': {
      'ar': ' جنية',
      'en': '',
    },
    'rim45eah': {
      'ar': 'ينتهي اشتراكك خلال',
      'en': '',
    },
    'otf5s07v': {
      'ar': ' يوم',
      'en': '',
    },
    'fpydbfuj': {
      'ar': 'اجمالي خدمة الحجوزات المنفذة',
      'en': '',
    },
    'mezjkhbl': {
      'ar': 'من تاريخ:',
      'en': '',
    },
    'u3kf9esy': {
      'ar': 'الي تاريخ:',
      'en': '',
    },
    '8puyncx2': {
      'ar': 'اجمالي خدمة الحجوزات',
      'en': '',
    },
    'uiga72sf': {
      'ar': ' حجز',
      'en': '',
    },
    'n5bssffr': {
      'ar': 'X',
      'en': '',
    },
    'bnjfrdg8': {
      'ar': '=',
      'en': '',
    },
    '9cfx8q4l': {
      'ar': ' جنية',
      'en': '',
    },
    'q21li23p': {
      'ar': 'الاجمالي',
      'en': '',
    },
    'uoiwvfc5': {
      'ar': '+',
      'en': '',
    },
    '1tbh0xfa': {
      'ar': '=',
      'en': '',
    },
    '0anvnavx': {
      'ar': ' جنية',
      'en': '',
    },
    'gsbqvb9a': {
      'ar': 'جدد اشتراكك الاان',
      'en': '',
    },
    'mu62r1ss': {
      'ar': 'الفاتورة الحالية',
      'en': '',
    },
    'plzbjr4l': {
      'ar': 'Home',
      'en': '',
    },
  },
  // cus_main_data
  {
    'ibhspn37': {
      'ar': 'المعلومات الشخصية',
      'en': '',
    },
    '5sd0nr5m': {
      'ar': 'الاسم كامل',
      'en': '',
    },
    'flafidis': {
      'ar': 'موبيل',
      'en': '',
    },
    'drwiirp4': {
      'ar': 'تاريخ الميلاد',
      'en': '',
    },
    'blh14bwy': {
      'ar': 'النوع',
      'en': '',
    },
    'zo2i4453': {
      'ar': 'ذكر',
      'en': '',
    },
    '5a3tkyfc': {
      'ar': 'انثي',
      'en': '',
    },
    '4mxjhtjm': {
      'ar': 'العنوان',
      'en': '',
    },
    'f4x5jwyj': {
      'ar': 'Option 1',
      'en': '',
    },
    'fq84ghwq': {
      'ar': '544545',
      'en': '',
    },
    'i1kb6uuu': {
      'ar': 'البلد',
      'en': '',
    },
    'mqq90pso': {
      'ar': 'Search for an item...',
      'en': '',
    },
    'pyzgrddl': {
      'ar': 'rttrtrtrtr',
      'en': '',
    },
    '82pcuzjo': {
      'ar': 'hkjh',
      'en': '',
    },
    'n7hix88u': {
      'ar': 'المحافظة',
      'en': '',
    },
    'w1239pa8': {
      'ar': 'اختار المحافظة',
      'en': '',
    },
    'zp2pioya': {
      'ar': 'Option 1',
      'en': '',
    },
    'pdqh0rwe': {
      'ar': '544545',
      'en': '',
    },
    'cbr3jfup': {
      'ar': 'المنطقة / المركز',
      'en': '',
    },
    'smz3u44f': {
      'ar': 'اختار المنطقة',
      'en': '',
    },
    '46n6yx4k': {
      'ar': 'Option 1',
      'en': '',
    },
    '9ihs0wsx': {
      'ar': '544545',
      'en': '',
    },
    'jb6lhcex': {
      'ar': 'الحي',
      'en': '',
    },
    '7000jkfx': {
      'ar': 'اختار الحي',
      'en': '',
    },
    'yyvgdz1e': {
      'ar': 'العنوان (الشارع و المبني)',
      'en': '',
    },
    'ov93woap': {
      'ar': 'حفظ البانات',
      'en': '',
    },
    'ju40bfoh': {
      'ar': 'صورة الملف',
      'en': '',
    },
    'mdvj9oh1': {
      'ar': 'لكي يتم اختيار صورة يجب تسجيل البيانات اولا',
      'en': '',
    },
    't43wvfwa': {
      'ar': 'من فضلك ادخل اسمك كامل',
      'en': '',
    },
    'jhaafpy5': {
      'ar': 'اسم طويل جدا',
      'en': '',
    },
    'hjwpprh6': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    'lx91dy02': {
      'ar': 'من فضلك ادخل اسمك الموبيل',
      'en': '',
    },
    's4yi5wep': {
      'ar': 'رقم الموبيل خطأ',
      'en': '',
    },
    'khsvk2kd': {
      'ar': 'رقم الموبيل خطأ',
      'en': '',
    },
    '06exg81z': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    'tc3t5q5u': {
      'ar': 'Field is required',
      'en': '',
    },
    'evxfe1nk': {
      'ar': 'يجب ادخال عنوان كامل',
      'en': '',
    },
    '8q5iqyfl': {
      'ar': 'العنوان طويل جدا',
      'en': '',
    },
    'upxfn82c': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    'xniji3aq': {
      'ar': 'بيانات العميل',
      'en': '',
    },
    'xa8yec3v': {
      'ar': 'main',
      'en': '',
    },
  },
  // cus_master_page
  {
    'oidffcjk': {
      'ar': 'صفحة العميل',
      'en': '',
    },
    'nxpno2lc': {
      'ar': 'main',
      'en': '',
    },
  },
  // customer_List
  {
    'c90uo00k': {
      'ar': 'سنة',
      'en': '',
    },
    'l844gr33': {
      'ar': 'العملاء',
      'en': '',
    },
    'ans47m2s': {
      'ar': 'Home',
      'en': '',
    },
  },
  // customer_account
  {
    'wvbhqjb5': {
      'ar': 'سنة',
      'en': '',
    },
    'e6d0m13x': {
      'ar': 'البيانات الاساسية',
      'en': '',
    },
    'p5uw9yd7': {
      'ar': 'تعديل البيانات الاساسية',
      'en': '',
    },
    'ibt4yg2f': {
      'ar': 'حجوزاتي',
      'en': '',
    },
    'o8ift4hh': {
      'ar': 'اطبائي',
      'en': '',
    },
    '598l5kys': {
      'ar': 'اوراق كشفي',
      'en': '',
    },
    '8bb5eygz': {
      'ar': 'بيانات الحساب',
      'en': '',
    },
    '1hebnzrg': {
      'ar': 'تعديل كلمة المرور',
      'en': '',
    },
    '6elc08i0': {
      'ar': 'خروج',
      'en': '',
    },
    'o7ov5plp': {
      'ar': 'وضع التطبيق',
      'en': '',
    },
    'th5p7d74': {
      'ar': 'ملفي',
      'en': '',
    },
    'rmsmbtwi': {
      'ar': '__',
      'en': '',
    },
  },
  // customer_favorit_doc
  {
    '7nrxvhuc': {
      'ar': 'اطبائي المفضلين',
      'en': '',
    },
    'lhav9xod': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // customer_doc_booked
  {
    '7p5a75k8': {
      'ar': 'تاريخ: ',
      'en': '',
    },
    'dq5zuofb': {
      'ar': 'سعر الكشف',
      'en': '',
    },
    '792hc1ou': {
      'ar': 'حاله الحجز',
      'en': '',
    },
    '98g2l0uf': {
      'ar': 'ألغاء الحجز',
      'en': '',
    },
    'pdubb513': {
      'ar': 'سبب الالغاء',
      'en': '',
    },
    '5sqfekib': {
      'ar':
          'بعد اتمام الكشف يفضل ادخال الاوراق الخاصه بة ... مثل الروشتة او الاشعة',
      'en': '',
    },
    'j183k1bj': {
      'ar': 'اضافة',
      'en': '',
    },
    'hl9h0sau': {
      'ar': 'تخصص: ',
      'en': '',
    },
    'xq01tr13': {
      'ar': 'حجوزاتي',
      'en': '',
    },
    'pt35zsco': {
      'ar': 'Home',
      'en': '',
    },
  },
  // Show_image
  {
    'ulm3uoi5': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // doctor_profile
  {
    '6z69vc4b': {
      'ar': 'تخصص: ',
      'en': '',
    },
    'u3egcbzm': {
      'ar': 'تخصص فرعي: ',
      'en': '',
    },
    'foek11ne': {
      'ar': 'نبذه عنه: ',
      'en': '',
    },
    'd5a52iw8': {
      'ar': 'عنوان: ',
      'en': '',
    },
    'kws49eck': {
      'ar': 'سعر الكشف: ',
      'en': '',
    },
    'yzfoyokd': {
      'ar': 'احجز الان',
      'en': '',
    },
    'sta6k62x': {
      'ar': 'ملف الدكتور',
      'en': '',
    },
    'hijzss1o': {
      'ar': 'Home',
      'en': '',
    },
  },
  // cus_new_file
  {
    'gcznyson': {
      'ar': 'تاريخ الملف',
      'en': '',
    },
    'ey79u5px': {
      'ar': 'بيانات الملف',
      'en': '',
    },
    'dokjtu3t': {
      'ar': 'Option 1',
      'en': '',
    },
    'p1kvh1wd': {
      'ar': '544545',
      'en': '',
    },
    'b64nijxe': {
      'ar': 'نوع الملف',
      'en': '',
    },
    'iuvic5bz': {
      'ar': 'Search for an item...',
      'en': '',
    },
    'm1ngu45z': {
      'ar': 'بيانات عن الملف',
      'en': '',
    },
    'indy97tp': {
      'ar': 'بيانات عن الدكتور',
      'en': '',
    },
    'ngp5byjg': {
      'ar': 'حفظ الملف',
      'en': '',
    },
    'nhcqjz7r': {
      'ar': 'صورة الملف',
      'en': '',
    },
    'bhnpbej8': {
      'ar': 'لكي يتم اختيار صورة يجب تسجيل البيانات اولا',
      'en': '',
    },
    'vhkeywy5': {
      'ar': 'Field is required',
      'en': '',
    },
    'rfzfvabs': {
      'ar': 'حجم المعلومات صغير جدا',
      'en': '',
    },
    '9ujnvguj': {
      'ar': 'حجم المعلومات كبير جدا',
      'en': '',
    },
    'c3rgy1su': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    'xcyvq3e6': {
      'ar': 'Field is required',
      'en': '',
    },
    '45xd2xtl': {
      'ar': 'حجم المعلومات صغير جدا',
      'en': '',
    },
    '9rv7l8f5': {
      'ar': 'حجم المعلومات كبير جدا',
      'en': '',
    },
    'lkt2h4p7': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    '601if6kr': {
      'ar': 'بيانات الملف',
      'en': '',
    },
    'kofl5x33': {
      'ar': 'main',
      'en': '',
    },
  },
  // cus_files
  {
    'x4abinob': {
      'ar':
          'يمكنك حفظ كل الملفات الخاصة بحالتك الصحية. هذة الملفات تشمل روشتات - تحاليل - واشعة او اي ملف اخر.\nيمكنك مشاركة هذه الملفات مع طبيبك كلما لزم الامر.',
      'en': '',
    },
    'mer9deto': {
      'ar': 'تاريخ الملف: ',
      'en': '',
    },
    'q7k6lf1f': {
      'ar': 'عن الملف: ',
      'en': '',
    },
    'aipm8l6r': {
      'ar': 'عن الدكتور: ',
      'en': '',
    },
    'wu0x1yix': {
      'ar': 'تخصص: ',
      'en': '',
    },
    'mkyvtqmn': {
      'ar': 'تعديل الملف',
      'en': '',
    },
    'aivmciwg': {
      'ar': 'حذف الملف',
      'en': '',
    },
    '2ejuqezr': {
      'ar': 'من فضلك ادخل اسمك كامل',
      'en': '',
    },
    'f7tkyshn': {
      'ar': 'اسم طويل جدا',
      'en': '',
    },
    'u2lp74oc': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    'm3crzspl': {
      'ar': 'من فضلك ادخل اسمك الموبيل',
      'en': '',
    },
    'vzwhgbnm': {
      'ar': 'رقم الموبيل خطأ',
      'en': '',
    },
    'ww9zy04c': {
      'ar': 'رقم الموبيل خطأ',
      'en': '',
    },
    'za843ezl': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    'h326tju7': {
      'ar': 'Field is required',
      'en': '',
    },
    '0gcvucz5': {
      'ar': 'يجب ادخال عنوان كامل',
      'en': '',
    },
    'g35ihmus': {
      'ar': 'العنوان طويل جدا',
      'en': '',
    },
    '9v2f28nx': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    '1r33eias': {
      'ar': 'ملفاتي',
      'en': '',
    },
    '56pfryii': {
      'ar': 'main',
      'en': '',
    },
  },
  // registerationStep
  {
    'dstilcr0': {
      'ar': 'موافق',
      'en': '',
    },
    '700yve3p': {
      'ar': 'Home',
      'en': '',
    },
  },
  // congratultion_customer
  {
    'dz2w4iw4': {
      'ar': 'سعدا باشتراكم',
      'en': '',
    },
    'dfrwzpt6': {
      'ar': 'اوك',
      'en': '',
    },
    'pew9khbr': {
      'ar': 'Home',
      'en': '',
    },
  },
  // cus_files_Doctor
  {
    'a5zlnx1g': {
      'ar': 'تاريخ الملف: ',
      'en': '',
    },
    'qycq8z45': {
      'ar': 'عن الملف: ',
      'en': '',
    },
    'bc02uy9t': {
      'ar': 'عن الدكتور: ',
      'en': '',
    },
    'o7ntdxec': {
      'ar': 'تخصص: ',
      'en': '',
    },
    'sbj78iz2': {
      'ar': 'من فضلك ادخل اسمك كامل',
      'en': '',
    },
    'vozjuhu6': {
      'ar': 'اسم طويل جدا',
      'en': '',
    },
    'j2mfz0xw': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    'jkkoss79': {
      'ar': 'من فضلك ادخل اسمك الموبيل',
      'en': '',
    },
    'megsui6r': {
      'ar': 'رقم الموبيل خطأ',
      'en': '',
    },
    'wm8gqrmw': {
      'ar': 'رقم الموبيل خطأ',
      'en': '',
    },
    'tql8e4q5': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    'gmurycnb': {
      'ar': 'Field is required',
      'en': '',
    },
    '09u8bia0': {
      'ar': 'يجب ادخال عنوان كامل',
      'en': '',
    },
    '03nn7p79': {
      'ar': 'العنوان طويل جدا',
      'en': '',
    },
    'x7mlmukl': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    '95r9ymeh': {
      'ar': 'ملفات مريض',
      'en': '',
    },
    'ny9kjl1h': {
      'ar': 'main',
      'en': '',
    },
  },
  // customer_profile
  {
    'jtdpubug': {
      'ar': 'سنة',
      'en': '',
    },
    'prqi6q1x': {
      'ar': 'ملف عميل',
      'en': '',
    },
    'bujl7ich': {
      'ar': '__',
      'en': '',
    },
  },
  // admin_doctor_review
  {
    'k1492vfs': {
      'ar': 'مراجعة ملفات الاطباء',
      'en': '',
    },
    '4w7xgrx9': {
      'ar': 'الاسم: ',
      'en': '',
    },
    'zzw66px4': {
      'ar': 'اللقب: ',
      'en': '',
    },
    'z1zskwyp': {
      'ar': 'عن الدكتور: ',
      'en': '',
    },
    'eraa39f5': {
      'ar': 'العنوان: ',
      'en': '',
    },
    'mnws5lqv': {
      'ar': 'تعليق: ',
      'en': '',
    },
    'om3lwynp': {
      'ar': 'تاكيد الملف',
      'en': '',
    },
    'qu6223qy': {
      'ar': 'محتاج تعديل',
      'en': '',
    },
    '2igkin21': {
      'ar': 'بلوك',
      'en': '',
    },
    '4cjjo6x6': {
      'ar': 'Home',
      'en': '',
    },
  },
  // admin_images_review
  {
    'm4piyqil': {
      'ar': 'مراجعة الصور',
      'en': '',
    },
    '9hocdd3n': {
      'ar': 'تعليق: ',
      'en': '',
    },
    'fa74uev0': {
      'ar': 'تاكيد الصوره',
      'en': '',
    },
    'nrvkec8c': {
      'ar': 'حذف',
      'en': '',
    },
    '494w8z1i': {
      'ar': 'Home',
      'en': '',
    },
  },
  // loadRefData_Component
  {
    'qv6xtmr9': {
      'ar': 'جاري تحميل البيانات',
      'en': '',
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
    'wekm64o9': {
      'ar': '/',
      'en': '',
    },
    'oz3ag78l': {
      'ar': 'لم يتم اخيار هذا اليوم',
      'en': '',
    },
  },
  // calender_component
  {
    'c78yp9g1': {
      'ar': 'Ok',
      'en': '',
    },
  },
  // calender_component_2
  {
    'h589iqm5': {
      'ar': '',
      'en': '',
    },
    'sn408nt8': {
      'ar': 'Option 1',
      'en': '',
    },
    '2ablvt8b': {
      'ar': 'السنة',
      'en': '',
    },
    '9vlwcx76': {
      'ar': 'السنة',
      'en': '',
    },
    'gtf68ado': {
      'ar': 'Option 1',
      'en': '',
    },
    'hhl8qq33': {
      'ar': 'الشهر',
      'en': '',
    },
    'oapzu05w': {
      'ar': 'الشهر',
      'en': '',
    },
    'mlide2si': {
      'ar': 'Option 1',
      'en': '',
    },
    'x2bdc5go': {
      'ar': 'اليوم',
      'en': '',
    },
    'd2hst4z8': {
      'ar': 'اليوم',
      'en': '',
    },
    '679fcb8i': {
      'ar': 'موافق',
      'en': '',
    },
  },
  // doctor_data_component
  {
    'ypb59s00': {
      'ar': 'تخصص رئيسي: ',
      'en': '',
    },
    '03b9v6br': {
      'ar': 'تخصص فرعي:  ',
      'en': '',
    },
    'sx1exypl': {
      'ar': '123 ',
      'en': '',
    },
    'blusaqkl': {
      'ar': 'تقيم',
      'en': '',
    },
    'k1c22amp': {
      'ar': 'احجز الان',
      'en': '',
    },
  },
  // doctor_files_component
  {
    'nfpggb41': {
      'ar': 'صور العيادة',
      'en': '',
    },
  },
  // loading_component
  {
    's87y8k9f': {
      'ar': 'جاري تحميل البيانات',
      'en': '',
    },
  },
  // code_component
  {
    'he62ycwm': {
      'ar': 'رقم العضوية: ',
      'en': '',
    },
  },
  // cancel_booking_component
  {
    '3cv5mhol': {
      'ar': 'الغاء الحجز',
      'en': '',
    },
    's1el9953': {
      'ar': 'سبب الالغاء',
      'en': '',
    },
    'y7qpk6v4': {
      'ar': 'سبب الغاء الحجز',
      'en': '',
    },
    'ej7jlh53': {
      'ar': 'ألغاء',
      'en': '',
    },
  },
  // darkMode_Component
  {
    'tqamlwzo': {
      'ar': 'نهاري',
      'en': '',
    },
    'hyejx00u': {
      'ar': 'ليلي',
      'en': '',
    },
  },
  // admin_sideNav_component
  {
    '34unu0xa': {
      'ar': 'ادارة التطبيق',
      'en': '',
    },
    '0wmhlfc6': {
      'ar': 'المهام',
      'en': '',
    },
    '5uvx8v9z': {
      'ar': 'مراجعة ملفات الااطباء',
      'en': '',
    },
    '4i6v9x07': {
      'ar': 'مراجعة الصور',
      'en': '',
    },
    'gjpd99jk': {
      'ar': 'المواظفين',
      'en': '',
    },
    '6yywr0kx': {
      'ar': 'مواظفين ',
      'en': '',
    },
    'nchm7jle': {
      'ar': 'شركاء نجاح',
      'en': '',
    },
  },
  // reviw_status_component
  {
    'jg8bnvfu': {
      'ar': 'حالة ملفك: ',
      'en': '',
    },
    '1eip84hv': {
      'ar': 'سبب:',
      'en': '',
    },
  },
  // create_note_component
  {
    'd5w7geyp': {
      'ar': 'اضافة تعليق',
      'en': '',
    },
    'i02xxb6i': {
      'ar': 'من فضلك اكتب التعليق',
      'en': '',
    },
    'g60q7v3q': {
      'ar': 'Field is required',
      'en': '',
    },
    'fdz6j6j7': {
      'ar': 'اقل من 10 حروف',
      'en': '',
    },
    'bzt90599': {
      'ar': 'اكثر من 200 حرف',
      'en': '',
    },
    '2waz6oz5': {
      'ar': 'Please choose an option from the dropdown',
      'en': '',
    },
    '6ntj6a5u': {
      'ar': 'اوك',
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
