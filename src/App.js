import "./App.css";
import Home from "./pages/Home";
import Login from "./pages/Login";
import Signup from "./pages/Signup";
import NoMatch from "./pages/NoMatch";
import Explore from "./pages/Explore";
import Local from "./pages/Local";
import Global from "./pages/Global";
import Analyze from "./pages/Analyze";
import Trending from "./pages/Trending";
import Header from "./components/Header";
import Footer from "./components/Footer";
import Creator from "./pages/CreatorStudio";
import ScrollToTop from "./components/ScrollToTop";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";

function App() {
  return (
    <div className="App">
      <Router>
        <Header />
        <ScrollToTop />
        <Routes>
          <Route path="/login" element={<Login />} />
          <Route path="/" element={<Home />} />
          <Route path="/signup" element={<Signup />} />
          <Route path="/home" element={<Home />} />
          <Route path="*" element={<NoMatch />} />
          <Route path="/explore" element={<Explore />} />
          <Route path="/local" element={<Local />} />
          <Route path="/global" element={<Global />} />
          <Route path="/trending" element={<Trending />} />
          <Route path="/analyze" element={<Analyze />} />
          <Route path="/creator" element={<Creator />} />
        </Routes>
        <Footer />
      </Router>
    </div>
  );
}

export default App;
