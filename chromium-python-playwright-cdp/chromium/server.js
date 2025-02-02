const {chromium} = require('playwright');
var http = require('http');
var httpProxy = require('http-proxy');

const port = 8080; // Use port 8080 by default

//
// Launch Chromium browser with CDP enabled.
//
chromium.launch({headless: true, args: ["--remote-debugging-port=9222"]})

//
// Set up our server to proxy standard HTTP requests.
//
var proxy = new httpProxy.createProxyServer({
    target: {
        host: '127.0.0.1',
        port: 9222
    }
});
var proxyServer = http.createServer(function (req, res) {
    proxy.web(req, res);
});

//
// Listen to the `upgrade` event and proxy the
// WebSocket requests as well.
//
proxyServer.on('upgrade', function (req, socket, head) {
    proxy.ws(req, socket, head);
});

proxyServer.listen(port, () => {
    console.log('Server is running on port ' + port);
});
