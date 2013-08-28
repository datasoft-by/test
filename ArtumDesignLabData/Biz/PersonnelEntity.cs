using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ArtumDesignLab.Data;
using ArtumDesignLab;
using System.IO;
using System.Web;
using ArtumDesignLab.Utils;

namespace ArtumDesignLab.Biz
{
    public class PersonnelEntity
    {
        private SiteDataContext _siteContext;

        private Personnel _Entity;
        public Personnel Entity
        {
            get
            {
                if (_Entity == null)
                {
                    _Entity = new Personnel();
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
        public PersonnelEntity()
        {
            _siteContext = DatabaseEngine.SiteDataContext;
        }
        public void Create()
        {
            _siteContext.Personnels.InsertOnSubmit(Entity);
            _siteContext.SubmitChanges();
        }

        public int Insert()
        {
            _siteContext.Personnels.InsertOnSubmit(Entity);
            _siteContext.SubmitChanges();
            return Entity.PersonnelID;
        }

        public void Read(int id)
        {
            this.Entity = _siteContext.Personnels.Where(s => s.PersonnelID == id).FirstOrDefault();
        }

        public void Update()
        {
            _siteContext.SubmitChanges();
        }

        public void Delete(int id)
        {
            this.Read(id);
            _siteContext.Personnels.DeleteOnSubmit(Entity);
            _siteContext.SubmitChanges();
        }
        public void DeleteAll()
        {
            _siteContext.Personnels.DeleteOnSubmit(Entity);
            _siteContext.SubmitChanges();
        }
        public void DeleteByID(int id)
        {
            Read(id);

            // TODO: delete all projects photos
            //File.Delete(HttpContext.Current.Request.MapPath(Settings.PortfolioImagesThumbsSmall + Entity.ProjectThumb));

            _siteContext.Personnels.DeleteOnSubmit(Entity);
            _siteContext.SubmitChanges();
        }
        public IEnumerable<Personnel> GetList()
        {
            return _siteContext.Personnels.Select(s => s);
        }
        
        public object GetList(int iCategoryId)
        {
            var _personnels = from personnels in _siteContext.Personnels
                              where personnels.PersonnelCategoryID == iCategoryId
                            select new
                            {
                                PersonalID = personnels.PersonnelID,
                                PersonalCategoryID = personnels.PersonnelCategoryID,
                                Name = personnels.Name,
                                ThumbImage = personnels.ThumbImage,
                                Experience = personnels.Experience,
                                Styles = personnels.Styles,
                                PersonalCategoryName = personnels.PersonnelCategory.Name,
                                Phone = personnels.Phone,
                                Email = personnels.Email,
                                Url = personnels.Url,
                                Place = personnels.Place
                            };
            return _personnels.OrderBy(s => s.Place);
        }
        public object GetListSortedByPlace()
        {
            var _personnels = from personnels in _siteContext.Personnels
                             select new
                             {
                                 PersonalID = personnels.PersonnelID,
                                 PersonalCategoryID = personnels.PersonnelCategoryID,
                                 Name = personnels.Name,
                                 ThumbImage = personnels.ThumbImage,
                                 Experience = personnels.Experience,
                                 Styles = personnels.Styles,
                                 PersonalCategoryName = personnels.PersonnelCategory.Name,
                                 Url = personnels.Url,
                                 Phone = personnels.Phone,
                                 Email = personnels.Email,
                                 Place = personnels.Place
                             };
            return _personnels.OrderBy(s => s.Place);
        }

        public Personnel GetByID(int id)
        {
            return _siteContext.Personnels.Where(b => b.PersonnelID == id).FirstOrDefault();
        }

        public IEnumerable<Personnel> GetByPersonnelCategoryID(int id)
        {
            return _siteContext.Personnels.Where(b => b.PersonnelCategoryID == id);
        }

        public Personnel GetByUrl(string url)
        {
            return _siteContext.Personnels.Where(b => b.Url == url).FirstOrDefault();
        }
    }
}
