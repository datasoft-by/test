using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxGridView;
using System.Data;
using System.Collections;
using ArtumDesignLab.Biz;

namespace ArtumDesignLab.Admin
{
    public partial class Questions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PersonnelEntity personnelEntity = new PersonnelEntity();
                var personnels = personnelEntity.GetByPersonnelCategoryID(5).ToArray();
                ddlDesigners.DataSource = personnels;
                ddlDesigners.DataTextField = "Name";
                ddlDesigners.DataValueField = "PersonnelID";
                ddlDesigners.DataBind();
                ddlDesigners.Items.Insert(0, new ListItem("---Выбрать дизайнера---", ""));
            }
        }
        protected void QuestionsGridView_RowCommand(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName.ToString() == "Delete")
            {
                int questionId;
                if (int.TryParse(e.CommandArgs.CommandArgument.ToString(), out questionId))
                {
                    QuestionEntity questionEntity = new QuestionEntity();
                    questionEntity.Read(questionId);
                    questionEntity.Delete(questionId);
                   
                }
            }

            if (e.CommandArgs.CommandName.ToString() == "Change")
            {
                int questionId;
                if (int.TryParse(e.CommandArgs.CommandArgument.ToString(), out questionId))
                {
                    QuestionEntity questionEntity = new QuestionEntity();
                    questionEntity.Read(questionId);
                    popUpQuestion.ShowOnPageLoad = true;
                    lblUpdateId.Text = questionId.ToString();
                    txtName.Text = questionEntity.Entity.Name;
                    if (questionEntity.Entity.DesignerID != null)
                        ddlDesigners.SelectedValue = questionEntity.Entity.DesignerID.ToString();
                    else
                        ddlDesigners.SelectedIndex = 0;
                    txtPhone.Text = questionEntity.Entity.Phone;
                    txtEmail.Text = questionEntity.Entity.Email;
                    htmlEditorQuestion.Html = questionEntity.Entity.QuestionText;
                    htmlEditorAnswer.Html = questionEntity.Entity.AnswerText;
                    chkVisible.Checked = questionEntity.Entity.Visible;
                }
            }

        }   
        protected void btnSave_Click(object sender, EventArgs e)
        {
            int questionId;
            if (Int32.TryParse(lblUpdateId.Text, out questionId))
            {
                QuestionEntity questionEntity = new QuestionEntity();
                questionEntity.Read(questionId);
                questionEntity.Entity.AnswerText = htmlEditorAnswer.Html;
                int designerId = 0;
                if (Int32.TryParse(ddlDesigners.SelectedValue, out designerId))
                    questionEntity.Entity.DesignerID = designerId;
                questionEntity.Entity.Email = txtEmail.Text.Trim();
                questionEntity.Entity.Name = txtName.Text.Trim();
                questionEntity.Entity.Phone = txtPhone.Text.Trim();
                questionEntity.Entity.QuestionText = htmlEditorQuestion.Html;
                questionEntity.Entity.Visible = chkVisible.Checked;
                questionEntity.Update();

                popUpQuestion.ShowOnPageLoad = false;
                QuestionsGridView.DataBind();
            }
        }
    }
}