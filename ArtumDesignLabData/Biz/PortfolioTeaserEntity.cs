using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ArtumDesignLab.Data;
using ArtumDesignLab;

namespace ArtumDesignLab.Biz
{
    public class PortfolioTeaserEntity
    {
        private SiteDataContext _siteDataContext;
        private PorfolioTeaser _Entity;

        public PorfolioTeaser Entity
        {
            get
            {
                if (_Entity == null)
                {
                    _Entity = new PorfolioTeaser();
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
        public PortfolioTeaserEntity()
        {
            _siteDataContext = DatabaseEngine.SiteDataContext;
        }
        public void Create()
        {
            _siteDataContext.PorfolioTeasers.InsertOnSubmit(Entity);
            _siteDataContext.SubmitChanges();
        }

        public void Read(int id)
        {
            this.Entity = _siteDataContext.PorfolioTeasers.Where(s => s.PortfolioTeaserID == id).FirstOrDefault();
        }

        public void Update()
        {
            _siteDataContext.SubmitChanges();
        }

        public void Delete(int id)
        {
            this.Read(id);
            _siteDataContext.PorfolioTeasers.DeleteOnSubmit(Entity);
            _siteDataContext.SubmitChanges();
        }

        public void DeleteByCategoryID(int id)
        {
            var list = GetListByCategoryID(id);

            foreach (var teaser in list)
            {
                _siteDataContext.PorfolioTeasers.DeleteOnSubmit(teaser);
            }

            _siteDataContext.SubmitChanges();
        }

        public IEnumerable<PorfolioTeaser> GetList()
        {
            return _siteDataContext.PorfolioTeasers.Select(s => s);
        }

        public IEnumerable<PorfolioTeaser> GetListByCategoryID(int id)
        {
            return _siteDataContext.PorfolioTeasers.Select(s => s).Where(s => s.CategoryID == id);
        }
    }
}
