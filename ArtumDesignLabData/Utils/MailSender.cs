using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;

namespace ArtumDesignLab.Utils
{
    public class MailSender
    {
        protected string _subject;
        protected string _displayName;
        protected System.Net.Mail.MailMessage _mailMessage;
        protected MailAddress _mailAddresses;

        public MailSender()
        {
            Initialize();
        }

        private void Initialize()
        {
            _displayName = string.Empty;
            _mailMessage = new MailMessage();
            _mailMessage.IsBodyHtml = true;
            _mailMessage.Priority = MailPriority.High;
            _displayName = "Электронный контракт";
        }

        public bool SendMail()
        {


            bool retVal = false;

            if (_mailMessage == null)
                throw new ArgumentNullException("MailMessage is null");

            string strSMTP = MailConfig.GetSMTP();
            string strUserLogin = MailConfig.GetUserLogin();
            string strPassword = MailConfig.GetUserPassword();
            SmtpClient client = new SmtpClient(strSMTP);
            NetworkCredential cred = new NetworkCredential(strUserLogin, strPassword);
            client.Credentials = cred;
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            _mailMessage.Bcc.Add(new MailAddress("datasoft.by@gmail.com"));
            client.Send(_mailMessage);

            retVal = true;
            return retVal;

        }

        public MailAddress Recipients
        {
            get { return _mailAddresses; }
            set { _mailAddresses = value; }
        }

        public System.Net.Mail.MailMessage Message
        {
            get { return _mailMessage; }
            set { _mailMessage = value; }
        }
        #region IDisposable Members

        private bool disposed = false;

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        private void Dispose(bool disposing)
        {
            // Check to see if Dispose has already been called.
            if (!this.disposed)
            {
                // If disposing equals true, dispose all managed 
                // and unmanaged resources.
                if (disposing)
                {
                    // Dispose managed resources HERE.
                }
                if (_mailMessage != null)
                    _mailMessage.Dispose();
            }
            disposed = true;
        }

        ~MailSender()
        {
            Dispose(false);
        }
        #endregion
    }
}
