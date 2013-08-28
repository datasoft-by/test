using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ArtumDesignLab.Data;
using ArtumDesignLab;

namespace ArtumDesignLab.Biz
{
    public class WorkPhotoEntity
    {
        private SiteDataContext _siteDataContext;
        private WorkPhoto _Entity;
        public WorkPhoto Entity
        {
            get
            {
                if (_Entity == null)
                {
                    _Entity = new WorkPhoto();
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
        public WorkPhotoEntity()
        {
            _siteDataContext = DatabaseEngine.SiteDataContext;
        }
        public void Create()
        {
            _siteDataContext.WorkPhotos.InsertOnSubmit(Entity);
            _siteDataContext.SubmitChanges();
        }

        public void Read(int id)
        {
            this.Entity = _siteDataContext.WorkPhotos.Where(s => s.WorkPhotoID == id).FirstOrDefault();
        }

        public void Update()
        {
            _siteDataContext.SubmitChanges();
        }

        public void Delete(int id)
        {
            this.Read(id);
            _siteDataContext.WorkPhotos.DeleteOnSubmit(Entity);
            _siteDataContext.SubmitChanges();
        }

        public void DeleteByWorkID(int id)
        {
            _siteDataContext.WorkPhotos.DeleteAllOnSubmit(GetListByWorkID(id));
            _siteDataContext.SubmitChanges();
        }

        public IEnumerable<WorkPhoto> GetList()
        {
            return _siteDataContext.WorkPhotos.Select(s => s);
        }

        public IEnumerable<WorkPhoto> GetListByWorkID(int id)
        {
            return _siteDataContext.WorkPhotos.Select(s => s).Where(s => s.WorkID == id);
        }
    }
}
