import { Link } from "react-router-dom";
import LanguageIcon from "../shared/languageIcon";
import MainAppIcon from "../shared/mainAppIcon";
import { useTranslation } from "react-i18next";

export default function AuthHeader() {
  const { t } = useTranslation();
  return (
    <header className="w-full ">
      <ul className="flex justify-between">
        <li className=" m-4 w-1/2">
          <div className="flex  items-center ">
            <Link className="mx-2 hover:text-white text-lg" to={"/"}>
              {t("home")}
            </Link>
            <div className="w-1/2 mx-2">
              <LanguageIcon />
            </div>
          </div>
        </li>
        <li className="w-16 m-4">
          <MainAppIcon />
        </li>
      </ul>
    </header>
  );
}
