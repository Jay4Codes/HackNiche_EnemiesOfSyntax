import React from "react";

const Footer = () => {
  return (
    <footer className="section-sm bg-tertiary">
      <div className="container">
        <div className="row justify-content-between">
          <div className="col-lg-2 col-md-4 col-6 mb-4">
            <div className="footer-widget">
              <h5 className="mb-4 text-primary font-secondary">Service</h5>
              <ul className="list-unstyled">
                <li className="mb-2">
                  <a href="service-details.html">Explore</a>
                </li>
                <li className="mb-2">
                  <a href="service-details.html">Trending</a>
                </li>
                <li className="mb-2">
                  <a href="service-details.html">Global</a>
                </li>
                <li className="mb-2">
                  <a href="service-details.html">Mortgage Loans</a>
                </li>
                <li className="mb-2">
                  <a href="service-details.html">Payday Loans</a>
                </li>
              </ul>
            </div>
          </div>
          <div className="col-lg-2 col-md-4 col-6 mb-4">
            <div className="footer-widget">
              <h5 className="mb-4 text-primary font-secondary">About</h5>
              <ul className="list-unstyled">
                <li className="mb-2">
                  <a href="#!">Benefits</a>
                </li>
                <li className="mb-2">
                  <a href="#!">Careers</a>
                </li>
                <li className="mb-2">
                  <a href="#!">Our Story</a>
                </li>
                <li className="mb-2">
                  <a href="#!">Team</a>
                </li>
              </ul>
            </div>
          </div>
          <div className="col-lg-2 col-md-4 col-6 mb-4">
            <div className="footer-widget">
              <h5 className="mb-4 text-primary font-secondary">Help</h5>
              <ul className="list-unstyled">
                <li className="mb-2">
                  <a href="contact.html">Contact Us</a>
                </li>
                <li className="mb-2">
                  <a href="faq.html">FAQs</a>
                </li>
              </ul>
            </div>
          </div>
        </div>
        <div className="row align-items-center mt-5 text-center text-md-start">
          <div className="col-lg-4">
            <a href="index.html">
              <img
                loading="prelaod"
                decoding="async"
                className="img-fluid"
                width="160"
                src="images/logo.png"
                alt="Wallet"
              />
            </a>
          </div>
          <div className="col-lg-4 col-md-6 mt-4 mt-lg-0">
            <ul className="list-unstyled list-inline mb-0 text-lg-center">
              <li className="list-inline-item me-4">
                <a className="text-black" href="privacy-policy.html">
                  Privacy Policy
                </a>
              </li>
              <li className="list-inline-item me-4">
                <a className="text-black" href="terms.html">
                  Terms &amp; Conditions
                </a>
              </li>
            </ul>
          </div>
          <div className="col-lg-4 col-md-6 text-md-end mt-4 mt-md-0">
            <ul className="list-unstyled list-inline mb-0 social-icons">
              <li className="list-inline-item me-3">
                <a
                  title="Explorer Facebook Profile"
                  className="text-black"
                  href="https://facebook.com/"
                >
                  <i className="fab fa-facebook-f"></i>
                </a>
              </li>
              <li className="list-inline-item me-3">
                <a
                  title="Explorer Twitter Profile"
                  className="text-black"
                  href="https://twitter.com/"
                >
                  <i className="fab fa-twitter"></i>
                </a>
              </li>
              <li className="list-inline-item me-3">
                <a
                  title="Explorer Instagram Profile"
                  className="text-black"
                  href="https://instagram.com/"
                >
                  <i className="fab fa-instagram"></i>
                </a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </footer>
  );
};

export default Footer;
