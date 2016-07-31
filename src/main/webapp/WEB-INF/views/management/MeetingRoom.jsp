<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- fullCalendar 2.2.5-->
<link rel="stylesheet" href="/owner/resources/plugins/fullcalendar/fullcalendar.min.css">
<link rel="stylesheet"
		href="/owner/resources/plugins/fullcalendar/fullcalendar.print.css" media="print">
<style>
.main-sidebar span {
	color: white;
}

</style>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<!-- Header -->
		<jsp:include page="../layout/Header.jsp" />

		<section class="content-header">
			<h1>
				Calendar <small>Control panel</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
				<li class="active">Calendar</li>
			</ol>
		</section>

		<!-- 오늘 예약 현황 -->
		<section class="content">
			<div class="row">
				<div class="col-md-3">
					<div class="box box-solid">
						<div class="box-header with-border">
							<h4 class="box-title">오늘 예약 현황</h4>
						</div>
						<div class="box-body">
							<!-- 예약 목록 -->
							<div id="external-events">
								<c:forEach var="todayMeetingRoom_dto" items="${meetingRoomReservationTodayList}">
									<c:if test="${todayMeetingRoom_dto.member_name == '없음'}">
										<div class="external-event bg-red">${todayMeetingRoom_dto.meeting_reservation_time}<div style="margin-right:0px">${todayMeetingRoom_dto.member_name}</div></div>
									</c:if>
									<c:if test="${todayMeetingRoom_dto.member_name != '없음'}">
										<div class="external-event bg-green">${todayMeetingRoom_dto.meeting_reservation_time}<div style="margin-right:0px">${todayMeetingRoom_dto.member_name}</div></div>
									</c:if>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
				
				<div class="col-md-9">
					<div class="box box-primary">
						<div class="box-body no-padding">
							<!-- THE CALENDAR -->
							<div id="calendar"></div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
		<!-- jQuery 2.2.0 -->
	<script src="/owner/resources/plugins/jQuery/jQuery-2.2.0.min.js"></script>
	<!-- jQuery UI 1.11.4 -->
	<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<!-- fullCalendar 2.2.5 -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
	<script src="/owner/resources/plugins/fullcalendar/fullcalendar.min.js"></script>
	<!-- Page specific script -->
	<script src="/owner/resources/Owner_js/ListAjax.js"></script>
	
	<script>
  $(function () {

    /* initialize the external events
     -----------------------------------------------------------------*/
    function ini_events(ele) {
      ele.each(function () {
        // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
        // it doesn't need to have a start or end
        var eventObject = {
          title: $.trim($(this).text()) // use the element's text as the event title
        };

        // store the Event Object in the DOM element so we can get to it later
        $(this).data('eventObject', eventObject);
      });
    }

    
    //미팅룸 예약 리스트 호출
    callList_Ajax("/owner/meetingRoom_list/meetingRoom/owner", successMeetingRoomList, null, null);
    
    function successMeetingRoomList(data){
    	alert("들어옴")
    	//Date for the calendar events (dummy data)
        var date = new Date();
        var d = date.getDate(),
            m = date.getMonth(),
            y = date.getFullYear();
        var eventsArray = new Array();
    	$.each(data.meetingRoomList, function(index, jsonData){
    		var meetingDate = jsonData.meeting_reservation_date.substring(0,10);
    		var finalMeetingDate = meetingDate.split("-");
    		var time = jsonData.meeting_reservation_time.split(",");
    		var event = {
    				title: "예약 리스트",
    				start: new Date(Number(finalMeetingDate[0]), Number(finalMeetingDate[1]-1), Number(finalMeetingDate[2]), Number(time[0]), 0),
    				end: new Date(Number(finalMeetingDate[0]), Number(finalMeetingDate[1]-1), Number(finalMeetingDate[2]), Number(time[1]), 0),
    				backgroundColor: "#00a65a", //Success (green)
    	            borderColor: "#00a65a" //Success (green)
    		};
    		eventsArray.push(event);
    		
    	});
    	 alert(eventsArray.length);
    	/* initialize the calendar
        -----------------------------------------------------------------*/
        $('#calendar').fullCalendar({
            header: {
              left: 'prev,next today',
              center: 'title',
              right: 'month,agendaWeek,agendaDay'
            },
            
         buttonText: {
           today: 'today',
           month: 'month',
           week: 'week',
           day: 'day'
         },
         //Random default events
         events: eventsArray,
         editable: false,
         droppable: true, // this allows things to be dropped onto the calendar !!!
         drop: function (date, allDay) { // this function is called when something is dropped

           // retrieve the dropped element's stored Event Object
           var originalEventObject = $(this).data('eventObject');

           // we need to copy it, so that multiple events don't have a reference to the same object
           var copiedEventObject = $.extend({}, originalEventObject);

           // assign it the date that was reported
           copiedEventObject.start = date;
           copiedEventObject.allDay = allDay;
           copiedEventObject.backgroundColor = $(this).css("background-color");
           copiedEventObject.borderColor = $(this).css("border-color");

           // render the event on the calendar
           // the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
           $('#calendar').fullCalendar('renderEvent', copiedEventObject, true);
         }
       });

       /* ADDING EVENTS */
       var currColor = "#3c8dbc"; //Red by default
       //Color chooser button
       var colorChooser = $("#color-chooser-btn");
       $("#color-chooser > li > a").click(function (e) {
         e.preventDefault();
         //Save color
         currColor = $(this).css("color");
       });
    }
  });
</script>
<!-- Footer -->
	<jsp:include page="../layout/Footer.jsp" />
</body>
</html>