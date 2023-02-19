import React from "react";
import Highcharts from "highcharts";
import HighchartsReact from "highcharts-react-official";

const Analyze = () => {
  const options = {
    title: {
      text: "News posted By you",
    },
    series: [
      {
        data: [1, 2, 3],
      },
    ],
  };

  const pieOptions = {
    chart: {
      type: "pie",
    },
    title: {
      text: "Most categoty news read in January, 2023",
    },
    subtitle: {
      text: 'Source: <a href="http://statcounter.com" target="_blank">statcounter.com</a>',
    },
    plotOptions: {
      pie: {
        allowPointSelect: true,
        cursor: "pointer",
        dataLabels: {
          enabled: true,
          format: "<b>{point.name}</b>: {point.percentage:.1f} %",
        },
      },
    },
    series: [
      {
        name: "Categories",
        colorByPoint: true,
        data: [
          {
            name: "Business",
            y: 61.41,
            sliced: true,
            selected: true,
          },
          {
            name: "Sports",
            y: 11.84,
          },
          {
            name: "Entertainment",
            y: 10.85,
          },
          {
            name: "Education",
            y: 4.67,
          },
          {
            name: "Politics",
            y: 4.18,
          },
          {
            name: "Other",
            y: 7.05,
          },
        ],
      },
    ],
  };

  const baroptions = {
    chart: {
      renderTo: "container",
      type: "column",
      options3d: {
        enabled: true,
        alpha: 18,
        beta: 20,
        depth: 100,
        viewDistance: 25,
      },
    },
    xAxis: {
      categories: [
        "ABP News",
        "Aaj Tak",
        "BBC News",
        "CNN News",
        "NDTV News",
        "Times Now",
        "Zee News",
        "India Today",
        "Republic TV",
        "News 18 India",
      ],
    },
    yAxis: {
      title: {
        enabled: false,
      },
    },
    tooltip: {
      headerFormat: "<b>{point.key}</b><br>",
      pointFormat: "Cars sold: {point.y}",
    },
    title: {
      text: "Stats of News posted by Journalists",
      align: "left",
    },
    subtitle: {
      text:
        "Source: " +
        '<a href="https://ofv.no/registreringsstatistikk"' +
        'target="_blank">OFV</a>',
      align: "left",
    },
    legend: {
      enabled: false,
    },
    plotOptions: {
      column: {
        depth: 25,
      },
    },
    series: [
      {
        data: [1318, 1073, 1060, 813, 775, 745, 537, 444, 416, 395],
        colorByPoint: true,
      },
    ],
  };

  return (
    <>
      <HighchartsReact highcharts={Highcharts} options={options} />
      <HighchartsReact
        highcharts={Highcharts}
        options={pieOptions}
        allowChartUpdate={true}
        immutable={false}
        updateArgs={[true, true, true]}
      />
      <HighchartsReact highcharts={Highcharts} options={baroptions} />
    </>
  );
};

export default Analyze;
