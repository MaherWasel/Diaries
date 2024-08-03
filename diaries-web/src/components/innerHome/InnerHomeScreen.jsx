import InnerHomeHeader from "./InnerHomeHeader";
import CreateDiarieForm from "./CreateDiarieForm";
import DiariesDrawer from "./diariesDrawer";
import { useContext, useEffect } from "react";
import { DiariesContext } from "./DiariesProvider";
import LoadingIcon from "../shared/mainLoadinIcon";
import Utils from "../../utils/Utils";
import { useNavigate } from "react-router-dom";

export default function InnerHomeScreen() {
  const DiariesCtx = useContext(DiariesContext);
  const naviagte = useNavigate();
  useEffect(() => {
    if (Utils.userId == "") {
      naviagte("/");
    }
    DiariesCtx.refresh();
  }, []);
  return (
    <main className="bg-gray-500 w-full h-svh flex flex-col">
      {DiariesCtx.state.loading ? (
        <div className="w-full h-full flex justify-center items-center">
          <LoadingIcon />
        </div>
      ) : (
        <>
          <InnerHomeHeader userName={"ahmed"} />
          <div className="flex flex-row w-full h-full flex-1">
            <DiariesDrawer />

            <card className="flex justify-center items-start w-full h-full">
              <CreateDiarieForm />
            </card>
          </div>
        </>
      )}
    </main>
  );
}
