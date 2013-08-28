using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ArtumDesignLab.Data;
using ArtumDesignLab;

namespace ArtumDesignLab.Biz
{
    public class ProjectCategoryEntity
    {
        private SiteDataContext _siteDataContext;
        private ProjectCategory _entity;
        public ProjectCategory Entity
        {
            get
            {
                if (_entity == null)
                {
                    _entity = new ProjectCategory();
                    return _entity;
                }
                else
                    return _entity;
            }
            set
            {
                _entity = value;
            }
        }
        public ProjectCategoryEntity()
        {
            _siteDataContext = DatabaseEngine.SiteDataContext;
        }
        public void Create()
        {
            _siteDataContext.ProjectCategories.InsertOnSubmit(Entity);
            _siteDataContext.SubmitChanges();
        }

        public void Read(int id)
        {
            this.Entity = _siteDataContext.ProjectCategories.Where(s => s.ProjectCategoryID == id).FirstOrDefault();
        }

        public void Update()
        {
            _siteDataContext.SubmitChanges();
        }

        public void Delete(int id)
        {
            this.Read(id);
            _siteDataContext.ProjectCategories.DeleteOnSubmit(Entity);
            _siteDataContext.SubmitChanges();
        }

        public IEnumerable<ProjectCategory> GetList()
        {
            return _siteDataContext.ProjectCategories.Select(s => s);
        }

        public ProjectCategory GetCategoryByID(int id)
        {
            return _siteDataContext.ProjectCategories.Select(s => s).Where(s => s.ProjectCategoryID == id).FirstOrDefault();
        }

        public ProjectCategory GetByUrl(string url)
        {
            return _siteDataContext.ProjectCategories.Where(b => b.Url == url).FirstOrDefault();
        }
    }
}
