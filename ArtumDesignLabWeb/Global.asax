<%@ Application Language="C#" %>

<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="ArtumDesignLab" %>
<%@ Import Namespace="ArtumDesignLab.Biz" %>
<%@ Import Namespace="ArtumDesignLab.Utils" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        // Code that runs on application startup

    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs

        if (Settings.CustomErrorPages)
        {

            //Exception ex = Server.GetLastError();

            //if (ex is HttpException)
            //{

            //    if (((HttpException)(ex)).GetHttpCode() == 404)

            //        Server.Transfer("~/404.aspx");

            //}
            //Exception exception = Server.GetLastError();

            //if (exception is HttpException)
            //{
            //    if ((exception as HttpException).GetHttpCode() == 404)
            //        Server.Transfer("~/404.aspx");
            //}

            Server.ClearError();
            Server.Transfer("~/404.aspx", false);

            //Response.Redirect("~/404.aspx");
        }
    }

    void Application_BeginRequest(object sender, EventArgs e)
    {
        if (!Settings.EnableUrlRewrite)
            return;
        
        HttpRequest request = HttpContext.Current.Request;
        HttpContext context = HttpContext.Current;

        string path = request.Path.ToLower();

//        if (path != "/" && path.EndsWith("/")) {
//            Response.Redirect(path.Substring(0, path.Length - 1), false);
//        }

        if (path != "/" && path.EndsWith("/")) {
            Response.Clear();
            Response.StatusCode = 301;
            Response.StatusDescription = "Moved Permanently";
            Response.AddHeader("Location", path.TrimEnd(new char[] {'/'}));
            Response.End();
        }

        ////for localhost
        //if (File.Exists(request.PhysicalPath) || request.Path.Contains(".aspx"))
        //{
        //    return;
        //}
        //context.RewritePath(path + ".aspx", request.PathInfo, request.QueryString.ToString());
        
        //for production
        if (File.Exists(request.PhysicalPath) || (path == "/") || !string.IsNullOrEmpty(Path.GetExtension(path)))
        {
            if (request.Path.Contains(".aspx") && !path.Contains("default.aspx") && !path.Contains("testleadsphone.aspx") && !path.Contains("admin") && (request.HttpMethod == "GET"))
            {
                Response.StatusCode = 301;
                string queryString = request.QueryString.ToString();
                Response.AddHeader("Location", SiteHelper.GetWebPath(request.Path.Replace(".aspx", "") +
                                                                     (string.IsNullOrEmpty(queryString)
                                                                          ? ""
                                                                          : "?" + queryString)));
                Response.End();
            }
        }
        else
        {
            // Path doesn't exist, need Url rewrite
            
            var matches = Regex.Matches(path, @"(\w+-?\d*)");

            if (matches.Count < 1)
                return;

            string section = matches[0].Value;

            if (matches.Count == 1)
            {
                // Redirect from old Urls (e.g. /blog?id=1)

                if (section == "blog")
                {
                    RedirectBlogRequest();
                }
                else if (section == "news")
                {
                    RedirectNewsRequest();
                }
                else if (section == "portfolio")
                {
                    RedirectPortfolioRequest();
                }
                else if (section == "about")
                {
                    RedirectAboutRequest();
                }
            }
            else
            {
                // Apply path rewrite (e.g for blog/blog_title_transliteration)

                if (section == "blog")
                {
                    RewriteBlogRequest(matches[1].Value);
                    return;
                }
                
                if (section == "news")
                {
                    RewriteNewsRequest(matches[1].Value);
                    return;
                }
                
                if (section == "portfolio")
                {
                    // portfolio/category_name | portfolio/category_name/page-1 | portfolio/category_name/title
                    RewritePortfolioRequest(matches[1].Value, matches.Count > 2 ? matches[2].Value : null);
                    return;
                }
                if (section == "about")
                {
                    RewriteAboutRequest(matches[1].Value);
                    return;
                }
                if (section == "pages")
                {
                    // portfolio/category_name | portfolio/category_name/page-1 | portfolio/category_name/title
                    RewritePagesRequest(matches[1].Value, matches.Count > 2 ? matches[2].Value : null);
                    return;
                }
            }

            context.RewritePath(path + ".aspx", request.PathInfo, request.QueryString.ToString());                    
        }
    }

    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }

    private void RedirectBlogRequest()
    {
        var request = HttpContext.Current.Request;

        if (request["page"] != null)
        {
            // blog?page=1 -> blog/page-1 

            int pageNumber;

            if (int.TryParse(request["page"], out pageNumber))
            {
                Response.StatusCode = 301;
                Response.AddHeader("Location", SiteHelper.GetWebPath("/blog/page-" + pageNumber));
                Response.End();
            }
        }
        else if (request["id"] != null)
        {
            // blog?id=1 -> blog/blog_post_title 

            int id;

            if (int.TryParse(request["id"], out id))
            {
                Blog blog = new BlogEntity().GetById(id);

                if (blog != null)
                {
                    Response.StatusCode = 301;
                    Response.AddHeader("Location", SiteHelper.GetWebPath("/blog/" + blog.Url));
                    Response.End();
                }
            }
        }
    }

    private void RedirectNewsRequest()
    {
        var request = HttpContext.Current.Request;

        if (request["page"] != null)
        {
            // news?page=1 -> news/page-1 

            int pageNumber;

            if (int.TryParse(request["page"], out pageNumber))
            {
                Response.StatusCode = 301;
                Response.AddHeader("Location", SiteHelper.GetWebPath("/news/page-" + pageNumber));
                Response.End();
            }
        }
        else if (request["id"] != null)
        {
            // news?id=1 -> news/news_title 

            int id;

            if (int.TryParse(request["id"], out id))
            {
                New news = new NewEntity().GetById(id);

                if (news != null)
                {
                    Response.StatusCode = 301;
                    Response.AddHeader("Location", SiteHelper.GetWebPath("/news/" + news.Url));
                    Response.End();
                }
            }
        }
    }

    private void RedirectPortfolioRequest()
    {
        var request = HttpContext.Current.Request;

        if (request["cat"] != null && request["id"] != null)
        {
            int id, catId;

            if (int.TryParse(request["cat"], out catId) && int.TryParse(request["id"], out id))
            {
                // portfolio?cat=1&id=2 -> portfolio/category_name/page_name
                
                ProjectCategory projectCategory = new ProjectCategoryEntity().GetCategoryByID(catId);
                Project project = new ProjectEntity().GetById(id);

                if (projectCategory != null && project != null)
                {
                    Response.StatusCode = 301;
                    Response.AddHeader("Location", SiteHelper.GetWebPath(string.Format("/portfolio/{0}/{1}", 
                                                                         projectCategory.Url, project.Url)));
                    Response.End();
                }
            }
        }
        else if (request["cat"] != null && request["page"] != null)
        {
            // portfolio?cat=1&page=2 -> portfolio/category_name/page-2

            int catId, pageNumber;

            if (int.TryParse(request["cat"], out catId) && int.TryParse(request["page"], out pageNumber))
            {
                ProjectCategory projectCategory = new ProjectCategoryEntity().GetCategoryByID(catId);
                                
                Response.StatusCode = 301;
                Response.AddHeader("Location", SiteHelper.GetWebPath(string.Format("/portfolio/{0}/page-{1}", 
                                                                     projectCategory.Url, pageNumber)));
                Response.End();
            }
        }
        else if (request["cat"] != null)
        {
            int catId;

            if (int.TryParse(request["cat"], out catId))
            {
                ProjectCategory projectCategory = new ProjectCategoryEntity().GetCategoryByID(catId);

                if (projectCategory != null)
                {
                    Response.StatusCode = 301;
                    Response.AddHeader("Location", SiteHelper.GetWebPath("/portfolio/" + projectCategory.Url));
                    Response.End();
                }
            }
        }
    }

    private void RedirectAboutRequest()
    {
        var request = HttpContext.Current.Request;

        if (request["id"] != null)
        {
            int id;

            if (int.TryParse(request["id"], out id))
            {
                // about?id=2 -> about//page_name

                Personnel personnel= new PersonnelEntity().GetByID(id);

                if (personnel != null)
                {
                    Response.StatusCode = 301;
                    Response.AddHeader("Location", SiteHelper.GetWebPath(string.Format("/about/{0}", personnel.Url)));
                    Response.End();
                }
            }
        }
    }

    private void RewriteBlogRequest(string target)
    {
        var request = HttpContext.Current.Request;
        var context = HttpContext.Current;       

        if (!target.StartsWith("page"))
        {
            // blog/blog_title
            Blog blog = new BlogEntity().GetByUrl(target);
            
            if (blog != null)
                context.RewritePath("~/Blog.aspx", request.PathInfo, "id=" + blog.BlogID);
        }
        else
        {
            // blog/page-1
            string pageNumber = Regex.Match(target, @"\d+$").Value;
            context.RewritePath("~/Blog.aspx", request.PathInfo, "page=" + pageNumber);
        }
    }
 
    private void RewriteAboutRequest(string target)
    {
        var request = HttpContext.Current.Request;
        var context = HttpContext.Current;

        // about/designer_name
        Personnel personnel = new PersonnelEntity().GetByUrl(target);

        if (personnel != null)
            context.RewritePath("~/About.aspx", request.PathInfo, "id=" + personnel.PersonnelID);
    }


    private void RewriteNewsRequest(string target)
    {
        var request = HttpContext.Current.Request;
        var context = HttpContext.Current;       

        if (!target.StartsWith("page"))
        {
            New nNew = new NewEntity().GetByUrl(target);
            
            if (nNew != null)
                context.RewritePath("~/News.aspx", request.PathInfo, "id=" + nNew.NewID);
        }
        else
        {
            // news/page-1
            string pageNumber = Regex.Match(target, @"\d+$").Value;
            context.RewritePath("~/News.aspx", request.PathInfo, "page=" + pageNumber);
        }
    }

    private void RewritePortfolioRequest(string category, string target)
    {
        var request = HttpContext.Current.Request;
        var context = HttpContext.Current; 
                
        ProjectCategory projectCategory = new ProjectCategoryEntity().GetByUrl(category);

        if (projectCategory == null) return;
        
        if (target == null)
        {
            context.RewritePath("~/Portfolio.aspx", request.PathInfo, "cat=" + projectCategory.ProjectCategoryID);            
        }
        else if (target.StartsWith("page"))
        {
            string pageNumber = Regex.Match(target, @"\d+$").Value;
            context.RewritePath("~/Portfolio.aspx", request.PathInfo, string.Format("cat={0}&page={1}",
                                                    projectCategory.ProjectCategoryID, pageNumber));            
        }
        else
        {
            Project project = new ProjectEntity().GetByUrl(target);

            if (project != null)
            {
                context.RewritePath("~/Portfolio.aspx", request.PathInfo, string.Format("cat={0}&id={1}",
                                                                          projectCategory.ProjectCategoryID, project.ProjectID));
            }
        }
    }

    private void RewritePagesRequest(string pagename, string target)
    {
        var request = HttpContext.Current.Request;
        var context = HttpContext.Current;

        if (target == null)
        {
            context.RewritePath("~/pages/" + pagename + ".aspx", request.PathInfo, "");
        }
        else if (target.StartsWith("page"))
        {
            string pageNumber = Regex.Match(target, @"\d+$").Value;
            context.RewritePath("~/pages/" + pagename + ".aspx", request.PathInfo, string.Format("page={0}", pageNumber));
        }
     }    

    </script>
