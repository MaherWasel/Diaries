import DiariesProvider from "../components/innerHome/DiariesProvider";
import InnerHomeScreen from "../components/innerHome/InnerHomeScreen";

export default function InnerHomePage() {
  return (
    <DiariesProvider>
      <InnerHomeScreen />
    </DiariesProvider>
  );
}
