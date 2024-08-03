import { useTranslation } from "react-i18next";

export default function HeaderDropDown({ isVisible }) {
  const { t } = useTranslation();
  return (
    <div
      className={`absolute top-12 bg-white w-32 sm:w-64 p-8 rounded-3xl transition-transform transition-opacity ease-in-out duration-300 ${
        isVisible ? "opacity-100 translate-y-0" : "opacity-0 translate-y-4"
      }`}
    >
      <ul className=" justify-center flex-col items-center grid grid-cols-1 divide-y ">
        <li className="p-4 flex self-center justify-center hover:text-gray-400 duration-75">
          {t("profile")}
        </li>

        <li className="p-4 flex self-center justify-center hover:text-gray-400 duration-75">
          {t("logout")}
        </li>
      </ul>
    </div>
  );
}
