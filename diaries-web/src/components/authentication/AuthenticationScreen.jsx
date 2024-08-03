import { useContext, useEffect } from "react";
import { AuthContext } from "./AuthContextProvider";
import LoginContainer from "./LoginContainer";
import RegisterContainer from "./RegisterContainer";
import AuthHeader from "./AuthHeader";
import { useNavigate } from "react-router-dom";
import Utils from "../../utils/Utils";

export default function AuthenticationScreen() {
  const AuthCtx = useContext(AuthContext);
  const navigate = useNavigate();
  useEffect(() => {
    if (Utils.userId !== "") {
      navigate("/home");
    }
  }, []);
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
