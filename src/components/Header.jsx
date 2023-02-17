import React from "react";
import "./Header.css";
import { Link } from "react-router-dom";

const Header = () => {
  return (
    <header className="navigation bg-tertiary">
      <nav className="navbar navbar-expand-xl navbar-light text-center py-3">
        <div className="container">
          <Link className="navbar-brand" to="/">
            <img
              loading="prelaod"
              decoding="async"
              className="img-fluid"
              width="160"
              src="images/logo.png"
              alt="Wallet"
            />
          </Link>
          <button
            className="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
            <span className="navbar-toggler-icon"></span>
          </button>
          <div className="collapse navbar-collapse" id="navbarSupportedContent">
            <ul className="navbar-nav mx-auto mb-2 mb-lg-0">
              <li className="nav-item">
                <Link className="nav-link" to="/">
                  Home
                </Link>
              </li>
              <li className="nav-item">
                <Link className="nav-link" to="/creator">
                  Creator Studio
                </Link>
              </li>
              <li className="nav-item">
                <Link className="nav-link" to="/analyze">
                  Analytics
                </Link>
              </li>
              <li className="nav-item dropdown">
                <a
                  className="nav-link dropdown-toggle"
                  to="#"
                  id="navbarDropdown"
                  role="button"
                  data-bs-toggle="dropdown"
                  aria-expanded="false"
                >
                  News
                </a>
                <ul className="dropdown-menu" aria-labelledby="navbarDropdown">
                  <li>
                    <Link className="dropdown-item " to="/explore">
                      Explore
                    </Link>
                  </li>
                  <li>
                    <Link className="dropdown-item " to="/local">
                      Local
                    </Link>
                  </li>
                  <li>
                    <Link className="dropdown-item " to="/global">
                      Global
                    </Link>
                  </li>
                  <li>
                    <Link className="dropdown-item " to="/trending">
                      Trending
                    </Link>
                  </li>
                </ul>
              </li>
            </ul>
            <Link to="login" className="btn btn-outline-primary">
              Log In
            </Link>
            <Link to="signup" className="btn btn-primary ms-2 ms-lg-3">
              Sign Up
            </Link>
          </div>
        </div>
      </nav>
    </header>
  );
};

export default Header;
