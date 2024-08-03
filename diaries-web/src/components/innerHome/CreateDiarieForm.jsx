import { useState, useRef, useContext } from "react";
import { SupaBase } from "../../api/SupaBaseClient";
import Utils from "../../utils/Utils";
import { DiariesContext } from "./DiariesProvider";
import LoadingIcon from "../shared/mainLoadinIcon";

export default function CreateDiarieForm() {
  const DiarieCtx = useContext(DiariesContext);
  const [state, setState] = useState({
    loading: false,
    success: false,
    error: false,
    errorMessage: null,
  });
  const dateRef = useRef();
  async function inserDiarie() {
    setState((old) => ({ ...old, loading: true }));
    const response = await SupaBase.from("diares").insert({
      user_id: Utils.userId,
      date: dateRef.current.value,
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
    <div className="w-full h-28  border-2 border-zinc-800 rounded-3xl mx-4 flex justify-start items-center text-gray-400">
      <input
        ref={dateRef}
        className="m-4 outline-none  bg-zinc-800 p-4 rounded-2xl "
        type="date"
      ></input>
      <button
        onClick={inserDiarie}
        disabled={state.loading}
        className="m-4 p-4 bg-zinc-800 rounded-2xl hover:bg-zinc-600 duration-75"
      >
        {state.loading ? <LoadingIcon /> : "Create A Diarie Date"}
      </button>
    </div>
  );
}
