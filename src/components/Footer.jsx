import React from "react";
import { Link } from "react-router-dom";

const Footer = () => {
  return (
    <footer className="section-sm bg-dark">
      <div className="container">
        <div className="row justify-content-between">
          <div className="col-lg-2 col-md-4 col-6 mb-4">
            <div className="footer-widget">
              <h5 className="mb-4 text-primary font-secondary">News</h5>
              <ul className="list-unstyled">
                <li className="mb-2">
                  <Link to="/explore">Explore</Link>
                </li>
                <li className="mb-2">
                  <Link to="/local">Local</Link>
                </li>
                <li className="mb-2">
                  <Link to="/global">Global</Link>
                </li>
              </ul>
            </div>
          </div>
          <div className="col-lg-2 col-md-4 col-6 mb-4">
            <div className="footer-widget">
              <h5 className="mb-4 text-primary font-secondary">Quick Links</h5>
              <ul className="list-unstyled">
                <li className="mb-2">
                  <Link to="/">Home</Link>
                </li>
                <li className="mb-2">
                  <Link to="/creator">Creator Studio</Link>
                </li>
                <li className="mb-2">
                  <Link to="/analyze">Analytics</Link>
                </li>
              </ul>
            </div>
          </div>
          <div className="col-lg-2 col-md-4 col-6 mb-4">
            <div className="footer-widget">
              <h5 className="mb-4 text-primary font-secondary">Links</h5>
              <ul className="list-unstyled">
                <li className="mb-2">
                  <Link to="/">Link</Link>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </footer>
  );
};

export default Footer;
