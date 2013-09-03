using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ArtumDesignLab.Biz;
using ArtumDesignLab.Utils;
using System.IO;

namespace ArtumDesignLab.Admin
{
    public partial class Personnel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
        private void ClearInput()
        {
            txtPlace.Text = "";
            txtName.Text = "";
            txtPhone.Text = "";
            txtEmail.Text = "";
            txtImage.Text = "";
            txtExperience.Text = "";
            txtStyles.Text = "";
            lblUpdatePersonnelId.Text = "";
        }

        protected void PersonnelGridView_RowCommand(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName.ToString() == "Delete")
            {
                int personnelId;
                if (int.TryParse(e.CommandArgs.CommandArgument.ToString(), out personnelId))
                {
                    PersonnelEntity personnelEntity = new PersonnelEntity();
                    personnelEntity.Read(personnelId);
                    try
                    {
                        File.Delete(MapPath(Settings.PersonalImages) + personnelEntity.Entity.ThumbImage);
                    }
                    catch { }
                    personnelEntity.DeleteByID(personnelId);
                    PersonnelGridView.DataBind();
                }
            }

            if (e.CommandArgs.CommandName.ToString() == "Change")
            {
                int personnelId;
                if (int.TryParse(e.CommandArgs.CommandArgument.ToString(), out personnelId))
                {   
                    PersonnelEntity personnelEntity = new PersonnelEntity();
                    personnelEntity.Read(personnelId);
                    lblUpdatePersonnelId.Text = personnelId.ToString();
                    popUpAddPersonnel.HeaderText = "Изменить сотрудника";
                    txtPlace.Text = personnelEntity.Entity.Place != null ? personnelEntity.Entity.Place.ToString() : "";
                    txtName.Text = personnelEntity.Entity.Name;
                    txtPhone.Text = personnelEntity.Entity.Phone;
                    txtEmail.Text = personnelEntity.Entity.Email;
                    txtImage.Text = personnelEntity.Entity.ThumbImage;
                    txtExperience.Text = personnelEntity.Entity.Experience;
                    txtStyles.Text = personnelEntity.Entity.Styles;
                    ddlCategories.SelectedValue = personnelEntity.Entity.PersonnelCategoryID.ToString();
                    popUpAddPersonnel.ShowOnPageLoad = true;
                }
            }
        }

        protected void ButtonGenerate_Click(object sender, EventArgs e)
        {
            PersonnelEntity entity = new PersonnelEntity();
            foreach (var person in entity.GetList())
            {
                person.Url = SiteHelper.ConvertNameToUrl(person.Name);
            }
            entity.Update();
            PersonnelGridView.DataBind();
        }

        protected void btnAddNew_Click(object sender, EventArgs e)
        {
            ClearInput();
            popUpAddPersonnel.ShowOnPageLoad = true;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            int personnelId;
            PersonnelEntity personnelEntity = new PersonnelEntity();
            if (int.TryParse(lblUpdatePersonnelId.Text, out personnelId))
            {
                personnelEntity.Read(personnelId);
            }
            int place = 0;
            if (Int32.TryParse(txtPlace.Text.Trim(), out place))
                personnelEntity.Entity.Place = place;
            int categoryId = 0;
            if (Int32.TryParse(ddlCategories.SelectedValue, out categoryId))
                personnelEntity.Entity.PersonnelCategoryID = categoryId;
            personnelEntity.Entity.Name = txtName.Text.Trim();
            personnelEntity.Entity.Phone = txtPhone.Text;
            personnelEntity.Entity.Email = txtEmail.Text;
            personnelEntity.Entity.ThumbImage = txtImage.Text;
            personnelEntity.Entity.Experience = txtExperience.Text;
            personnelEntity.Entity.Styles = txtStyles.Text;
            if (personnelId == 0)
                personnelId = personnelEntity.Insert();
            else
                personnelEntity.Update();
            popUpAddPersonnel.ShowOnPageLoad = false;
            ClearInput();
            PersonnelGridView.DataBind();
        }
    }
}