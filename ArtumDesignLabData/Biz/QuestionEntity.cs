using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ArtumDesignLab.Data;
using ArtumDesignLab;

namespace ArtumDesignLab.Biz
{
    public class QuestionEntity
    {
        private SiteDataContext _siteDataContext;
        private Question _entity;
        public Question Entity
        {
            get
            {
                if (_entity == null)
                {
                    _entity = new Question();
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
        public QuestionEntity()
        {
            _siteDataContext = DatabaseEngine.SiteDataContext;
        }
        public void Create()
        {
            _siteDataContext.Questions.InsertOnSubmit(Entity);
            _siteDataContext.SubmitChanges();
        }

        public void Read(int id)
        {
            this.Entity = _siteDataContext.Questions.Where(s => s.QuestionID == id).FirstOrDefault();
        }

        public void Update()
        {
            _siteDataContext.SubmitChanges();
        }

        public void Delete(int id)
        {
            this.Read(id);
            _siteDataContext.Questions.DeleteOnSubmit(Entity);
            _siteDataContext.SubmitChanges();
        }

        public IEnumerable<Question> GetList()
        {
            return _siteDataContext.Questions.Select(s => s);
        }

        public Question GetQuestionByID(int id)
        {
            return _siteDataContext.Questions.Select(s => s).Where(s => s.QuestionID == id).FirstOrDefault();
        }

        public IEnumerable<Question> GetListForSite()
        {
            return _siteDataContext.Questions.Select(s => s).Where(s => s.Visible);
        }
    }
}
