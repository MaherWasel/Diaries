import { createContext, useState } from "react";
import { SupaBase } from "../../api/SupaBaseClient";

export const DetailedDairieContext = createContext({
  state: {},
  setState: () => {},
  load: (id) => {},
});
export default function DetailedDairieProvider({ children }) {
  const [state, setState] = useState({
    loading: false,
    error: false,
    errorMessage: null,
    success: false,
    data: null,
    initialized: false,
    id: null,
  });
  async function load(id) {
    setState((old) => ({ ...old, loading: true, initialized: true, id: id }));
    const response = await SupaBase.from("diares_details")
      .select()
      .eq("diary_id", id);
    if (response.error) {
      setState((old) => ({
        ...old,
        error: true,
        errorMessage: response.error.message,
        loading: false,
      }));
      return;
    }
    setState((old) => ({
      ...old,
      success: true,
      data: response.data,
      loading: false,
    }));
  }
  return (
    <DetailedDairieContext.Provider value={{ state, setState, load }}>
      {children}
    </DetailedDairieContext.Provider>
  );
}
