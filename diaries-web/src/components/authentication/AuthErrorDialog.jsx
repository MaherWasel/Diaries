import React, { forwardRef, useImperativeHandle, useState } from "react";

const AuthErrorDialog = forwardRef(({ errorMessage }, ref) => {
  const [open, setOpen] = useState(false);

  useImperativeHandle(ref, () => ({
    open: () => setOpen(true),
    close: () => setOpen(false),
  }));

  return (
    <div
      className={`fixed inset-0 flex items-center justify-center z-50 ${
        open ? "" : "hidden"
      }`}
    >
      <div className="fixed inset-0 bg-black opacity-50"></div>
      <div className="bg-white rounded-lg p-6 shadow-lg z-10 w-11/12 sm:w-1/2 md:w-1/3">
        <h2 className="text-xl font-semibold mb-4">Error</h2>
        <p>{errorMessage}</p>
        <div className="mt-4 flex justify-end">
          <button
            onClick={() => setOpen(false)}
            className="bg-red-500 text-white px-4 py-2 rounded-md hover:bg-red-700"
          >
            Close
          </button>
        </div>
      </div>
    </div>
  );
});

export default AuthErrorDialog;
