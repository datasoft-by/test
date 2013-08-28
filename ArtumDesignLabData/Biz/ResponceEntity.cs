using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ArtumDesignLab.BaseObjects;
using ArtumDesignLab.Data;
using ArtumDesignLab.Utils;

namespace ArtumDesignLab.Biz
{
    public class ResponceEntity : IBizObject
    {
        private SiteDataContext _siteDataContext;
        private Response _Entity;
        public Response Entity
        {
            get
            {
                if (_Entity == null)
                {
                    _Entity = new Response();
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
        public ResponceEntity()
        {
            _siteDataContext = DatabaseEngine.SiteDataContext;
        }
        public void Create()
        {
            _siteDataContext.Responses.InsertOnSubmit(Entity);
            _siteDataContext.SubmitChanges();
        }

        public void Read(int id)
        {
            this.Entity = _siteDataContext.Responses.Where(s => s.ResponseId == id).FirstOrDefault();
        }

        public void Update()
        {
            _siteDataContext.SubmitChanges();
        }

        public void Delete()
        {
            _siteDataContext.Responses.DeleteOnSubmit(Entity);
            _siteDataContext.SubmitChanges();
        }

        public IEnumerable<Response> GetList()
        {
            return _siteDataContext.Responses.Select(s => s).OrderBy(s=>s.Position);
        }
    }
}
