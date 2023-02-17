import "./CreatorStudio.css";
import React, { useState } from "react";

function CreatorStudio() {
  const [selectedImage, setSelectedImage] = useState(null);
  const [previewImage, setPreviewImage] = useState(null);

  const handleImageUpload = (event) => {
    const file = event.target.files[0];
    setSelectedImage(file);

    const reader = new FileReader();

    reader.onload = () => {
      setPreviewImage(reader.result);
    };

    reader.readAsDataURL(file);
  };

  return (
    <section className="creator-studio-section bottom-section">
      <form>
        <div className="col-lg-12">
          <div className="shadow rounded p-5 bg-white">
            <div className="row">
              <div className="right col-lg-6">
                <div className="form-group mb-4 pb-2 avatar">
                  {previewImage ? (
                    <img src={previewImage} alt="preview" />
                  ) : (
                    <>
                      <label>Upload Image</label>
                      <input
                        type="file"
                        className="form-control shadow-none"
                        placeholder="Choose your Image"
                        accept="image/*"
                        name="Image"
                        onChange={handleImageUpload}
                      />
                    </>
                  )}
                </div>
              </div>
              <div className="right col-lg-6">
                <div className="form-group mb-4 pb-2">
                  <label className="form-label">Title</label>
                  <input
                    type="text"
                    className="form-control shadow-none"
                    placeholder="Enter your title"
                    name="title"
                  />
                </div>
                <div className="form-group mb-4 pb-2">
                  <label className="form-label">Description</label>
                  <textarea
                    type="text"
                    className="form-control shadow-none"
                    placeholder="Enter the description"
                    name="description"
                  />
                </div>
                <div className="form-group mb-4 pb-2">
                  <label className="form-label">Location</label>
                  <input
                    type="text"
                    className="form-control shadow-none"
                    placeholder="Enter your location"
                    name="location"
                  />
                </div>
                <div className="form-group mb-4 pb-2">
                  <label className="form-label">Category</label>
                  <input
                    type="text"
                    className="form-control shadow-none"
                    placeholder="Enter your category"
                    name="category"
                  />
                </div>
                <div className="form-group mb-4 pb-2">
                  <label className="form-label">URL</label>
                  <input
                    type="text"
                    className="form-control shadow-none"
                    placeholder="Enter your url"
                    name="url"
                  />
                </div>
                <button className="btn btn-primary w-100" type="submit">
                  Post
                </button>
              </div>
            </div>
          </div>
        </div>
      </form>
    </section>
  );
}

export default CreatorStudio;
