import { createContext, useState } from "react";

export const AuthContext = createContext({
  state: null,
  setState: () => {},
  reset: () => {},
});
export default function AuthContextProvider({ children }) {
  const [state, setState] = useState({
    loading: false,
    success: false,
    error: false,
    errorMessage: null,
    data: null,
    loginPage: true,
  });
  function reset() {
    setState((old) => ({
      loading: false,
      success: false,
      error: false,
      errorMessage: null,
      data: null,
      loginPage: true,
    }));
  }

  return (
    <AuthContext.Provider value={{ state, setState, reset }}>
      {children}
    </AuthContext.Provider>
  );
}
