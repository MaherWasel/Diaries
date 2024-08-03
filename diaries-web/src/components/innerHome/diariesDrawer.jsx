import { useContext } from "react";
import { DiariesContext } from "./DiariesProvider";
import { useTranslation } from "react-i18next";

export default function DiariesDrawer() {
  const DiariesCtx = useContext(DiariesContext);
  const { i18n } = useTranslation();
  console.log(DiariesCtx.state.data);
  return (
    <div
      className={`w-52 h-full overflow-scroll bg-zinc-800  ${
        i18n.language == "ar" ? "rounded-tl-3xl" : "rounded-tr-3xl"
      }`}
    >
      <ul>
        {DiariesCtx.state.success &&
          DiariesCtx.state.data.map((e) => (
            <li className="m-4 p-4 bg-gray-600 rounded-xl hover:bg-gray-500 text-zinc-400 flex justify-center items-center">
              {e.date}
            </li>
          ))}
      </ul>
    </div>
  );
}
