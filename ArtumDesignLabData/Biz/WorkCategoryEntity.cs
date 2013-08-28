using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ArtumDesignLab.Data;
using ArtumDesignLab;

namespace ArtumDesignLab.Biz
{
    public class WorkCategoryEntity
    {
        private SiteDataContext _vekocontext;
        private WorkCategory _Entity;
        public WorkCategory Entity
        {
            get
            {
                if (_Entity == null)
                {
                    _Entity = new WorkCategory();
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
        public WorkCategoryEntity()
        {
            _vekocontext = DatabaseEngine.SiteDataContext;
        }
        public void Create()
        {
            _vekocontext.WorkCategories.InsertOnSubmit(Entity);
            _vekocontext.SubmitChanges();
        }

        public void Read(int id)
        {
            this.Entity = _vekocontext.WorkCategories.Where(s => s.WorkCategoryID == id).FirstOrDefault();
        }

        public void Update()
        {
            _vekocontext.SubmitChanges();
        }

        public void Delete(int id)
        {
            this.Read(id);
            _vekocontext.WorkCategories.DeleteOnSubmit(Entity);
            _vekocontext.SubmitChanges();
        }

        public IEnumerable<WorkCategory> GetList()
        {
            return _vekocontext.WorkCategories.Select(s => s);
        }

        public WorkCategory GetCategoryByID(int id)
        {
            return _vekocontext.WorkCategories.Select(s => s).Where(s => s.WorkCategoryID == id).FirstOrDefault();
        }
    }
}
