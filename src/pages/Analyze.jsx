import React from "react";
import Highcharts from "highcharts";
import HighchartsReact from "highcharts-react-official";

const Analyze = () => {
  const options = {
    title: {
      text: "My chart",
    },
    series: [
      {
        data: [1, 2, 3],
      },
    ],
  };

  return (
    <>
      <HighchartsReact highcharts={Highcharts} options={options} />
    </>
  );
};

export default Analyze;
