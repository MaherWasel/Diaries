import AuthContextProvider from "../components/authentication/AuthContextProvider";
import AuthenticationScreen from "../components/authentication/AuthenticationScreen";

export default function AuthPage() {
  return (
    <AuthContextProvider>
      <AuthenticationScreen />
    </AuthContextProvider>
  );
}
