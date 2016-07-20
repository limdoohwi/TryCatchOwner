<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart', 'bar']});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Month', 'coffee', 'drink', 'cake'],
          ['1월',  1000,      400, 1200],
          ['2월',  1170,      460, 100],
          ['3월',  660,       1120, 400],
          ['4월',  1030,      540, 200],
          ['5월',  1030,      540, 200],
          ['6월',  1030,      540, 200],
          ['7월',  1030,      540, 200],
          ['8월',  1030,      540, 200],
          ['9월',  1030,      540, 200],
          ['10월',  1030,      540, 200],
          ['11월',  1030,      540, 200],
          ['12월',  1030,      540, 200]
        ]);

        var options = {
          title: '2016 Month Profit',
          hAxis: {title: 'Month',  titleTextStyle: {color: '#333'}},
          vAxis: {minValue: 0}
        };

        var chart = new google.visualization.AreaChart(document.getElementById('Month-Profit-Div'));
        chart.draw(data, options);
      }
    </script>