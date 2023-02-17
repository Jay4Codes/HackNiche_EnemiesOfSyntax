import React from "react";
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

  return (
    <>
      <div>
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
