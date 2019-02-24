using SporOrganizasyon.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace SporOrganizasyon.Controllers
{
    public class AccountController : Controller
    {
        UserApplication userApp = new UserApplication();
        SessionContext context = new SessionContext();

        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(Kullanici user)
        {
            var authenticatedUser = userApp.GetByUsernameAndPassword(user);
            if (authenticatedUser != null)
            {
                context.SetAuthenticationToken(authenticatedUser.Kid.ToString(), false, authenticatedUser);
                return RedirectToAction("Index", "Home");
            }

            return View();
        }

        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Index", "Home");
        }
    }
}