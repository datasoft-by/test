using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ArtumDesignLab.Data;
using ArtumDesignLab;

namespace ArtumDesignLab.Biz
{
    public class BlogPhotoEntity
    {
        private SiteDataContext _siteDataContext;
        private BlogPhoto _Entity;
        public BlogPhoto Entity
        {
            get
            {
                if (_Entity == null)
                {
                    _Entity = new BlogPhoto();
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
        public BlogPhotoEntity()
        {
            _siteDataContext = DatabaseEngine.SiteDataContext;
        }
        public void Create()
        {
            _siteDataContext.BlogPhotos.InsertOnSubmit(Entity);
            _siteDataContext.SubmitChanges();
        }

        public void Read(int id)
        {
            this.Entity = _siteDataContext.BlogPhotos.Where(s => s.BlogPhotoID == id).FirstOrDefault();
        }

        public void Update()
        {
            _siteDataContext.SubmitChanges();
        }

        public void Delete(int id)
        {
            this.Read(id);
            _siteDataContext.BlogPhotos.DeleteOnSubmit(Entity);
            _siteDataContext.SubmitChanges();
        }

        public void DeleteByBlogID(int id)
        {
            _siteDataContext.BlogPhotos.DeleteAllOnSubmit(GetListByBlogID(id));
            _siteDataContext.SubmitChanges();
        }

        public IEnumerable<BlogPhoto> GetList()
        {
            return _siteDataContext.BlogPhotos.Select(s => s);
        }

        public IEnumerable<BlogPhoto> GetListByBlogID(int id)
        {
            return _siteDataContext.BlogPhotos.Select(s => s).Where(s => s.BlogID == id);
        }
    }
}
