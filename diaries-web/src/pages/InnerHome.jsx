import DetailedDairieProvider from "../components/innerHome/DetailedDairieProvider";
import DiariesProvider from "../components/innerHome/DiariesProvider";
import InnerHomeScreen from "../components/innerHome/InnerHomeScreen";

export default function InnerHomePage() {
  return (
    <DiariesProvider>
      <DetailedDairieProvider>
        <InnerHomeScreen />
      </DetailedDairieProvider>
    </DiariesProvider>
  );
}
