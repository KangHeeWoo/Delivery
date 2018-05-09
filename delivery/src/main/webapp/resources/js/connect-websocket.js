function setWebsocket() {
	var wsUri = 'ws://192.168.0.27:8090/delivery/socketRequest';

	websocket = new WebSocket(wsUri);
	websocket.onopen = function(e) {
		console.log(location.pathname);
		if(location.pathname == '/delivery/members/orderlist'){
			if('${requestPay}' == 'requestPay'){
 				websocket.send("requestPay:" + '${seller_email}');
 			}
		}
	}
	websocket.onmessage = function(e) {
		socketController(e.data);
	}
	websocket.onerror = function(e) {

	}
}