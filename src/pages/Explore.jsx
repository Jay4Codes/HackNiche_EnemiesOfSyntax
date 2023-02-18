import {
  GoogleMap,
  Marker,
  LoadScript,
  InfoWindow,
} from "@react-google-maps/api";
import React, { useEffect, useState } from "react";
import notfound from "../assets/images/404.png";
import Fade from "react-reveal/Fade";
import "./Explore.css"

const Explore = () => {
  const [showInfoWindow, setShowInfoWindow] = useState(false);
  const [news_1, setNews_1] = useState([]);
  const [news_2, setNews_2] = useState([]);
  const [news_3, setNews_3] = useState([]);
  const [image, setImage] = useState([]);
  const [subscribed, setSubscribed] = useState(false);

  const mapStyles = {
    height: "88vh",
    width: "90%",
  };

  const defaultCenter = {
    lat: 19.1078,
    lng: 72.8371,
  };

  const markerPosition = {
    lat: 18.9254,
    lng: 72.8249,
  };
  const handleMarkerClick = () => {
    setShowInfoWindow(true);
    setNews_1(
      "Sushant Singh Rajput didn't die by suicide as his body had fracture marks, claims Cooper Hospital's mortuary worker"
    );
    setNews_2(
      "When I saw Rajput's body, there were marks of fracture and some marks around his neck due to some pressure. The marks of strangulation and hanging are different as I had been performing autopsies for nearly 28 years"
    );
    setImage(
      "https://img.etimg.com/thumb/msid-96531380,width-650,height-488,imgsize-39050,,resizemode-75/sushant-singh-rajput-was-found-hanging-in-his-flat-in-suburban-bandra-on-june-14-2020-.jpg"
    );
  };

  const handleInfoWindowClose = () => {
    setShowInfoWindow(false);
  };

  const handleSubscribeClick = () => {
    setSubscribed(true);
    setNews_3(
      "After further investigation by the Mumbai Police together with the Crime Branch of India in a special force brought together by the Chief Commissioner of Police, it has been found that the Sushant Singh Rajput was actually murdered in by the son of Uddhay Thackeray, Aditya Thackeray. The politician is now on the run and has special forces police after him. More to Follow"
    );
  };

  return (
    <div style={{ display: "flex" }}>
      <div className="col-lg-8">
        <LoadScript googleMapsApiKey="AIzaSyAVgTxsIyo7r3Xyx4LIqBVrpjJJa0Jnbhs">
          <GoogleMap
            mapContainerStyle={mapStyles}
            zoom={11}
            center={defaultCenter}
          >
            <Marker position={defaultCenter} />
            <Marker position={markerPosition} onClick={handleMarkerClick}>
              {showInfoWindow && (
                <InfoWindow onCloseClick={handleInfoWindowClose}>
                  <div>
                    <h3 style={{ color: "#000" }}>SSR Case</h3>
                    <p style={{ color: "#000" }}>View more on the sidebar</p>
                  </div>
                </InfoWindow>
              )}
            </Marker>
          </GoogleMap>
        </LoadScript>
      </div>
      <div className="col-lg-4 sidebar">
        {showInfoWindow ? (
          <>
            <Fade right>
              <img src={image} alt="" />
            </Fade>
            <ul>
              <Fade bottom cascade>
                <li>{news_1}</li>
                <li>{news_2}</li>
                <button
                  className="btn btn-primary"
                  onClick={handleSubscribeClick}
                >
                  Subscribe
                </button>
                {setSubscribed ? <li>{news_3}</li> : <></>}
              </Fade>
            </ul>
          </>
        ) : (
          <>
            <img src={notfound} alt="" />
          </>
        )}
      </div>
    </div>
  );
};

export default Explore;
