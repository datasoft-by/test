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
    public class WorkEntity
    {
        private SiteDataContext _siteContext;
        private Work _Entity;
        public Work Entity
        {
            get
            {
                if (_Entity == null)
                {
                    _Entity = new Work();
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
        public WorkEntity()
        {
            _siteContext = DatabaseEngine.SiteDataContext;
        }
        public void Create()
        {
            _siteContext.Works.InsertOnSubmit(Entity);
            _siteContext.SubmitChanges();
        }

        public void Read(int id)
        {
            this.Entity = _siteContext.Works.Where(s => s.WorkID == id).FirstOrDefault();
        }

        public void Update()
        {
            _siteContext.SubmitChanges();
        }

        public void Delete(int id)
        {
            this.Read(id);
            _siteContext.Works.DeleteOnSubmit(Entity);
            _siteContext.SubmitChanges();
        }

        public void DeleteAll()
        {
            _siteContext.WorkPhotos.DeleteAllOnSubmit(_siteContext.WorkPhotos.Select(s => s).Where(s => s.WorkID == Entity.WorkID));
            _siteContext.Works.DeleteOnSubmit(Entity);
            _siteContext.SubmitChanges();
        }

        public void DeleteByID(int id)
        {
            Read(id);

            _siteContext.Works.DeleteOnSubmit(Entity);
            _siteContext.SubmitChanges();
        }

        public IEnumerable<Work> GetList()
        {
            return _siteContext.Works.Select(s => s);
        }

        public IEnumerable<Work> GetListByCategoryID(int id)
        {
            return _siteContext.Works.Select(s => s).Where(s => s.WorkCategoryID == id);
        }

        public IEnumerable<WorkPhoto> GetPhotos(int id)
        {
            return _siteContext.WorkPhotos.Select(s => s).Where(s => s.WorkID == id);
        }
    }
}
