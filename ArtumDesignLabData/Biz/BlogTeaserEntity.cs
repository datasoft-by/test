using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ArtumDesignLab.Data;
using ArtumDesignLab;

namespace ArtumDesignLab.Biz
{
    public class BlogTeaserEntity
    {
        private SiteDataContext _siteDataContext;
        private BlogTeaser _Entity;

        public BlogTeaser Entity
        {
            get
            {
                if (_Entity == null)
                {
                    _Entity = new BlogTeaser();
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
        public BlogTeaserEntity()
        {
            _siteDataContext = DatabaseEngine.SiteDataContext;
        }
        public void Create()
        {
            _siteDataContext.BlogTeasers.InsertOnSubmit(Entity);
            _siteDataContext.SubmitChanges();
        }

        public void Read(int id)
        {
            this.Entity = _siteDataContext.BlogTeasers.Where(s => s.BlogTeaserID == id).FirstOrDefault();
        }

        public void Update()
        {
            _siteDataContext.SubmitChanges();
        }

        public void Delete(int id)
        {
            this.Read(id);
            _siteDataContext.BlogTeasers.DeleteOnSubmit(Entity);
            _siteDataContext.SubmitChanges();
        }

        public void DeleteByBlogID(int id)
        {
            var list = GetListByBlogID(id);

            foreach (var blogTeaser in list)
            {
                _siteDataContext.BlogTeasers.DeleteOnSubmit(blogTeaser);
            }
            
            _siteDataContext.SubmitChanges();
        }

        public IEnumerable<BlogTeaser> GetList()
        {
            return _siteDataContext.BlogTeasers.Select(s => s);
        }

        public IEnumerable<BlogTeaser> GetListByBlogID(int id)
        {
            return _siteDataContext.BlogTeasers.Select(s => s).Where(s => s.BlogID == id);
        }
    }
}
