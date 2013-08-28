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
    public class ProjectEntity
    {
        private SiteDataContext _siteContext;
        
        private Project _Entity;
        public Project Entity
        {
            get
            {
                if (_Entity == null)
                {
                    _Entity = new Project();
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
        public ProjectEntity()
        {
            _siteContext = DatabaseEngine.SiteDataContext;
        }
        public void Create()
        {
            _siteContext.Projects.InsertOnSubmit(Entity);
            _siteContext.SubmitChanges();
        }

        public int Insert()
        {
            _siteContext.Projects.InsertOnSubmit(Entity);
            _siteContext.SubmitChanges();
            return Entity.ProjectID;
        }
        
        public void Read(int id)
        {
            this.Entity = _siteContext.Projects.Where(s => s.ProjectID == id).FirstOrDefault();
        }

        public void Update()
        {
            _siteContext.SubmitChanges();
        }

        public void Delete(int id)
        {
            this.Read(id);
            _siteContext.Projects.DeleteOnSubmit(Entity);
            _siteContext.SubmitChanges();
        }
        public void DeleteAll()
        {
            _siteContext.ProjectPhotos.DeleteAllOnSubmit(_siteContext.ProjectPhotos.Select(s => s).Where(s => s.ProjectID == Entity.ProjectID));
            _siteContext.Projects.DeleteOnSubmit(Entity);
            _siteContext.SubmitChanges();
        }
        public void DeleteByID(int id)
        {
            Read(id);

            // TODO: delete all projects photos
            if (File.Exists(HttpContext.Current.Request.MapPath(Settings.PortfolioImagesThumbsSmall + Entity.ProjectThumb)))
                File.Delete(HttpContext.Current.Request.MapPath(Settings.PortfolioImagesThumbsSmall + Entity.ProjectThumb));
            if (File.Exists(HttpContext.Current.Request.MapPath(Settings.PortfolioImagesThumbsMedium + Entity.ProjectThumb)))
                File.Delete(HttpContext.Current.Request.MapPath(Settings.PortfolioImagesThumbsMedium + Entity.ProjectThumb));

            _siteContext.Projects.DeleteOnSubmit(Entity);
            _siteContext.SubmitChanges();
        }
        public IEnumerable<Project> GetList()
        {
            return _siteContext.Projects.Select(s => s);
        }
        public IEnumerable<ProjectPhoto> GetPhotos(int iProjectId)
        {
            return _siteContext.ProjectPhotos.Select(s => s).Where(s => s.ProjectID == iProjectId);
        }
        public IEnumerable<ProjectPhoto> GetPhotosForIndividualProject()
        {
            return _siteContext.ProjectPhotos.Select(s => s).Where(s => s.Project.ProjectCategoryID == 2).OrderByDescending(s => s.ProjectPhotoID);
        }
        public IEnumerable<ProjectPhoto> GetPhotosForElitMebel()
        {
            return _siteContext.ProjectPhotos.Select(s => s).Where(s => s.Project.ProjectCategoryID == 4).OrderBy(s => s.ProjectPhotoID);
        }
        public Project GetCustomProject()
        {
            return
                _siteContext.Projects.Where(s => s.ProjectID != 4 && s.ProjectCategoryID == 1).OrderBy(s => _siteContext.GetNewId()).FirstOrDefault();
        }
        public object GetListForAdmin(int iCategoryId)
        {
            var _projects = from projects in _siteContext.Projects
                            where projects.ProjectCategoryID == iCategoryId
                            select new
                                       {
                                           ProjectID = projects.ProjectID,
                                           CategoryID = projects.ProjectCategoryID,
                                           ProjectName = projects.ProjectName,
                                           ProjectThumb = projects.ProjectPhotos.Count() > 0 ? projects.ProjectPhotos.First().ProjectPhotoPath : "",
                                           PhotosCount = projects.ProjectPhotos.Count(),
                                           ProjectTitle = projects.ProjectTitle,
                                           ProjectKeyWords = projects.ProjectKeyWords,
                                           ProjectText = projects.ProjectText,
                                           ProjectDate = projects.CreateDate,
                                           Url = projects.Url,
                                           Place = projects.Place,
                                           DesignerID = projects.DesignerID,
                                           DesignerName = projects.Personnel.Name
                                      };
            return _projects.OrderByDescending(s=>s.ProjectDate);
        }
        public object GetListForAdmin()
        {
            var _projects = from projects in _siteContext.Projects
                            select new
                            {
                                ProjectID = projects.ProjectID,
                                CategoryID = projects.ProjectCategoryID,
                                ProjectName = projects.ProjectName,
                                ProjectThumb = projects.ProjectPhotos.Count() > 0 ? projects.ProjectPhotos.First().ProjectPhotoPath : "",
                                PhotosCount = projects.ProjectPhotos.Count(),
                                ProjectTitle = projects.ProjectTitle,
                                ProjectKeyWords = projects.ProjectKeyWords,
                                ProjectText = projects.ProjectText,
                                ProjectDate = projects.CreateDate,
                                Url = projects.Url,
                                Place = projects.Place,
                                DesignerID = projects.DesignerID,
                                DesignerName = projects.Personnel.Name
                           };
            return _projects.OrderByDescending(s => s.ProjectDate);
        }

        public IEnumerable<Project> GetGalleryList()
        {
            return _siteContext.Projects.Where(s => s.ProjectCategoryID == 1 || s.ProjectCategoryID == 2).Select(s => s).OrderBy(s => _siteContext.GetNewId());      
        }

        public object GetByCategoryID(int iCategoryId)
        {
            var _projects = from projects in _siteContext.Projects
                            where projects.ProjectCategoryID == iCategoryId
                            select new
                            {
                                ProjectID = projects.ProjectID,
                                CategoryID = projects.ProjectCategoryID,
                                ProjectName = projects.ProjectName,
                                ProjectThumb = projects.ProjectPhotos.Count() > 0 ? projects.ProjectPhotos.First().ProjectPhotoPath : "",
                                PhotosCount = projects.ProjectPhotos.Count(),
                                ProjectTitle = projects.ProjectTitle,
                                ProjectKeyWords = projects.ProjectKeyWords,
                                ProjectText = projects.ProjectText,
                                ProjectDate = projects.CreateDate,
                                ProjectCategory = projects.ProjectCategory,
                                Url = projects.Url,
                                Place = projects.Place,
                                DesignerID = projects.DesignerID,
                                DesignerName = projects.Personnel.Name
                            };
            return _projects.OrderBy(s => s.Place ?? Int32.MaxValue);
        }

        public object GetByDesignerID(int iDesignerId)
        {
            var _projects = from projects in _siteContext.Projects
                            where projects.DesignerID == iDesignerId
                            select new
                            {
                                ProjectID = projects.ProjectID,
                                CategoryID = projects.ProjectCategoryID,
                                ProjectName = projects.ProjectName,
                                ProjectThumb = projects.ProjectPhotos.Count() > 0 ? projects.ProjectPhotos.First().ProjectPhotoPath : "",
                                PhotosCount = projects.ProjectPhotos.Count(),
                                ProjectTitle = projects.ProjectTitle,
                                ProjectKeyWords = projects.ProjectKeyWords,
                                ProjectText = projects.ProjectText,
                                ProjectDate = projects.CreateDate,
                                ProjectCategory = projects.ProjectCategory,
                                Url = projects.Url,
                                Place = projects.Place,
                                DesignerID = projects.DesignerID,
                                DesignerName = projects.Personnel.Name
                            };
            return _projects.OrderBy(s => s.Place ?? Int32.MaxValue);
        }

        public IEnumerable<Project> GetListByCategoryID(int id)
        {
            return _siteContext.Projects.Select(s => s).Where(s => s.ProjectCategoryID == id).OrderByDescending(s => s.CreateDate);
        }

        public Project GetById(int id)
        {
            return _siteContext.Projects.Where(b => b.ProjectID == id).FirstOrDefault();
        }

        public Project GetByUrl(string url)
        {
            return _siteContext.Projects.Where(b => b.Url == url).FirstOrDefault();
        }
    }
}
