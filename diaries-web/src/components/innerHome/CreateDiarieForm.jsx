import { useState, useContext } from "react";
import { SupaBase } from "../../api/SupaBaseClient";
import Utils from "../../utils/Utils";
import { DiariesContext } from "./DiariesProvider";
import LoadingIcon from "../shared/mainLoadinIcon";
import { useTranslation } from "react-i18next";
import DatePicker from "react-datepicker";
import "react-datepicker/dist/react-datepicker.css";

export default function CreateDiarieForm() {
  const DiarieCtx = useContext(DiariesContext);
  const { t } = useTranslation();
  const [state, setState] = useState({
    loading: false,
    success: false,
    error: false,
    errorMessage: null,
  });
  const [selectedDate, setSelectedDate] = useState(null);

  async function insertDiarie() {
    if (!selectedDate) return;
    setState((old) => ({ ...old, loading: true }));
    const response = await SupaBase.from("diares").insert({
      user_id: Utils.userId,
      date: selectedDate.toISOString().split("T")[0],
    });
    if (response.error) {
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
      success: false,
      error: false,
      errorMessage: null,
    }));
    DiarieCtx.refresh();
  }

  return (
    <div className="w-full h-28 border-2 border-zinc-800 rounded-3xl mx-4 flex justify-start items-center text-gray-400">
      <DatePicker
        selected={selectedDate}
        onChange={(date) => setSelectedDate(date)}
        className="m-4 outline-none bg-zinc-800 p-4 rounded-2xl"
        dateFormat="yyyy-MM-dd"
        placeholderText={t("selectDate")}
        style={{ zIndex: 10, width: "100%" }}
      />
      <button
        onClick={insertDiarie}
        disabled={state.loading}
        className="m-4 p-4 bg-zinc-800 rounded-2xl hover:bg-zinc-600 duration-75"
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
