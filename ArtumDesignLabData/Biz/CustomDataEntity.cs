using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ArtumDesignLab.BaseObjects;
using ArtumDesignLab.Data;
using ArtumDesignLab.Utils;

namespace ArtumDesignLab.Biz
{
    public class CustomDataEntity : IBizObject
    {
        private SiteDataContext _siteDataContext;
        private CustomData _Entity;
        public CustomData Entity
        {
            get
            {
                if (_Entity == null)
                {
                    _Entity = new CustomData();
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
        public CustomDataEntity()
        {
            _siteDataContext = DatabaseEngine.SiteDataContext;
        }
        public void Create()
        {
            _siteDataContext.CustomDatas.InsertOnSubmit(Entity);
            _siteDataContext.SubmitChanges();
        }

        public void Read(int id)
        {
            this.Entity = _siteDataContext.CustomDatas.Where(s => s.CustomDataID == id).FirstOrDefault();
        }

        public void Update()
        {
            _siteDataContext.SubmitChanges();
        }

        public void Delete()
        {
            _siteDataContext.CustomDatas.DeleteOnSubmit(Entity);
            _siteDataContext.SubmitChanges();
        }

        public IEnumerable<CustomData> GetList()
        {
            return _siteDataContext.CustomDatas.Select(s => s);
        }

        /// <summary>
        /// Return custom data value by its name
        /// </summary>
        /// <param name="name">Parameter name</param>
        /// <returns>The value is associated with name</returns>
        public string GetValueByName(string name)
        {
            var value = _siteDataContext.CustomDatas.Select(s => s).
                                                Where(s => s.Name == name).FirstOrDefault();

            return value != null ? value.Value : null;
        }
    }
}
