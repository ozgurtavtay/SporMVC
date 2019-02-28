using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using SporOrganizasyon.Models;

namespace SporOrganizasyon.Controllers
{
    [Authorize]
    public class MekanController : Controller
    {
        private SporOEntities db = new SporOEntities();
        SessionContext context = new SessionContext();

        public ActionResult Index()
        {
            ViewBag.isLogin = false;
            ViewBag.User = "";
            int? id = null;
            if (context.GetUserData() != null)
            {
                ViewBag.isLogin = true;
                ViewBag.User = context.GetUserData().Ad;
                id = context.GetUserData().Kid;
            }

            ViewBag.Iller = new SelectList(db.Iller.OrderBy(x => x.Sehir).ToList(), "Id", "Sehir");

            return View();
        }

        public JsonResult GetIlceler(int Sehir)
        {
            db.Configuration.ProxyCreationEnabled = false;
            List<Ilceler> ilceler = db.Ilceler.Where(x => x.Sehir == Sehir).ToList();
            return Json(ilceler, JsonRequestBehavior.AllowGet);
        }

        // POST: Mekans/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Index([Bind(Include = "Mid,MekanAdi,IlceId")] Mekan mekan)
        {
            if (ModelState.IsValid)
            {
                db.Mekan.Add(mekan);
                db.SaveChanges();
                return RedirectToAction("Index","Home");
            }

            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
