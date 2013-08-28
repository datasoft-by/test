using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ArtumDesignLab.Data;
using ArtumDesignLab;

namespace ArtumDesignLab.Biz
{
    public class ProjectPhotoCategoryEntity
    {
        private SiteDataContext _vekocontext;
        private ProjectPhotoCategory _Entity;
        public ProjectPhotoCategory Entity
        {
            get
            {
                if (_Entity == null)
                {
                    _Entity = new ProjectPhotoCategory();
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
        public ProjectPhotoCategoryEntity()
        {
            _vekocontext = DatabaseEngine.SiteDataContext;
        }
        public void Create()
        {
            _vekocontext.ProjectPhotoCategories.InsertOnSubmit(Entity);
            _vekocontext.SubmitChanges();
        }

        public void Read(int id)
        {
            this.Entity = _vekocontext.ProjectPhotoCategories.Where(s => s.ProjectPhotoCategoryID == id).FirstOrDefault();
        }

        public void Update()
        {
            _vekocontext.SubmitChanges();
        }

        public void Delete(int id)
        {
            this.Read(id);
            _vekocontext.ProjectPhotoCategories.DeleteOnSubmit(Entity);
            _vekocontext.SubmitChanges();
        }

        public IEnumerable<ProjectPhotoCategory> GetList()
        {
            return _vekocontext.ProjectPhotoCategories.Select(s => s);
        }
    }
}
