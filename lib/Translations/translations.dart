import 'package:get/get.dart';

class MyTranslations extends Translations {
  final BaseLanguage frLanguage;
  final BaseLanguage enLanguage;
  final BaseLanguage ptLanguage;
  final BaseLanguage arLanguage;

  MyTranslations(
      {required this.frLanguage,
      required this.enLanguage,
      required this.arLanguage,
      required this.ptLanguage});

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enLanguage.language,
        'en_AU': enLanguage.language,
        'en_CA': enLanguage.language,
        'en_IN': enLanguage.language,
        'en_IE': enLanguage.language,
        'en_MT': enLanguage.language,
        'en_NZ': enLanguage.language,
        'en_PH': enLanguage.language,
        'en_SG': enLanguage.language,
        'en_ZA': enLanguage.language,
        'en_GB': enLanguage.language,
        'ar_DZ': arLanguage.language,
        'ar_BH': arLanguage.language,
        'ar_EG': arLanguage.language,
        'ar_IQ': arLanguage.language,
        'ar_JO': arLanguage.language,
        'ar_KW': arLanguage.language,
        'ar_LB': arLanguage.language,
        'ar_LY': arLanguage.language,
        'ar_MA': arLanguage.language,
        'ar_OM': arLanguage.language,
        'ar_QA': arLanguage.language,
        'ar_SA': arLanguage.language,
        'ar_SD': arLanguage.language,
        'ar_SY': arLanguage.language,
        'ar_TN': arLanguage.language,
        'ar_AE': arLanguage.language,
        'ar_YE': arLanguage.language,
        'fr_CA': frLanguage.language,
        'fr_FR': frLanguage.language,
        'fr_LU': frLanguage.language,
        'fr_CH': frLanguage.language,
        'pt_BR': ptLanguage.language,
        'pt_PT': ptLanguage.language
      };
}

abstract class BaseLanguage {
  Map<String, String> get language;
}

class FrLanguage implements BaseLanguage {
  @override
  Map<String, String> get language => {
        "download": "Télécharger",
        "arabic": "Arabe",
        "english": "Anglais",
        "french": "Français",
        "portuguese": "Portugais",
        "advertise":
            "Annoncez votre entreprise gratuitement. Obtenez plus de clients...",
        "promote": "Promouvoir l'entrepreneuriat chez les Africains.",
        "become_active": "Devenez un utilisateur actif",
        "create_account": "Créer un compte",
        "set_profile": "Configurez votre profil",
        "set_prices": "Fixez des prix pour votre ensemble de compétences.",
        "post_pic":
            "Publiez des photos, des vidéos et des fichiers de votre travail manuel.",
        "like": "Comme les messages des autres utilisateurs.",
        "post_job": "Publiez des offres d'emploi avec un prix ou négociez.",
        "review": "Examinez et notez les autres utilisateurs.",
        "chat": "Discutez avec d'autres utilisateurs",
        "features": "Fonctionnalités",
        "app_lan":
            "L'application comprend des traductions en arabe, anglais, français et portugais.",
        "app_inc":
            "L'application comprend toutes les régions et sous-régions de chaque pays africain."
      };
}

class EnLanguage implements BaseLanguage {
  @override
  Map<String, String> get language => {
        "download": "Download",
        "advertise": "Advertise your business for free. Get more customers...",
        "promote": "Promoting entrepreneurship among Africans.",
        "become_active": "Become an active user",
        "create_account": "Create an account",
        "set_profile": "Set up your profile",
        "set_prices": "Set prices for your skill set.",
        "post_pic": "Post pictures, videos & files of your hand work.",
        "like": "Like other user's posts.",
        "post_job": "Post jobs with a price or negotiate.",
        "review": "Review and rate other users.",
        "chat": "Chat with other users",
        "features": "Features",
        "app_lan":
            "App includes Arabic, English, French, and Portuguese translations.",
        "app_inc":
            "App includes all regions and sub-regions of each African country.",
        "arabic": "Arabic",
        "english": "English",
        "french": "French",
        "portuguese": "Portuguese",
      };
}

class PtLanguage implements BaseLanguage {
  @override
  Map<String, String> get language => {
        "download": "Baixar",
        "advertise":
            "Anuncie seu negócio gratuitamente. Conquiste mais clientes...",
        "promote": "Promover o empreendedorismo entre os africanos.",
        "become_active": "Torne-se um usuário ativo",
        "create_account": "Crie a sua conta aqui",
        "set_profile": "Configure seu perfil",
        "set_prices": "Defina preços para seu conjunto de habilidades.",
        "post_pic": "Publique fotos, vídeos e arquivos de seu trabalho manual.",
        "like": "Curtir as postagens de outros usuários.",
        "post_job": "Publique trabalhos com um preço ou negocie.",
        "review": "Avalie e avalie outros usuários.",
        "chat": "Bate-papo com outros usuários",
        "app_inc":
            "App inclui todas as regiões e sub-regiões de cada país africano.",
        "app_lan":
            "O aplicativo inclui traduções em árabe, inglês, francês e português.",
        "features": "Características",
        "arabic": "Árabe",
        "english": "Inglês",
        "french": "Francês",
        "portuguese": "Português",
      };
}

class ArLanguage implements BaseLanguage {
  @override
  Map<String, String> get language => {
        "download": "تحميل",
        "advertise": "إعلان عن عملك مجانا. احصل على المزيد من العملاء ...",
        "promote": "تعزيز روح المبادرة بين الأفارقة.",
        "become_active": "كن مستخدما نشطا",
        "create_account": "انشئ حساب",
        "set_profile": "قم بإعداد ملف التعريف الخاص بك",
        "set_prices": "حدد الأسعار لمجموعة المهارات الخاصة بك.",
        "post_pic": "انشر الصور ومقاطع الفيديو وملفات عملك اليدوي.",
        "like": "مثل مشاركات المستخدمين الآخرين.",
        "post_job": "انشر الوظائف بسعر أو تفاوض.",
        "review": "مراجعة وتقييم المستخدمين الآخرين.",
        "chat": "الدردشة مع المستخدمين الآخرين",
        "app_inc": "يشمل التطبيق جميع المناطق والمناطق الفرعية لكل بلد أفريقي",
        "app_lan":
            "يتضمن التطبيق ترجمات باللغات العربية والإنجليزية والفرنسية والبرتغالية.",
        "features": "سمات",
        "arabic": "العربية",
        "english": "الإنكليزية",
        "french": "الفرنسية",
        "portuguese": "البرتغالية",
      };
}
