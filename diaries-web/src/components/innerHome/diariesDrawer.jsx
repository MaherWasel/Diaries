import { useContext, useState, useEffect, useRef } from "react";
import { DiariesContext } from "./DiariesProvider";
import { useTranslation } from "react-i18next";
import { Cancel, MenuSharp } from "@mui/icons-material";
import { DetailedDairieContext } from "./DetailedDairieProvider";

export default function DiariesDrawer() {
  const DiariesCtx = useContext(DiariesContext);
  const { i18n } = useTranslation();
  const [isOpen, setIsOpen] = useState(false);
  const { t } = useTranslation();
  const detailedDiarieCTX = useContext(DetailedDairieContext);
  const drawerRef = useRef(null);

  function handleDrawer() {
    setIsOpen((old) => !old);
  }

  useEffect(() => {
    function handleClickOutside(event) {
      if (drawerRef.current && !drawerRef.current.contains(event.target)) {
        setIsOpen(false);
      }
    }

    document.addEventListener("mousedown", handleClickOutside);
    return () => {
      document.removeEventListener("mousedown", handleClickOutside);
    };
  }, [drawerRef]);

  const drawerPosition = i18n.language === "ar" ? "right-0" : "left-0";

  return (
    <div className="relative">
      <div
        ref={drawerRef}
        className={`absolute w-52 bg-zinc-800 h-lvh z-50 ${
          isOpen ? drawerPosition : "hidden"
        } ${i18n.language === "ar" ? "rounded-tl-3xl" : "rounded-tr-3xl"}`}
      >
        <p className="flex m-4 font-bold text-gray-500 justify-center">
          {t("diaresDate")}
        </p>
        <div
          className="flex justify-end m-4 cursor-pointer"
          onClick={handleDrawer}
        >
          <Cancel sx={{ color: "red" }} />
        </div>
        <ul>
          {DiariesCtx.state.success &&
            DiariesCtx.state.data.map((e, index) => (
              <li
                onClick={() => detailedDiarieCTX.load(e.id)}
                key={index}
                className="m-4 p-4 bg-gray-600 rounded-xl hover:bg-gray-500 text-zinc-400 flex justify-center items-center"
              >
                {e.date}
              </li>
            ))}
        </ul>
      </div>

      <div
        className="flex m-4 h-min rounded-full border-2 border-zinc-800 p-2 cursor-pointer"
        onClick={handleDrawer}
      >
        <MenuSharp />
      </div>
    </div>
  );
}
