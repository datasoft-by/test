using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ArtumDesignLab.Data;
using ArtumDesignLab;

namespace ArtumDesignLab.Biz
{
    public class PersonnelCategoryEntity
    {
        private SiteDataContext _siteDataContext;
        private PersonnelCategory _entity;
        public PersonnelCategory Entity
        {
            get
            {
                if (_entity == null)
                {
                    _entity = new PersonnelCategory();
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
        public PersonnelCategoryEntity()
        {
            _siteDataContext = DatabaseEngine.SiteDataContext;
        }
        public void Create()
        {
            _siteDataContext.PersonnelCategories.InsertOnSubmit(Entity);
            _siteDataContext.SubmitChanges();
        }

        public void Read(int id)
        {
            this.Entity = _siteDataContext.PersonnelCategories.Where(s => s.PersonnelCategoryID == id).FirstOrDefault();
        }

        public void Update()
        {
            _siteDataContext.SubmitChanges();
        }

        public void Delete(int id)
        {
            this.Read(id);
            _siteDataContext.PersonnelCategories.DeleteOnSubmit(Entity);
            _siteDataContext.SubmitChanges();
        }

        public IEnumerable<PersonnelCategory> GetList()
        {
            return _siteDataContext.PersonnelCategories.Select(s => s);
        }

        public PersonnelCategory GetCategoryByID(int id)
        {
            return _siteDataContext.PersonnelCategories.Select(s => s).Where(s => s.PersonnelCategoryID == id).FirstOrDefault();
        }

    }
}
