import {
  GoogleMap,
  Marker,
  LoadScript,
  InfoWindow,
} from "@react-google-maps/api";
import React, { useEffect, useState } from "react";

const Explore = () => {
  const [showInfoWindow, setShowInfoWindow] = useState(false);

  const mapStyles = {
    height: "88vh",
    width: "75%",
  };

  const defaultCenter = {
    lat: 37.7749,
    lng: -122.4194,
  };

  const markerPosition = {
    lat: 37.7749,
    lng: -122.4194,
  };
  const handleMarkerClick = () => {
    setShowInfoWindow(true);
  };

  const handleInfoWindowClose = () => {
    setShowInfoWindow(false);
  };
  return (
    <div className="">
      <LoadScript googleMapsApiKey="AIzaSyAVgTxsIyo7r3Xyx4LIqBVrpjJJa0Jnbhs">
        <GoogleMap
          mapContainerStyle={mapStyles}
          zoom={13}
          center={defaultCenter}
        >
          <Marker position={markerPosition} onClick={handleMarkerClick}>
            {showInfoWindow && (
              <InfoWindow onCloseClick={handleInfoWindowClose}>
                <div style={{ backgroundColor: "#000" }}>
                  <h3>Marker Info</h3>
                  <p>This is the tooltip content</p>
                </div>
              </InfoWindow>
            )}
          </Marker>
        </GoogleMap>
      </LoadScript>
    </div>
  );
};

export default Explore;
