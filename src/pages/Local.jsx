import React,{useState, useEffect} from "react";
import ArticlePost from "../components/ArticlePost";

const Local = () => {

  const [res, setRes] = useState([]);
  const getGlobalNews = async () => {
    var requestOptions = {
      method: 'GET',
      redirect: 'follow'
    };
    
    fetch("http://hacknich.pythonanywhere.com/login/newsapi/?category=business&local=1", requestOptions)
      .then(response => response.json())
      .then(result => {
        setRes(result);
        return console.log(result);
      })
      .catch(error => console.log('error', error));
  }

  useEffect(() => {
    getGlobalNews();
  }, []);

  return (
    <div>
    {res.map(item => (
        <ArticlePost headline={item.title} creator={item.author} desc={item.description} img={item.urlToImage} />
    ))}
   
  </div>
  );
};

export default Local;
