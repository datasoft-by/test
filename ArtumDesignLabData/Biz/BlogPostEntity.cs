using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ArtumDesignLab.BaseObjects;
using ArtumDesignLab.Data;
using ArtumDesignLab.Utils;

namespace ArtumDesignLab.Biz
{
    public class BlogEntity : IBizObject
    {
        private SiteDataContext _siteDataContext;
        private Blog _Entity;
        public Blog Entity
        {
            get
            {
                if (_Entity == null)
                {
                    _Entity = new Blog();
                    return _Entity;
                }
                else
                    return _Entity;
            }
            set
            {
                _Entity = value;
            }
        }
        public BlogEntity()
        {
            _siteDataContext = DatabaseEngine.SiteDataContext;
        }
        public void Create()
        {
            _siteDataContext.Blogs.InsertOnSubmit(Entity);
            _siteDataContext.SubmitChanges();
        }

        public void Read(int id)
        {
            this.Entity = _siteDataContext.Blogs.Where(s => s.BlogID == id).FirstOrDefault();
        }

        public void Update()
        {
            _siteDataContext.SubmitChanges();
        }

        public void Delete()
        {
            _siteDataContext.Blogs.DeleteOnSubmit(Entity);
            _siteDataContext.SubmitChanges();
        }

        public IEnumerable<Blog> GetList()
        {
            return _siteDataContext.Blogs.Select(s => s).OrderByDescending(s => s.CreateDate);//.Where(s => s.Image != null)
        }

        public IEnumerable<Blog> GetByCategory(int id)
        {
            return _siteDataContext.Blogs.Select(s => s)
                                             .Where(s => s.BlogCategory.BlogCategoryID == id)
                                             .OrderByDescending(s => s.CreateDate);
        }

        public Blog GetById(int id)
        {
            return _siteDataContext.Blogs.Where(b => b.BlogID == id).FirstOrDefault();
        }

        public Blog GetByUrl(string url)
        {
            return _siteDataContext.Blogs.Where(b => b.Url == url).FirstOrDefault();
        }
        public IEnumerable<Blog> GetBySearchString(string strSearch)
        {
            return _siteDataContext.Blogs.Where(b => b.Header.ToString().Contains(strSearch));
        }
        public object GetLatest(int count)
        {
            var latest = from item in _siteDataContext.Blogs
                             select new
                             {
                                 ID = item.BlogID,
                                 Header = item.Header,
                                 Date = DateTimeHelper.GetDateInReadableFormat((DateTime)item.CreateDate),
                                 DateOrder = item.CreateDate,
                                 PreviewText = item.PreviewText,
                                 Text = item.Text,                                 
                                 Image = item.Image
                             };
            return latest.OrderByDescending(s => s.DateOrder).Take(count);
        }
    }
}
