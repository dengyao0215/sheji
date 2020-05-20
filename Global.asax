<%@ Application Language="C#" %>
<%@ Import Namespace="Web" %>
<%@ Import Namespace="System.Web.Optimization" %>
<%@ Import Namespace="System.Web.Routing" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e)
    {
        RouteConfig.RegisterRoutes(RouteTable.Routes);
        BundleConfig.RegisterBundles(BundleTable.Bundles);
          Application["VisitNumber"] = 0;
    }
     void Session_Start(object sender, EventArgs e)
    {
        //在新会话启动时运行的代码
        if (Application["VisitNumber"] != null)
        {
            Application.Lock();
            Application["VisitNumber"] = (int)Application["VisitNumber"] + 1;
            Application.UnLock();
        }
    }

    void Session_End(object sender, EventArgs e)
    {
        //在会话结束时运行的代码。 
        if (Application["VisitNumber"] != null)
        {
            Application.Lock();
            Application["VisitNumber"] = (int)Application["VisitNumber"] - 1;
            Application.UnLock();
        }
    }       

</script>
