import { ExpandLess, ExpandMore } from "@mui/icons-material";
import { useState } from "react";
import ImageModal from "./ImageModel";

export default function DiarieElement({ diarie }) {
  const [open, setOpen] = useState(false);
  const [selectedImage, setSelectedImage] = useState(null);

  function handleOpen() {
    setOpen((old) => !old);
  }

  function handleImageClick(src) {
    setSelectedImage(src);
  }

  function handleCloseModal() {
    setSelectedImage(null);
  }

  return (
    <div className="bg-gray-600 sm:w-1/2 w-full flex justify-center m-4 p-8 rounded-2xl flex-col text-xl">
      <p className="flex justify-center m-2">
        <label className="mx-4">{diarie.title}</label>
        {open ? (
          <ExpandLess className="cursor-pointer" onClick={handleOpen} />
        ) : (
          <ExpandMore className="cursor-pointer" onClick={handleOpen} />
        )}
      </p>
      <div
        className={`transition-all duration-500 overflow-hidden ${
          open ? "max-h-screen opacity-100" : "max-h-0 opacity-0"
        }`}
      >
        <p>{diarie.description}</p>
        <ul className="flex flex-wrap gap-2 my-4">
          {diarie.images.map((e, index) => (
            <li key={index} className="w-24 h-24 ">
              <img
                src={e}
                alt="pickedImage"
                className="w-full h-full object-cover cursor-pointer rounded-xl"
                onClick={() => handleImageClick(e)}
              />
            </li>
          ))}
        </ul>
      </div>
      {selectedImage && (
        <ImageModal src={selectedImage} onClose={handleCloseModal} />
      )}
    </div>
  );
}
