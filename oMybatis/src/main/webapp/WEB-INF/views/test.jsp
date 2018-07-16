<html>

    <head>
        <script type="text/javascript" src="/path/to/brython.js"></script>
    </head>

    <body onload="brython()">
    
        <script type="text/python">

	a=1
	print(a)
	
  	 from browser import document, alert
		a=1
        def echo(event):
			alert(document["zone"].value)
            alert(print(a))
	document["mybutton"].bind("click", echo)


 def doPost(self,request,response):
        toClient = response.getWriter()
        response.setContentType ("text/html")
        toClient.println ("<html><head><title>Jython Servlet Test</title>"
        +
        "<body><h1>Servlet Jython Servlet at" +
        request.getContextPath() + "</h1></body></html>")


        </script>
        
<!-- <input id="zone"><button id="mybutton">click !</button> -->

        <p id="zone">
        
         </p>

    </body>

</html>