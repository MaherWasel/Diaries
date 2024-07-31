import { useTranslation } from "react-i18next";
import MainAppIcon from "../shared/mainAppIcon";
import { Link } from "react-router-dom";

export default function HomeScreen() {
  const { t } = useTranslation();
  return (
    <main className="w-full  p-2 flex flex-col ">
      <div className=" flex justify-between items-center flex-col-reverse sm:flex-row  text-sm sm:text-lg lg:text-2xl">
        <div className="sm:w-1/2 w-full m-2">{t("appInfo")}</div>
        <div className="w-1/4 ">
          <MainAppIcon />
        </div>
      </div>
      <Link
        to={"/login"}
        className="  hover:bg-zinc-800 duration-75 delay-50 hover:text-white flex sm:text-xl m-4 self-center w-1/2 text-xl p-4 rounded-3xl border-2 border-zinc-800 justify-center"
      >
        <label>{t("joinUs")}</label>
      </Link>
    </main>
  );
}
