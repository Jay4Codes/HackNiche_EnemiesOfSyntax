import React, { useState, useEffect } from "react";
import {
  LineChart,
  Line,
  Bar,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  Legend,
  AreaChart,
  Area,
  ComposedChart,
} from "recharts";

const Analyze = () => {
  const data = [
    {
      name: "Day 1",
      Score: 3,
    },
    {
      name: "Day 2",
      Score: 3,
    },
    {
      name: "Day 3",
      Score: 2,
    },
    {
      name: "Day 4",
      Score: 1,
    },
    {
      name: "Day 5",
      Score: 1,
    },
    {
      name: "Day 6",
      Score: 1,
    },
    {
      name: "Day 7",
      Score: 2,
    },
  ];

  const data2 = [
    {
      name: "Monday",
      Score: 3,
    },
    {
      name: "Tueday",
      Score: 3,
    },
    {
      name: "Wednesday",
      Score: 2,
    },
    {
      name: "Thursday",
      Score: 1,
    },
    {
      name: "Friday",
      Score: 1,
    },
    {
      name: "Saturday",
      Score: 1,
    },
    {
      name: "Sunday",
      Score: 2,
    },
  ];

  const data3 = [
    {
      name: "Morning",
      Score: 3,
    },
    {
      name: "Afternoon",
      Score: 3,
    },
    {
      name: "Evening",
      Score: 2,
    },
    {
      name: "Night",
      Score: 1,
    },
    {
      name: "Midnight",
      Score: 1,
    },
  ];

  const data4 = [
    {
      name: "PHP",
      Commits: 6,
      Percentage: 5,
    },
    {
      name: "JavaScript",
      Commits: 24,
      Percentage: 20,
    },
    {
      name: "Python",
      Commits: 56,
      Percentage: 40,
    },
    {
      name: "Java",
      Commits: 8,
      Percentage: 5,
    },
    {
      name: "C++",
      Commits: 12,
      Percentage: 10,
    },
    {
      name: "CSS",
      Commits: 14,
      Percentage: 10,
    },
    {
      name: "HTML",
      Commits: 10,
      Percentage: 10,
    },
  ];

  const barColors = ["#92A3FD", "#C58BF2"];

  // const [csvinput, setCsvInput] = useState([]);
  // const [columns, setColumns] = useState([]);
  // const [codetoenglish, setCodetoenglish] = useState([]);
  // const [topCompany, setTopCompany] = useState([]);
  // const [fundedCompany, setFundedCompany] = useState([]);
  // const [companyCount, setCompanyCount] = useState([]);
  // const [monthFunding, setMonthFunding] = useState([]);
  // const [stages, setStages] = useState([]);
  // const [funding, setFunding] = useState([]);

  // useEffect(() => {
  //   (async () => {
  //     let postCsvInput;
  //     let postColumns;
  //     let postEnglish;
  //     let postTopCompany;
  //     let postFundedCompany;
  //     let postCompanyCount;
  //     let postMonthFunding;
  //     let postStages;
  //     let postFunding;

  //     let token = sessionStorage.getItem("token");
  //     try {
  //       let responseCsv = await fetch(
  //         "http://csvshow.pythonanywhere.com/visualapp/csvinput/",
  //         {
  //           method: "GET",
  //           headers: {
  //             Authorization: `Token ${token}`,
  //             "Content-Type": "application/json",
  //             Accept: "application/json",
  //           },
  //         }
  //       );
  //       let responseColumns = await fetch(
  //         "http://csvshow.pythonanywhere.com/visualapp/columns/",
  //         {
  //           method: "GET",
  //           headers: {
  //             Authorization: `Token ${token}`,
  //             "Content-Type": "application/json",
  //             Accept: "application/json",
  //           },
  //         }
  //       );
  //       let responseEnglish = await fetch(
  //         "http://csvshow.pythonanywhere.com/visualapp/columns/",
  //         {
  //           method: "GET",
  //           headers: {
  //             Authorization: `Token ${token}`,
  //             "Content-Type": "application/json",
  //             Accept: "application/json",
  //           },
  //         }
  //       );
  //       let responseTopCompany = await fetch(
  //         "http://csvshow.pythonanywhere.com/visualapp/Top25Fundedcompanybargraphapi/",
  //         {
  //           method: "GET",
  //           headers: {
  //             Authorization: `Token ${token}`,
  //             "Content-Type": "application/json",
  //             Accept: "application/json",
  //           },
  //         }
  //       );
  //       let responseFundedCompany = await fetch(
  //         "http://csvshow.pythonanywhere.com/visualapp/statefundedcompanycountPIE/",
  //         {
  //           method: "GET",
  //           headers: {
  //             Authorization: `Token ${token}`,
  //             "Content-Type": "application/json",
  //             Accept: "application/json",
  //           },
  //         }
  //       );
  //       let responseCompanyCount = await fetch(
  //         "http://csvshow.pythonanywhere.com/visualapp/companycountpermonthBARAPI/",
  //         {
  //           method: "GET",
  //           headers: {
  //             Authorization: `Token ${token}`,
  //             "Content-Type": "application/json",
  //             Accept: "application/json",
  //           },
  //         }
  //       );
  //       let responseMonthFunding = await fetch(
  //         "http://csvshow.pythonanywhere.com/visualapp/monthwisefundingPIE/",
  //         {
  //           method: "GET",
  //           headers: {
  //             Authorization: `Token ${token}`,
  //             "Content-Type": "application/json",
  //             Accept: "application/json",
  //           },
  //         }
  //       );
  //       let responseStages = await fetch(
  //         "http://csvshow.pythonanywhere.com/visualapp/stagesectormixPIE/",
  //         {
  //           method: "GET",
  //           headers: {
  //             Authorization: `Token ${token}`,
  //             "Content-Type": "application/json",
  //             Accept: "application/json",
  //           },
  //         }
  //       );
  //       let responseFunding = await fetch(
  //         "http://csvshow.pythonanywhere.com/visualapp/Fundingperregionbargraphapi/",
  //         {
  //           method: "GET",
  //           headers: {
  //             Authorization: `Token ${token}`,
  //             "Content-Type": "application/json",
  //             Accept: "application/json",
  //           },
  //         }
  //       );
  //       postCsvInput = await responseCsv.json();
  //       postColumns = await responseColumns.json();
  //       postEnglish = await responseEnglish.json();
  //       postTopCompany = await responseTopCompany.json();
  //       postFundedCompany = await responseFundedCompany.json();
  //       postCompanyCount = await responseCompanyCount.json();
  //       postMonthFunding = await responseMonthFunding.json();
  //       postStages = await responseStages.json();
  //       postFunding = await responseFunding.json();
  //       console.log(postCsvInput);
  //       console.log(postColumns);
  //       console.log(postEnglish);
  //       console.log(postTopCompany);
  //       console.log(postFundedCompany);
  //       console.log(postCompanyCount);
  //       console.log(postMonthFunding);
  //       console.log(postStages);
  //       console.log(postFunding);
  //     } catch (error) {
  //       console.log("Error" + error);
  //       postCsvInput = [];
  //       postColumns = [];
  //       postEnglish = [];
  //       postTopCompany = [];
  //       postFundedCompany = [];
  //       postCompanyCount = [];
  //       postMonthFunding = [];
  //       postStages = [];
  //       postFunding = [];
  //     }
  //     setCsvInput(postCsvInput);
  //     setColumns(postColumns);
  //     setCodetoenglish(postEnglish);
  //     setTopCompany(postTopCompany);
  //     setFundedCompany(postFundedCompany);
  //     setCompanyCount(postCompanyCount);
  //     setMonthFunding(postMonthFunding);
  //     setStages(postStages);
  //     setFunding(postFunding);
  //   })();
  // }, []);

  return (
    <>
      <div>
        {/* <img
          src="https://github-readme-stats.vercel.app/api?username=jay4codes&show_icons=true&bg_color=0d1117&text_color=40cfcd&border_color=444"
          height="165"
          style={{ marginLeft: "360px" }}
        /> */}
        <br />
        <br />
        <h3>
          <center>During the day commits of the user</center>
        </h3>
        <br />
        <LineChart width={600} height={300} data={data3}>
          <CartesianGrid strokeDasharray="3 3" />
          <XAxis dataKey="name" />
          <YAxis />
          <Tooltip />
          <Legend />
          <Line type="monotone" dataKey="Score" stroke="#8884d8" />
        </LineChart>
        <br />
        <h3>
          <center>Per day commits of user for a week</center>
        </h3>
        <br />
        <AreaChart
          style={{ marginLeft: 700 }}
          width={800}
          height={400}
          data={data}
          margin={{ top: 10, right: 30, left: 0, bottom: 0 }}
        >
          <CartesianGrid strokeDasharray="3 3" />
          <XAxis dataKey="name" />
          <YAxis />
          <Tooltip />
          <Area
            type="monotone"
            dataKey="Score"
            stroke="#8884d8"
            fill="#8884d8"
          />
        </AreaChart>
        <br />
        <h3>
          <center>Languages used by the user</center>
        </h3>
        <br />
        <ComposedChart
          width={800}
          height={400}
          data={data4}
          margin={{
            top: 20,
            right: 20,
            bottom: 20,
            left: 20,
          }}
        >
          <CartesianGrid stroke="#f5f5f5" />
          <XAxis dataKey="name" />
          <YAxis />
          <Tooltip />
          <Legend />
          <Area
            type="monotone"
            dataKey="Commits"
            fill="#8884d8"
            stroke="#8884d8"
          />
          <Bar dataKey="Commits" barSize={20} fill="#413ea0" />
          <Line type="monotone" dataKey="Percentage" stroke="#ff7300" />
        </ComposedChart>
      </div>
    </>
  );
};

export default Analyze;
