import React from "react";
import {
  GoogleMap,
  Marker,
  DirectionsRenderer,
  Circle,
  MarkerClusterer,
  LoadScript,
} from "@react-google-maps/api";

const Explore = () => {
  const mapStyles = {
    height: "100vh",
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
  return (
    <div className="">
      <LoadScript googleMapsApiKey="AIzaSyAVgTxsIyo7r3Xyx4LIqBVrpjJJa0Jnbhs">
        <GoogleMap
          mapContainerStyle={mapStyles}
          zoom={13}
          center={defaultCenter}
        >
          <Marker position={markerPosition} />
        </GoogleMap>
      </LoadScript>
    </div>
  );
};

export default Explore;
