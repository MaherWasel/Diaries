import { PersonOutline } from "@mui/icons-material";
import { useContext, useRef } from "react";
import { AuthContext } from "./AuthContextProvider";
import { useTranslation } from "react-i18next";
import AuthErrorDialog from "./AuthErrorDialog";
import { SupaBase } from "../../api/SupaBaseClient";
import MainLoadingIcon from "../shared/mainLoadinIcon";
import LocalStorage from "../shared/localStorage";
import { useNavigate } from "react-router-dom";

export default function LoginContainer() {
  const emailRef = useRef();
  const passwordRef = useRef();
  const AuthCtx = useContext(AuthContext);
  const { t } = useTranslation();
  const errorDialogRef = useRef();
  const navigate = useNavigate();
  let inputStyles =
    "rounded-3xl sm:w-1/2 p-6 text-xl m-4  outline-none bg-gray-600 duration-75 text-white w-full";
  async function handleSignIn() {
    const email = emailRef.current.value;
    if (!email) {
      AuthCtx.setState((old) => ({
        ...old,
        error: true,
        errorMessage: t("emptyEmailError"),
      }));
      errorDialogRef.current.open();
      return;
    }
    const password = passwordRef.current.value;
    if (!password) {
      AuthCtx.setState((old) => ({
        ...old,
        error: true,
        errorMessage: t("emptyPasswordError"),
      }));
      errorDialogRef.current.open();
      return;
    }
    AuthCtx.setState((old) => ({ ...old, loading: true }));
    const response = await SupaBase.auth.signInWithPassword({
      email: email,
      password: password,
    });
    if (response.error) {
      AuthCtx.setState((old) => ({
        error: true,
        errorMessage: response.error.message,
        loading: false,
        success: false,
        loginPage: true,
      }));
      errorDialogRef.current.open();
      return;
    }
    if (response.data) {
      AuthCtx.setState((old) => ({
        loading: false,
        success: true,
        data: response.data,
        error: false,
        errorMessage: null,
        loginPage: true,
      }));
      const userResponse = await SupaBase.from("users")
        .select()
        .eq("id", response.data.user.id);

      if (userResponse.data) {
        LocalStorage.storeUserName(userResponse.data[0].userName);
      }
      LocalStorage.storeUserId(response.data.user.id);

      navigate("/home");
      return;
    }
  }
  function handleSwapToRegister() {
    AuthCtx.setState((old) => ({ ...old, loginPage: false }));
  }
  return (
    <div className="w-full sm:w-5/6 bg-zinc-800 h-full flex rounded-3xl justify-center items-center flex-col">
      {
        <AuthErrorDialog
          errorMessage={AuthCtx.state.errorMessage}
          ref={errorDialogRef}
        />
      }
      <PersonOutline sx={{ fontSize: 150, margin: 4, color: "#4B5563" }} />
      <input
        ref={emailRef}
        type="text"
        className={inputStyles}
        placeholder={t("enterYourEmail")}
      />
      <input
        ref={passwordRef}
        type="password"
        className={inputStyles}
        placeholder={t("enterYourPassword")}
      />
      <p className="text-2xl my-2">
        <label className=" text-zinc-500 m-1 mx-2">
          {t("dontHaveAccount?")}{" "}
        </label>
        <label
          onClick={handleSwapToRegister}
          className="mx-2 text-gray-600 cursor-pointer"
        >
          {t("register")}
        </label>
      </p>
      <button
        onClick={handleSignIn}
        disabled={AuthCtx.state.loading}
        className=" text-gray-600 border-2 rounded-3xl border-gray-600 p-6 w-1/2 m-4 hover:bg-gray-600 hover:text-white text-xl duration-75 "
      >
        {AuthCtx.state.loading ? <MainLoadingIcon /> : t("login")}
      </button>
    </div>
  );
}
