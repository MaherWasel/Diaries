import React from "react";
import ReactDOM from "react-dom/client";

import { initReactI18next } from "react-i18next";
import "./index.css";
import i18n from "i18next";
import ar from "./assets/translations/ar.json";
import en from "./assets/translations/en.json";
import { createBrowserRouter, RouterProvider } from "react-router-dom";
import LayoutPage from "./pages/LayoutPage";
import HomeScreen from "./components/home/homeScreen";
const router = createBrowserRouter([
  {
    path: "/",
    element: <LayoutPage />,
    children: [
      { path: "/", element: <HomeScreen /> },
      { path: "/policy", element: <p>wd</p> },
      { path: "/contactUs", element: <p>wd</p> },
    ],
  },
]);
i18n.use(initReactI18next).init({
  interpolation: { escapeValue: false },
  lng: "en",
  resources: {
    en: {
      translation: en,
    },
    ar: {
      translation: ar,
    },
  },

  react: {
    useSuspense: false,
    wait: true,
  },
});

const updateDirection = (lang) => {
  document.documentElement.dir = lang === "ar" ? "rtl" : "ltr";
};

updateDirection(i18n.language);

i18n.on("languageChanged", (lng) => {
  updateDirection(lng);
});

const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(
  <RouterProvider router={router}>
    <React.StrictMode></React.StrictMode>
  </RouterProvider>
);

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
