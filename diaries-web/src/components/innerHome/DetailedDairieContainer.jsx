import { useContext, useState } from "react";
import { DetailedDairieContext } from "./DetailedDairieProvider";
import LoadingIcon from "../shared/mainLoadinIcon";
import { Add, CalendarMonth, Cancel } from "@mui/icons-material";
import AddingForm from "./AddingForm";
import DiarieElement from "./DiarieElement";
import { useTranslation } from "react-i18next";

export default function DetailedDairieContainer() {
  const DetailedDairieCtx = useContext(DetailedDairieContext);
  const [isAdding, setIsAdding] = useState(false);
  const { t } = useTranslation();

  function handleAdding() {
    setIsAdding((old) => !old);
  }

  return (
    <div className="bg-zinc-800 w-full sm:w-2/3 m-4 text-white flex justify-center items-center flex-col rounded-3xl">
      {(() => {
        if (!DetailedDairieCtx.state.initialized) {
          return (
            <>
              <CalendarMonth className="m-4" sx={{ fontSize: 150 }} />
              <p className="text-xl m-4">{t("selectData")}</p>
            </>
          );
        }
        if (DetailedDairieCtx.state.loading) {
          return (
            <p className="m-4 p-8">
              <LoadingIcon />
            </p>
          );
        } else if (DetailedDairieCtx.state.error) {
          return <p>{DetailedDairieCtx.state.errorMessage}</p>;
        }
        return (
          <div className="w-full h-full">
            <p className="flex justify-end m-4 ">
              {DetailedDairieCtx.state.data.date}
              {!isAdding ? (
                <Add className="cursor-pointer" onClick={handleAdding} />
              ) : (
                <Cancel className="cursor-pointer" onClick={handleAdding} />
              )}
            </p>
            <div
              className={`transition-all duration-500 ease-in-out transform ${
                isAdding ? "max-h-screen opacity-100" : "max-h-0 opacity-0"
              } overflow-hidden`}
            >
              {isAdding && <AddingForm setIsAdding={setIsAdding} />}
            </div>
            {(() => {
              if (DetailedDairieCtx.state.data.length === 0) {
                return (
                  <p className="flex justify-center p-4 text-xl">
                    {t("noDiariesFound")}
                  </p>
                );
              } else {
                return (
                  <ul className="flex flex-col m-4">
                    {DetailedDairieCtx.state.data.map((e) => (
                      <li key={e.id} className="flex justify-center">
                        <DiarieElement diarie={e} />
                      </li>
                    ))}
                  </ul>
                );
              }
            })()}
          </div>
        );
      })()}
    </div>
  );
}
