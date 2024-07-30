// src/components/layout/LayoutHeader.js

import { NavLink } from "react-router-dom";
import LanguageIcon from "../shared/languageIcon";
import { useTranslation } from "react-i18next";

export default function LayoutHeader() {
  const { t } = useTranslation();
  let navLinkStyles = ({ isActive }) =>
    `p-4 ${isActive ? "text-zinc-300 underline" : ""}`;

  return (
    <header className="flex justify-between items-center w-full">
      <ul className="flex flex-row justify-center lg:text-3xl sm:text-xl  m-4 font-bold text-sm">
        <NavLink to="/" className={navLinkStyles}>
          {t("home")}
        </NavLink>
        <NavLink to="/policy" className={navLinkStyles}>
          {t("policy")}
        </NavLink>
        <NavLink to="/contactUs" className={navLinkStyles}>
          {t("contactUs")}
        </NavLink>
      </ul>
      <div className=" md:w-1/2 sm:w-1/3  w-1/4 bg-transparent m-4">
        <LanguageIcon />
      </div>
    </header>
  );
}
