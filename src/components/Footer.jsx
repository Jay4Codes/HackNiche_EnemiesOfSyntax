import React from "react";
import { Link } from "react-router-dom";

const Footer = () => {
  return (
    <footer className="section-sm bg-tertiary">
      <div className="container">
        <div className="row justify-content-between">
          <div className="col-lg-2 col-md-4 col-6 mb-4">
            <div className="footer-widget">
              <h5 className="mb-4 text-primary font-secondary">News</h5>
              <ul className="list-unstyled">
                <li className="mb-2">
                  <Link href="service-details.html">Explore</Link>
                </li>
                <li className="mb-2">
                  <Link href="service-details.html">Local</Link>
                </li>
                <li className="mb-2">
                  <Link href="service-details.html">Global</Link>
                </li>
                <li className="mb-2">
                  <Link href="service-details.html">Trending</Link>
                </li>
              </ul>
            </div>
          </div>
          <div className="col-lg-2 col-md-4 col-6 mb-4">
            <div className="footer-widget">
              <h5 className="mb-4 text-primary font-secondary">Quick Links</h5>
              <ul className="list-unstyled">
                <li className="mb-2">
                  <Link href="#!">Home</Link>
                </li>
                <li className="mb-2">
                  <Link href="#!">Creator Studio</Link>
                </li>
                <li className="mb-2">
                  <Link href="#!">Analytics</Link>
                </li>
                <li className="mb-2">
                  <Link href="#!">Team</Link>
                </li>
              </ul>
            </div>
          </div>
          <div className="col-lg-2 col-md-4 col-6 mb-4">
            <div className="footer-widget">
              <h5 className="mb-4 text-primary font-secondary">Help</h5>
              <ul className="list-unstyled">
                <li className="mb-2">
                  <Link href="contact.html">Contact Us</Link>
                </li>
                <li className="mb-2">
                  <Link href="faq.html">FAQs</Link>
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
