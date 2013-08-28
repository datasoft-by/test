using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ArtumDesignLab.BaseObjects;
using ArtumDesignLab.Data;
using ArtumDesignLab.Utils;

namespace ArtumDesignLab.Biz
{
    public class SpecialOfferEntity : IBizObject
    {
        private SiteDataContext _siteDataContext;
        private SpecialOffer _Entity;
        public SpecialOffer Entity
        {
            get
            {
                if (_Entity == null)
                {
                    _Entity = new SpecialOffer();
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
        public SpecialOfferEntity()
        {
            _siteDataContext = DatabaseEngine.SiteDataContext;
        }
        public void Create()
        {
            _siteDataContext.SpecialOffers.InsertOnSubmit(Entity);
            _siteDataContext.SubmitChanges();
        }

        public void Read(int id)
        {
            this.Entity = _siteDataContext.SpecialOffers.Where(s => s.SpecialOfferID == id).FirstOrDefault();
        }

        public void Update()
        {
            _siteDataContext.SubmitChanges();
        }

        public void Delete()
        {
            _siteDataContext.SpecialOffers.DeleteOnSubmit(Entity);
            _siteDataContext.SubmitChanges();
        }

        public IEnumerable<SpecialOffer> GetList()
        {
            return _siteDataContext.SpecialOffers.Select(s => s);
        }

        public SpecialOffer GetFirst()
        {
            return _siteDataContext.SpecialOffers.Select(s => s).FirstOrDefault();
        }
    }
}
