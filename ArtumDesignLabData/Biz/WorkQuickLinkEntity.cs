using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ArtumDesignLab.BaseObjects;
using ArtumDesignLab.Data;
using ArtumDesignLab.Utils;

namespace ArtumDesignLab.Biz
{
    public class WorkQuickLinkEntity : IBizObject
    {
        private SiteDataContext _siteDataContext;
        private WorkQuickLink _Entity;
        public WorkQuickLink Entity
        {
            get
            {
                if (_Entity == null)
                {
                    _Entity = new WorkQuickLink();
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
        public WorkQuickLinkEntity()
        {
            _siteDataContext = DatabaseEngine.SiteDataContext;
        }

        public void Create()
        {
            _siteDataContext.WorkQuickLinks.InsertOnSubmit(Entity);
            _siteDataContext.SubmitChanges();
        }

        public void Read(int id)
        {
            this.Entity = _siteDataContext.WorkQuickLinks.Where(s => s.WorkQuickLinkID == id).FirstOrDefault();
        }

        public void Update()
        {
            _siteDataContext.SubmitChanges();
        }

        public void Delete()
        {
            _siteDataContext.WorkQuickLinks.DeleteOnSubmit(Entity);
            _siteDataContext.SubmitChanges();
        }

        public IEnumerable<WorkQuickLink> GetList()
        {
            return _siteDataContext.WorkQuickLinks.Select(s => s);
        }

        public IEnumerable<WorkQuickLink> GetByWorkID(int id)
        {
            return _siteDataContext.WorkQuickLinks.Select(s => s).Where(s => s.WorkID == id);
        }
    }
}
