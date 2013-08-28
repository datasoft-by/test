using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ArtumDesignLab.BaseObjects;
using ArtumDesignLab.Data;
using ArtumDesignLab.Utils;

namespace ArtumDesignLab.Biz
{
    public class BlogQuickLinkEntity : IBizObject
    {
        private SiteDataContext _siteDataContext;
        private BlogQuickLink _Entity;
        public BlogQuickLink Entity
        {
            get
            {
                if (_Entity == null)
                {
                    _Entity = new BlogQuickLink();
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
        public BlogQuickLinkEntity()
        {
            _siteDataContext = DatabaseEngine.SiteDataContext;
        }

        public void Create()
        {
            _siteDataContext.BlogQuickLinks.InsertOnSubmit(Entity);
            _siteDataContext.SubmitChanges();
        }

        public void Read(int id)
        {
            this.Entity = _siteDataContext.BlogQuickLinks.Where(s => s.BlogQuickLinkID == id).FirstOrDefault();
        }

        public void Update()
        {
            _siteDataContext.SubmitChanges();
        }

        public void Delete()
        {
            _siteDataContext.BlogQuickLinks.DeleteOnSubmit(Entity);
            _siteDataContext.SubmitChanges();
        }

        public IEnumerable<BlogQuickLink> GetList()
        {
            return _siteDataContext.BlogQuickLinks.Select(s => s);
        }

        public IEnumerable<BlogQuickLink> GetByBlogPostID(int id)
        {
            return _siteDataContext.BlogQuickLinks.Select(s => s).Where(s => s.BlogID == id);
        }
    }
}
