using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SporOrganizasyon.Models
{
    public class UserApplication
    {
        UserRepository userRepo = new UserRepository();
        public Kullanici GetByUsernameAndPassword(Kullanici user)
        {
            return userRepo.GetByUsernameAndPassword(user);
        }
    }
}