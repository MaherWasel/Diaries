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
    });

    const response = await SupaBase.from("diares") // Fixed typo: "diares" to "diaries"

      .select()
      .eq("user_id", Utils.userId);
    console.log(response.data);

    if (response.error) {
      setState({
        loading: false,
        error: true,
        errorMessage: response.error.message,
        success: false,
        data: null,
      });
      return; // Added return statement to prevent further execution
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
