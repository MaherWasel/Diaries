import { useContext } from "react";
import { AuthContext } from "./AuthContextProvider";
import LoginContainer from "./LoginContainer";
import RegisterContainer from "./RegisterContainer";
import AuthHeader from "./AuthHeader";

export default function AuthenticationScreen() {
  const AuthCtx = useContext(AuthContext);
  return (
    <div className="w-full h-screen bg-gray-500 flex flex-col">
      <AuthHeader />
      <div className="flex flex-1 items-center justify-center sm:m-4">
        {AuthCtx.state.loginPage ? <LoginContainer /> : <RegisterContainer />}
      </div>
      <button
        onClick={() =>
          AuthCtx.setState((old) => ({
            ...old,
            loginPage: !old.loginPage,
          }))
        }
        className="mt-4"
      >
        Toggle Login/Register
      </button>
    </div>
  );
}
