import React from "react";
import { Link } from "react-router-dom";

const NoMatch = () => {
  return (
    <div className="error">
      <center>
        <h1 className="text-primary">404</h1>
        <h4 className="mt-4">
          <i className="fa fa-thumbs-down text-danger"></i> Bad Request
        </h4>
        <p>Your Request resulted in an error.</p>
      </center>
      <div className="text-center mb-4 mt-4">
        <Link to="/" className="btn btn-primary">
          Back to Homepage
        </Link>
      </div>
    </div>
  );
};

export default NoMatch;
