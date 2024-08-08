import { useState, useContext } from "react";
import { SupaBase } from "../../api/SupaBaseClient";
import Utils from "../../utils/Utils";
import { DiariesContext } from "./DiariesProvider";

import { useTranslation } from "react-i18next";
import LoadingIcon from "../shared/mainLoadinIcon";

export default function CreateDiarieForm() {
  const DiarieCtx = useContext(DiariesContext);
  const { t } = useTranslation();
  const [state, setState] = useState({
    loading: false,
    success: false,
    error: false,
    errorMessage: null,
  });
  const [selectedDate, setSelectedDate] = useState("");

  async function insertDiarie() {
    if (!selectedDate) return;
    setState((old) => ({ ...old, loading: true }));
    const response = await SupaBase.from("diares").insert({
      user_id: Utils.userId,
      date: selectedDate,
    });
    if (response.error) {
      console.log(response.error);
      setState((old) => ({
        ...old,
        loading: false,
        error: true,
        errorMessage: response.error.message,
      }));
      return;
    }
    setState((old) => ({
      loading: false,
      success: true,
      error: false,
      errorMessage: null,
    }));
    DiarieCtx.refresh();
  }

  return (
    <div className="w-full h-28 border-2 border-zinc-800 rounded-3xl mx-4 flex justify-start items-center text-gray-400">
      <input
        type="date"
        value={selectedDate}
        onChange={(e) => setSelectedDate(e.target.value)}
        className="m-4 sm:w-1/4 outline-none bg-zinc-800 p-4 rounded-2xl"
        placeholder={t("selectDate")}
        style={{ zIndex: 10 }}
      />
      <button
        onClick={insertDiarie}
        disabled={state.loading}
        className="m-4 sm:w-1/4 p-4 bg-zinc-800 rounded-2xl hover:bg-zinc-600 duration-75"
      >
        {state.loading ? <LoadingIcon /> : t("confirm")}
      </button>
      {state.error && (
        <label className="mx-4 text-red-500 font-bold">
          {state.errorMessage}
        </label>
      )}
    </div>
  );
}
