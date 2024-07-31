import React from "react";

export default function LoadingIcon({ size = "40", strokeWidth = "4" }) {
  const radius = 50 - strokeWidth / 2; // 50 is half of the SVG width/height
  const circumference = 2 * Math.PI * radius;

  return (
    <div className="flex justify-center items-center">
      <svg
        width={size}
        height={size}
        viewBox="0 0 100 100"
        className="animate-spin"
      >
        <circle
          cx="50"
          cy="50"
          r={radius}
          stroke="white"
          strokeWidth={strokeWidth}
          fill="none"
          className="absolute"
        />
        <circle
          cx="50"
          cy="50"
          r={radius}
          stroke="gray"
          strokeWidth={strokeWidth}
          fill="none"
          strokeDasharray={circumference}
          strokeDashoffset={circumference / 4}
          className="transform rotate-90 origin-center"
          style={{ transition: "stroke-dashoffset 1s ease" }}
        />
      </svg>
    </div>
  );
}
