<%@ WebHandler Language="C#" Class="SubCallback" %>
/**
 * Here is a sample C#/ASP.NET code to implement the callback endpont.
 * If you have Visual Studio, just create a new item of type 
 * "Generic Handler" to create a .ashx file and copy this code.
 */
using System;
using System.Web;
using System.IO;

public class SubCallback : IHttpHandler {
	// This is secret verify_token that you should pass
	// to Facebook when add/modify a subscription.
	// Make sure to replace it with your own string!!
	public const string VERIFY_TOKEN = "abc";
	
	public void ProcessRequest (HttpContext context) {
		context.Response.ContentType = "text/plain";
		HttpRequest request = context.Request;
		if (request.HttpMethod == "GET" &&
			request.Params["hub.mode"] == "subscribe" &&
			request.Params["hub.verify_token"] == VERIFY_TOKEN)
		{
			context.Response.ContentType = "text/plain";
			context.Response.Write(request.Params["hub.challenge"]);
		}
		else if (request.HttpMethod == "POST")
		{
			StreamReader reader = new StreamReader(request.InputStream);
			string jsonString = reader.ReadToEnd();
			// Now use your favorate JSON decode and have fun with the data

		}
		
	}
 
	public bool IsReusable {
		get {
			return false;
		}
	}

}
