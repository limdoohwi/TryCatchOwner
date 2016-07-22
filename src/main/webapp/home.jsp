<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="/test/resources/js/sockjs-1.1.1.min.js"></script>
<script type="text/javascript" src="/test/resources/js/json2.js"></script>
<script type="text/javascript">
        function setConnected(connected) {
            document.getElementById('connect').disabled = connected;
            document.getElementById('disconnect').disabled = !connected;
            document.getElementById('conversationDiv').style.visibility = connected ? 'visible' : 'hidden';
            document.getElementById('response').innerHTML = '';
        }

        function connect() {
        	if ('WebSocket' in window){
        		  console.log('Websocket supported');
        		  socket = new WebSocket('ws://'+document.location.hostname+':8080/owner//websocket');

        		  console.log('Connection attempted');

        		  socket.onopen = function(){
        			   console.log('Connection open!');
        			   setConnected(true);
        			}

        		  socket.onclose = function(){
        			  console.log('Disconnecting connection');
       			  }

        		  socket.onmessage = function (evt) 
        		     { 
        		        var received_msg = evt.data;
        		        console.log(received_msg);
        		        console.log('message received!');
        		        showMessage(received_msg);
        		     }

        		} else {
        		  console.log('Websocket not supported');
        		}
        }

        function disconnect() {
            setConnected(false);
            console.log("Disconnected");
        }

        function sendName() {
            var message = document.getElementById('message').value;
            socket.send(JSON.stringify({ 'message': message }));
        }

        function showMessage(message) {
            var response = document.getElementById('response');
            var p = document.createElement('p');
            p.style.wordWrap = 'break-word';
            p.appendChild(document.createTextNode(message));
            response.appendChild(p);
        }

</script>
</head>
<body>
     <input type="button" id="connect" onclick="connect()" value="연결"/>
     <input type="button" id="disconnect" onclick="disconnect()" value="해제"/>
     <input type="text" id="message" />
     <input type="button" id="send" onclick="sendName()" value="전송"/>
     <div id="conversationDiv">
     	<textarea rows="10" cols="50" id="response"></textarea>
     </div>
     
</body>
</html>