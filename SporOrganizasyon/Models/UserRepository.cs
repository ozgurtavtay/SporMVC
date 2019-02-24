using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SporOrganizasyon.Models
{
    public class UserRepository
    {
        SporOEntities context = new SporOEntities();
        public Kullanici GetByUsernameAndPassword(Kullanici user)
        {
            context.Configuration.ProxyCreationEnabled = false;
            return context.Kullanici.Where(u => u.Email == user.Email & u.Sifre == user.Sifre).FirstOrDefault();
        }
    }
}