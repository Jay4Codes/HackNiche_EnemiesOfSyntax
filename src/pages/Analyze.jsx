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

  const pieOptions = {
    chart: {
      type: "pie",
    },
    title: {
      text: "Browser market shares in January, 2018",
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
        name: "Brands",
        colorByPoint: true,
        data: [
          {
            name: "Chrome",
            y: 61.41,
            sliced: true,
            selected: true,
          },
          {
            name: "Internet Explorer",
            y: 11.84,
          },
          {
            name: "Firefox",
            y: 10.85,
          },
          {
            name: "Edge",
            y: 4.67,
          },
          {
            name: "Safari",
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
        "Toyota",
        "BMW",
        "Volvo",
        "Audi",
        "Peugeot",
        "Mercedes-Benz",
        "Volkswagen",
        "Polestar",
        "Kia",
        "Nissan",
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
      text: "Sold passenger cars in Norway by brand, January 2021",
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
