using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ArtumDesignLab.BaseObjects;
using ArtumDesignLab.Data;

namespace ArtumDesignLab.Biz
{
    public class CoursesEntity : IBizObject
    {
        private SiteDataContext _siteDataContext;
        private Course _Entity;
        public Course Entity
        {
            get
            {
                if (_Entity == null)
                {
                    _Entity = new Course();
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

        public CoursesEntity()
        {
            _siteDataContext = DatabaseEngine.SiteDataContext;
        }
        public void Create()
        {
            _siteDataContext.Courses.InsertOnSubmit(Entity);
            _siteDataContext.SubmitChanges();
        }
       
        public int Insert()
        {
            _siteDataContext.Courses.InsertOnSubmit(Entity);
            _siteDataContext.SubmitChanges();
            return Entity.CourseID;
        }

        public void Read(int id)
        {
            this.Entity = _siteDataContext.Courses.Where(s => s.CourseID == id).FirstOrDefault();
        }

        public void Update()
        {
            _siteDataContext.SubmitChanges();
        }

        public void Delete()
        {
            _siteDataContext.Courses.DeleteOnSubmit(Entity);
            _siteDataContext.SubmitChanges();
        }

        public IEnumerable<Course> GetList()
        {
            return _siteDataContext.Courses.Select(s => s).OrderByDescending(s => s.CourseID);
        }

        public Course GetById(int id)
        {
            return _siteDataContext.Courses.Where(b => b.CourseID == id).FirstOrDefault();
        }

    }
}
