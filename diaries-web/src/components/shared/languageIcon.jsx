// src/components/LanguageIcon.js

import { useTranslation } from "react-i18next";
import LocalStorage from "./localStorage";
import Utils from "../../utils/Utils";

export default function LanguageIcon() {
  const { i18n } = useTranslation();
  const { t } = useTranslation();
  const toggleLanguage = () => {
    const newLanguage = i18n.language === "en" ? "ar" : "en";
    LocalStorage.storeLanguage(newLanguage);
    i18n.changeLanguage(Utils.lang);
  };

  return (
    <button
      onClick={toggleLanguage}
      className="w-full h-full object-cover p-4 border-2 border-zinc-800 rounded-3xl hover:bg-zinc-800 duration-75 delay-50 hover:text-white text-sm sm:text-xl"
    >
      {i18n.language === "ar" ? t("en") : t("ar")}
    </button>
  );
}
