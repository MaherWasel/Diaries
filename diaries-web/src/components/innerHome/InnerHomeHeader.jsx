import React from "react";

import MainAppIcon from "../shared/mainAppIcon";
import { ExpandMore, MenuSharp } from "@mui/icons-material";
import LanguageIcon from "../shared/languageIcon";

export default function InnerHomeHeader({ userName }) {
  return (
    <header className="p-4">
      <ul className="flex justify-between items-center">
        <li className="flex items-center justify-center w-16 h-16">
          <MainAppIcon className="w-full h-full" />
        </li>
        <li className="flex items-center space-x-4">
          <span>{userName}</span>
          <ExpandMore sx={{ fontSize: 40 }} />
          <LanguageIcon />
        </li>
      </ul>
    </header>
  );
}
