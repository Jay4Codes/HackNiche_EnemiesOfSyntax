import React, { useState, useEffect } from "react";
import ArticlePost from "../components/ArticlePost";
import Fade from "react-reveal/Fade";

const Local = () => {
  const [res, setRes] = useState([]);
  const getGlobalNews = async () => {
    var requestOptions = {
      method: "GET",
      redirect: "follow",
    };

    fetch(
      "https://hacknich.pythonanywhere.com/login/newsapi/?category=business&local=1",
      requestOptions
    )
      .then((response) => response.json())
      .then((result) => {
        setRes(result);
        return console.log(result);
      })
      .catch((error) => console.log("error", error));
  };

  useEffect(() => {
    getGlobalNews();
  }, []);

  return (
    <div>
      <center>
        <h1>Local</h1>
        <p>Your personalized local feed</p>
      </center>
      <section className="section testimonials overflow-hidden bg-black">
        <Fade bottom cascade>
          <div className="container">
            <div className="row position-relative">
              {res.map((item) => (
                <ArticlePost
                  headline={item.title}
                  creator={item.author}
                  desc={item.description}
                  img={item.urlToImage}
                />
              ))}
            </div>
          </div>
        </Fade>
      </section>
    </div>
  );
};

export default Local;
