import InnerHomeHeader from "./InnerHomeHeader";
import CreateDiarieForm from "./CreateDiarieForm";
import DiariesDrawer from "./diariesDrawer";
import { useContext, useEffect } from "react";
import { DiariesContext } from "./DiariesProvider";
import LoadingIcon from "../shared/mainLoadinIcon";
import Utils from "../../utils/Utils";
import { useNavigate } from "react-router-dom";
import DetailedDairieContainer from "./DetailedDairieContainer";

export default function InnerHomeScreen() {
  const DiariesCtx = useContext(DiariesContext);
  const navigate = useNavigate();

  useEffect(() => {
    if (Utils.userId === "") {
      navigate("/");
    }
    DiariesCtx.refresh();
  }, []);

  return (
    <main className="bg-gray-500 w-full h-screen flex flex-col overflow-auto">
      {(() => {
        if (DiariesCtx.state.loading) {
          return (
            <div className="w-full h-full flex justify-center items-center">
              <LoadingIcon />
            </div>
          );
        } else if (DiariesCtx.state.error) {
          return (
            <div className="w-full h-full flex justify-center items-center bg-gray-600 flex-col">
              <p className="text-white m-4">{DiariesCtx.state.errorMessage}</p>
              <button
                className="text-white bg-zinc-800 hover:bg-zinc-600 p-4 m-4 rounded-2xl duration-75"
                onClick={() => DiariesCtx.refresh()}
              >
                refresh
              </button>
            </div>
          );
        }
        return (
          <>
            <InnerHomeHeader userName={Utils.userName} />
            <div className="flex flex-row">
              <DiariesDrawer />

              <CreateDiarieForm />
            </div>
            <div className="flex  justify-center items-center flex-1">
              <DetailedDairieContainer />
            </div>
          </>
        );
      })()}
    </main>
  );
}
