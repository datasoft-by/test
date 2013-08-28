using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ArtumDesignLab.BaseObjects;
using ArtumDesignLab.Data;
using ArtumDesignLab.Utils;

namespace ArtumDesignLab.Biz
{
    public class NewEntity : IBizObject
    {
        private SiteDataContext _siteDataContext;
        private New _Entity;
        public New Entity
        {
            get
            {
                if (_Entity == null)
                {
                    _Entity = new New();
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
        public NewEntity()
        {
            _siteDataContext = DatabaseEngine.SiteDataContext;
        }
        public void Create()
        {
            _siteDataContext.News.InsertOnSubmit(Entity);
            _siteDataContext.SubmitChanges();
        }

        public void Read(int id)
        {
            this.Entity = _siteDataContext.News.Where(s => s.NewID == id).FirstOrDefault();
        }

        public void Update()
        {
            _siteDataContext.SubmitChanges();
        }

        public void Delete()
        {
            _siteDataContext.News.DeleteOnSubmit(Entity);
            _siteDataContext.SubmitChanges();
        }

        public IEnumerable<New> GetList()
        {
            return _siteDataContext.News.Select(s => s).OrderByDescending(s => s.Date);
        }

        public object GetListExceptOne(int id)
        {
            return _siteDataContext.News.Select(s => s).Where(s => s.NewID != id).OrderByDescending(s => s.Date);
        }

        public object GetLatestNews(int count)
        {
            return _siteDataContext.News.OrderByDescending(s => s.Date).Take(count);
        }

        public New GetById(int id)
        {
            return _siteDataContext.News.Where(b => b.NewID == id).FirstOrDefault();
        }

        public New GetByUrl(string url)
        {
            return _siteDataContext.News.Where(b => b.Url == url).FirstOrDefault();
        }
    }
}
