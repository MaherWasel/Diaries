import { createContext, useState } from "react";

import Utils from "../../utils/Utils";
import { SupaBase } from "../../api/SupaBaseClient";

export const DiariesContext = createContext({
  state: {},
  setState: () => {},
  refresh: () => {},
});

export default function DiariesProvider({ children }) {
  const [state, setState] = useState({
    loading: false,
    error: false,
    errorMessage: null, // Fixed typo: errroMessage to errorMessage
    success: false,
    data: null,
  });

  async function refresh() {
    setState({
      loading: true,
      error: false,
      errorMessage: null,
      success: false,
      data: null,
      initialize: true,
    });

    const response = await SupaBase.from("diares")

      .select()
      .eq("user_id", Utils.userId);

    if (response.error) {
      setState({
        loading: false,
        error: true,
        errorMessage: response.error.message,
        success: false,
        data: null,
      });
      return;
    }

    setState({
      loading: false,
      error: false,
      errorMessage: null,
      success: true,
      data: response.data,
    });
  }

  return (
    <DiariesContext.Provider value={{ state, setState, refresh }}>
      {children}
    </DiariesContext.Provider>
  );
}
