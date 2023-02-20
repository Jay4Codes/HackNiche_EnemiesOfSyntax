import "./CreatorStudio.css";
import React, { useState, useEffect } from "react";
import Swal from "sweetalert2";

function CreatorStudio() {
  const [selectedImage, setSelectedImage] = useState(null);
  const [previewImage, setPreviewImage] = useState(null);
  const [title, setTitle] = useState("");
  const [description, setDescription] = useState("");
  const [content, setContent] = useState("");
  const [url, setUrl] = useState("");
  const [location, setLocation] = useState("");
  const [category, setCategory] = useState("");

  const handleImageUpload = (event) => {
    const file = event.target.files[0];
    setSelectedImage(file);

    const reader = new FileReader();

    reader.onload = () => {
      setPreviewImage(reader.result);
    };

    reader.readAsDataURL(file);
  };

  const handleSubmit = (event) => {
    var myHeaders = new Headers();
    myHeaders.append(
      "Authorization",
      `Token ${sessionStorage.getItem("token")}`
    );

    var formdata = new FormData();
    formdata.append("post_user", "1");
    formdata.append("source", location);
    formdata.append("images", selectedImage);
    formdata.append("description", description);
    formdata.append("content", category);
    formdata.append("url", url);
    formdata.append("title", title);

    var requestOptions = {
      method: "POST",
      headers: myHeaders,
      body: formdata,
      redirect: "follow",
    };

    fetch(
      "https://hacknich.pythonanywhere.com/login/news-create",
      requestOptions
    )
      .then((response) => {
        if(response.status ==201){
          Swal.fire("This text has content with hate bitch", "error");
        }else if(response.status==200){
          Swal.fire("Post Created Successfully", "success");
        }
        return response.json();
      })
      .then((result) => console.log(result))
      .catch((error) => console.log("error", error));
    event.preventDefault();
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
                    value={title}
                    onChange={(e) => setTitle(e.target.value)}
                  />
                </div>
                <div className="form-group mb-4 pb-2">
                  <label className="form-label">Description</label>
                  <textarea
                    type="text"
                    className="form-control shadow-none"
                    placeholder="Enter the description"
                    name="description"
                    value={description}
                    onChange={(e) => setDescription(e.target.value)}
                  />
                </div>
                <div className="form-group mb-4 pb-2">
                  <label className="form-label">Location</label>
                  <input
                    type="text"
                    className="form-control shadow-none"
                    placeholder="Enter your location"
                    name="location"
                    value={location}
                    onChange={(e) => setLocation(e.target.value)}
                  />
                </div>
                <div className="form-group mb-4 pb-2">
                  <label className="form-label">Category</label>
                  <input
                    type="text"
                    className="form-control shadow-none"
                    placeholder="Enter your category"
                    name="category"
                    value={category}
                    onChange={(e) => setCategory(e.target.value)}
                  />
                </div>
                <div className="form-group mb-4 pb-2">
                  <label className="form-label">URL</label>
                  <input
                    type="text"
                    className="form-control shadow-none"
                    placeholder="Enter your url"
                    name="url"
                    value={url}
                    onChange={(e) => setUrl(e.target.value)}
                  />
                </div>
                <button
                  className="btn btn-primary w-100"
                  type="submit"
                  onClick={handleSubmit}
                >
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
