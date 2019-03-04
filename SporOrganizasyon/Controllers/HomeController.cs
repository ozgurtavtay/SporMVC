using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using SporOrganizasyon.Models;
using System.Web.Security;

namespace SporOrganizasyon.Controllers
{
    public class HomeController : Controller
    {
        private SporOEntities db = new SporOEntities();
        UserApplication userApp = new UserApplication();
        SessionContext context = new SessionContext();       

        public ActionResult Index()
        {
            ViewBag.isLogin = false;
            ViewBag.User = "";
            if (context.GetUserData() != null)
            {
                ViewBag.isLogin = true;
                ViewBag.User = context.GetUserData().Ad;
            }
            var sporlar = db.Sporlar.ToList();
            var etkinlik = db.EtkinlikAl().ToList();
            return View(Tuple.Create<Kullanici, EtkinlikAl_Result, List<Sporlar>, List<EtkinlikAl_Result>>(new Kullanici(), new EtkinlikAl_Result(), sporlar, etkinlik));
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

        public ActionResult Join(string id)
        {
            var EtkinlikId = Convert.ToInt32(id);
            var User = context.GetUserData();
            var katilan = (from k in db.Kullanici where k.Kid == User.Kid select k).SingleOrDefault();
            var etkinlik = (from e in db.Etkinlik where e.EtkinlikId == EtkinlikId select e).SingleOrDefault();
            if (etkinlik.Kullanici.Contains(katilan))
            {
                TempData["msg"] = "<script>Swal.fire({ type: 'error', text: 'Bu etkinliğe zaten kayıtlısınız!'});</script>";
            }
            else
            {
                TempData["msg"] = "";
                etkinlik.Kullanici.Add(katilan);
                db.SaveChanges();
            }           
            return RedirectToAction("Index");
        }

        public ActionResult Quit(string id)
        {
            var EtkinlikId = Convert.ToInt32(id);
            var User = context.GetUserData();
            var katilan = (from k in db.Kullanici where k.Kid == User.Kid select k).SingleOrDefault();
            var etkinlik = (from e in db.Etkinlik where e.EtkinlikId == EtkinlikId select e).SingleOrDefault();

            if (etkinlik.Kullanici.Contains(katilan))
            {
                TempData["msg"] = "";
                etkinlik.Kullanici.Remove(katilan);
                db.SaveChanges();                             
            }
            else
            {
                TempData["msg"] = "<script>Swal.fire({ type: 'error', text: 'Kayıtlı olmadığınız etkinlikten çıkamazsınız!'});</script>";                
            }
            return RedirectToAction("Index");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Register([Bind(Prefix = "Item1")] Kullanici kullanici, int[] sporlar)
        {
            if (ModelState.IsValid)
            {
                List<Sporlar> Sporlar = new List<Sporlar>();
                foreach (var item in sporlar)
                {
                    var kullanicispor = from spor in db.Sporlar where spor.SporId == item select spor;
                    Sporlar.Add(kullanicispor.Single());
                }
                kullanici.Sporlar = Sporlar;
                db.Kullanici.Add(kullanici);
                db.SaveChanges();


                return RedirectToAction("Index");
            }

            return View(kullanici);
        }
    }
}