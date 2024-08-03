import React, { useState } from "react";

import MainAppIcon from "../shared/mainAppIcon";
import { ExpandMore, ExpandLess } from "@mui/icons-material";
import LanguageIcon from "../shared/languageIcon";
import HeaderDropDown from "./HeaderDropDown";

export default function InnerHomeHeader({ userName }) {
  const [dropDown, setDropDown] = useState(false);

  return (
    <header className="p-4 w-full">
      <ul className="flex justify-between items-center">
        <li className="flex items-center justify-center w-16 h-16">
          <MainAppIcon className="w-full h-full" />
        </li>
        <li className="flex items-center space-x-4 w-1/2">
          <div
            onClick={() => setDropDown((old) => !old)}
            className="relative flex items-center justify-end cursor-pointer w-1/2"
          >
            <span>{userName}</span>
            {dropDown ? (
              <ExpandLess sx={{ fontSize: 40 }} />
            ) : (
              <ExpandMore sx={{ fontSize: 40 }} />
            )}
            <HeaderDropDown isVisible={dropDown} />
          </div>
          <LanguageIcon />
        </li>
      </ul>
    </header>
  );
}
