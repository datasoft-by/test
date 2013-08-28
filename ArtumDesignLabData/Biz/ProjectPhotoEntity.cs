using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ArtumDesignLab.Data;
using ArtumDesignLab;

namespace ArtumDesignLab.Biz
{
    public class ProjectPhotoEntity
    {
        private SiteDataContext _siteContext;
        private ProjectPhoto _Entity;
        public ProjectPhoto Entity
        {
            get
            {
                if (_Entity == null)
                {
                    _Entity = new ProjectPhoto();
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
        public ProjectPhotoEntity()
        {
            _siteContext = DatabaseEngine.SiteDataContext;
        }
        public void Create()
        {
            _siteContext.ProjectPhotos.InsertOnSubmit(Entity);
            _siteContext.SubmitChanges();
        }

        public void Read(int id)
        {
            this.Entity = _siteContext.ProjectPhotos.Where(s => s.ProjectPhotoID == id).FirstOrDefault();
        }

        public void Update()
        {
            _siteContext.SubmitChanges();
        }

        public void Delete(int id)
        {
            this.Read(id);
            _siteContext.ProjectPhotos.DeleteOnSubmit(Entity);
            _siteContext.SubmitChanges();
        }

        public void DeleteByProjectID(int id)
        {
            _siteContext.ProjectPhotos.DeleteAllOnSubmit(GetListByProjectID(id));
            _siteContext.SubmitChanges();
        }

        public IEnumerable<ProjectPhoto> GetList()
        {
            return _siteContext.ProjectPhotos.Select(s => s);
        }

        public IEnumerable<ProjectPhoto> GetPhotosByProjectID(int id)
        {
            return _siteContext.ProjectPhotos.Select(s => s).Where(s => s.ProjectID == id);
        }

        public IEnumerable<ProjectPhoto> GetListByProjectID(int id)
        {
            return _siteContext.ProjectPhotos.Select(s => s).Where(s => s.ProjectID == id);
        }
    }
}
