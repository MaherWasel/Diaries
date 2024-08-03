import { AttachFile } from "@mui/icons-material";
import { useState, useRef, useContext } from "react";
import { SupaBase } from "../../api/SupaBaseClient";
import Utils from "../../utils/Utils";
import { DetailedDairieContext } from "./DetailedDairieProvider";
import { useTranslation } from "react-i18next";
import LoadingIcon from "../shared/mainLoadinIcon";

export default function AddingForm({ setIsAdding }) {
  const [imageRefs, setImageRefs] = useState([]);
  const fileInputRef = useRef(null);
  const titleRef = useRef();
  const descriptionRef = useRef();
  const [uploading, setUploading] = useState(false);
  const { t } = useTranslation();
  const DiarieDetailCtx = useContext(DetailedDairieContext);

  const handleImageChange = (event) => {
    const files = Array.from(event.target.files);
    const newImageRefs = files.map((file) => URL.createObjectURL(file));
    setImageRefs((prev) => [...prev, ...newImageRefs]);
  };

  const handleImageRemove = (index) => {
    setImageRefs((prev) => prev.filter((_, i) => i !== index));
  };

  const handleIconClick = () => {
    fileInputRef.current.click();
  };

  async function uploadImage(file) {
    const fileName = `${Date.now()}-${file.name}`;

    // Upload the file
    const { data, error: uploadError } = await SupaBase.storage
      .from("images")
      .upload(fileName, file);

    if (uploadError) {
      console.error("Error uploading image:", uploadError.message);
      return null;
    }

    const response = SupaBase.storage.from("images").getPublicUrl(data.path);

    return response.data.publicUrl;
  }

  async function submit() {
    setUploading(true);
    try {
      const files = Array.from(fileInputRef.current.files);
      const imageUrls = await Promise.all(files.map(uploadImage));

      const validImageUrls = imageUrls.filter((url) => url !== null);

      const { error } = await SupaBase.from("diares_details").insert({
        title: titleRef.current.value,
        description: descriptionRef.current.value,
        images: validImageUrls,
        user_id: Utils.userId,
        diary_id: DiarieDetailCtx.state.id,
      });

      if (error) {
        console.error("Error inserting data:", error.message);
      } else {
        setImageRefs([]);
        fileInputRef.current.value = null;
        titleRef.current.value = "";
        descriptionRef.current.value = "";
      }
    } catch (error) {
      console.error("Unexpected error:", error.message);
    } finally {
      DiarieDetailCtx.load(DiarieDetailCtx.state.id);
      setUploading(false);
    }
    setIsAdding(false);
  }

  return (
    <div className="w-full h-auto flex flex-col text-lg p-4 space-y-4">
      <input
        ref={titleRef}
        className="p-4 rounded-3xl outline-none bg-gray-700 text-white placeholder-white placeholder-opacity-50"
        type="text"
        placeholder={t("title")}
      />
      <textarea
        ref={descriptionRef}
        className="p-4 rounded-3xl outline-none bg-gray-700 text-white placeholder-white placeholder-opacity-50"
        placeholder={t("description")}
        rows={5}
      ></textarea>
      <div className="flex flex-col md:flex-row items-start space-y-4 md:space-y-0 md:space-x-4">
        <div
          onClick={handleIconClick}
          className="flex items-center p-4 rounded-3xl bg-gray-700 cursor-pointer w-full md:w-auto"
        >
          <AttachFile className="text-white" />
          <input
            ref={fileInputRef}
            className="hidden"
            type="file"
            multiple
            onChange={handleImageChange}
          />
        </div>

        <div className="flex flex-wrap gap-2">
          {imageRefs.map((imageRef, index) => (
            <div key={index} className="relative w-24 h-24">
              <img
                src={imageRef}
                alt={`selected ${index}`}
                className="w-full h-full object-cover rounded-3xl"
              />
              <button
                onClick={() => handleImageRemove(index)}
                className="absolute top-0 right-0 bg-red-500 text-white p-1 rounded-full text-sm"
              >
                X
              </button>
            </div>
          ))}
        </div>
      </div>
      <button
        onClick={submit}
        className={`bg-blue-500 text-white p-2 rounded-lg w-full md:w-auto ${
          uploading ? "opacity-50 cursor-not-allowed" : ""
        }`}
        disabled={uploading}
      >
        {uploading ? <LoadingIcon /> : t("submit")}
      </button>
    </div>
  );
}
