using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ArtumDesignLab.Data;
using ArtumDesignLab;

namespace ArtumDesignLab.Biz
{
    public class BlogCategoryEntity
    {
        private SiteDataContext _siteDataContext;
        private BlogCategory _Entity;
        public BlogCategory Entity
        {
            get
            {
                if (_Entity == null)
                {
                    _Entity = new BlogCategory();
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
        public BlogCategoryEntity()
        {
            _siteDataContext = DatabaseEngine.SiteDataContext;
        }
        public void Create()
        {
            _siteDataContext.BlogCategories.InsertOnSubmit(Entity);
            _siteDataContext.SubmitChanges();
        }

        public void Read(int id)
        {
            this.Entity = _siteDataContext.BlogCategories.Where(s => s.BlogCategoryID == id).FirstOrDefault();
        }

        public void Update()
        {
            _siteDataContext.SubmitChanges();
        }

        public void Delete(int id)
        {
            this.Read(id);
            _siteDataContext.BlogCategories.DeleteOnSubmit(Entity);
            _siteDataContext.SubmitChanges();
        }

        public IEnumerable<BlogCategory> GetList()
        {
            return _siteDataContext.BlogCategories.Select(s => s);
        }
    }
}
