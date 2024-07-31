import { PersonOutline } from "@mui/icons-material";
import { useContext, useRef } from "react";
import { AuthContext } from "./AuthContextProvider";
import { Link } from "react-router-dom";
import { useTranslation } from "react-i18next";
import { SupaBase } from "../../api/SupaBaseClient";
import AuthErrorDialog from "./AuthErrorDialog";
import MainLoadinIcon from ".././shared/mainLoadinIcon";

export default function LoginContainer() {
  const emailRef = useRef();
  const userNameRef = useRef();
  const passwordRef = useRef();
  const AuthCtx = useContext(AuthContext);
  const errorDialogRef = useRef();
  const { t } = useTranslation();

  let inputStyles =
    "rounded-3xl sm:w-1/2 p-6 text-xl m-4  outline-none bg-gray-600 duration-75 text-white w-full";
  async function handleRegister() {
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
    const userName = userNameRef.current.value;
    if (!userName) {
      AuthCtx.setState((old) => ({
        ...old,
        error: true,
        errorMessage: t("emptyUserName"),
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
    const response = await SupaBase.auth.signUp({
      email: email,
      password: password,
    });
    if (response.error) {
      AuthCtx.setState((old) => ({
        ...old,
        error: true,
        errorMessage: response.error.message,
        loading: false,
        success: false,
      }));
      errorDialogRef.current.open();
      return;
    }
    if (response.data) {
      const insertionResponse = await SupaBase.from("users").insert({
        id: response.data.user.id,
        email: email,
        userName: userName,
      });
      if (insertionResponse.error) {
        AuthCtx.setState((old) => ({
          ...old,
          error: true,
          errorMessage: insertionResponse.error.message,
          loading: false,
          success: false,
        }));
        errorDialogRef.current.open();
        return;
      } else {
        AuthCtx.setState((old) => ({
          ...old,
          error: false,
          errorMessage: null,
          loading: false,
          success: false,
          data: insertionResponse.data,
        }));
      }
      AuthCtx.setState((old) => ({
        ...old,
        loading: false,
        success: true,
        data: response.data,
        error: false,
        errorMessage: null,
      }));
      return;
    }
  }
  function handleSwapToLogin() {
    AuthCtx.setState((old) => ({ ...old, loginPage: true }));
  }
  return (
    <div className="w-full sm:w-5/6 bg-zinc-800 h-full flex rounded-3xl justify-center items-center flex-col">
      {AuthCtx.state.error && (
        <AuthErrorDialog
          errorMessage={AuthCtx.state.errorMessage}
          ref={errorDialogRef}
        />
      )}
      <PersonOutline sx={{ fontSize: 200, margin: 4, color: "#4B5563" }} />
      <input
        ref={emailRef}
        type="text"
        className={inputStyles}
        placeholder={t("enterYourEmail")}
      />
      <input
        ref={userNameRef}
        type="text"
        className={inputStyles}
        placeholder={t("enterYourUserName")}
      />
      <input
        ref={passwordRef}
        type="password"
        className={inputStyles}
        placeholder={t("enterYourPassword")}
      />
      <p className="text-2xl my-2">
        <label className=" text-zinc-500 m-1 mx-2">
          {t("youHaveAccount?")}{" "}
        </label>
        <label
          onClick={handleSwapToLogin}
          className="mx-2 text-gray-600 cursor-pointer"
        >
          {t("login")}
        </label>
      </p>
      <button
        onClick={handleRegister}
        disabled={AuthCtx.state.loading}
        className="  border-2 rounded-3xl border-gray-600 p-6 w-1/2 m-4 hover:bg-gray-600 hover:text-white text-xl duration-75 text-gray-600"
      >
        {AuthCtx.state.loading ? <MainLoadinIcon /> : t("register")}
      </button>
    </div>
  );
}
