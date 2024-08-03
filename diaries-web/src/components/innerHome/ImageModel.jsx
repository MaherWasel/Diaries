export default function ImageModal({ src, onClose }) {
  return (
    <div
      className="fixed inset-0 bg-black bg-opacity-75 flex items-center justify-center z-50"
      onClick={onClose}
    >
      <img src={src} alt="" className="max-w-full max-h-full" />
    </div>
  );
}
