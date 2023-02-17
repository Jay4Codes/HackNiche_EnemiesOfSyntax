// CSS Imports
import "./ScrollToTop.css";

// React Imports
import React from "react";

function ScrollToTop() {
  return (
    <div>
      <button
        className="scroll-to-top btn"
        onClick={() => {
          window.scrollTo({ top: 0, left: 0, behavior: "smooth" });
        }}
      >
        <i className="fas fa-angle-up"></i>
      </button>
    </div>
  );
}

export default ScrollToTop;
