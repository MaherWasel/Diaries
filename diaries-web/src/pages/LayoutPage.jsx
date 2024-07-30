// src/pages/LayoutPage.js

import { Outlet } from "react-router-dom";
import LayoutHeader from "../components/layout/LayoutHeader";

export default function LayoutPage() {
  return (
    <main className="bg-gradient-to-br from-zinc-500 to-zinc-700 transition-all h-screen ease-linear duration-300 ">
      <LayoutHeader />
      <div className=" pt-24">
        <Outlet />
      </div>
    </main>
  );
}
