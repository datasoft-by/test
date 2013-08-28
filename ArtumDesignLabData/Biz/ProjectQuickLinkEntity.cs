using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ArtumDesignLab.BaseObjects;
using ArtumDesignLab.Data;
using ArtumDesignLab.Utils;

namespace ArtumDesignLab.Biz
{
    public class ProjectQuickLinkEntity : IBizObject
    {
        private SiteDataContext _siteDataContext;
        private ProjectQuickLink _Entity;
        public ProjectQuickLink Entity
        {
            get
            {
                if (_Entity == null)
                {
                    _Entity = new ProjectQuickLink();
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
        public ProjectQuickLinkEntity()
        {
            _siteDataContext = DatabaseEngine.SiteDataContext;
        }

        public void Create()
        {
            _siteDataContext.ProjectQuickLinks.InsertOnSubmit(Entity);
            _siteDataContext.SubmitChanges();
        }

        public void Read(int id)
        {
            this.Entity = _siteDataContext.ProjectQuickLinks.Where(s => s.ProjectQuickLinkID == id).FirstOrDefault();
        }

        public void Update()
        {
            _siteDataContext.SubmitChanges();
        }

        public void Delete()
        {
            _siteDataContext.ProjectQuickLinks.DeleteOnSubmit(Entity);
            _siteDataContext.SubmitChanges();
        }

        public IEnumerable<ProjectQuickLink> GetList()
        {
            return _siteDataContext.ProjectQuickLinks.Select(s => s);
        }

        public IEnumerable<ProjectQuickLink> GetByProjectID(int id)
        {
            return _siteDataContext.ProjectQuickLinks.Select(s => s).Where(s => s.ProjectID == id);
        }
    }
}
