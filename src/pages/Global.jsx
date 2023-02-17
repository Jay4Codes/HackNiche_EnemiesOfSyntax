import React,{useEffect,useState} from "react";
import ArticlePost from "../components/ArticlePost";

const Global = () => {
  const [res, setRes] = useState([]);
  const getGlobalNews = async () => {
    var requestOptions = {
      method: 'GET',
      redirect: 'follow'
    };
    
    fetch("http://hacknich.pythonanywhere.com/login/newsapi/?category=business&global=1", requestOptions)
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
      {/* <ArticlePost headline="Test" creator="Jay" desc="Desc" /> */}
    </div>
  );
};

export default Global;
