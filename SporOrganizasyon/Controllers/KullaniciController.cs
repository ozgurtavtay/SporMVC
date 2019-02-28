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
    public class KullaniciController : Controller
    {
        private SporOEntities db = new SporOEntities();
        SessionContext context = new SessionContext();

        // GET: Kullanicis/Details/5
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
            
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Kullanici kullanici = db.Kullanici.Find(id);
            if (kullanici == null)
            {
                return HttpNotFound();
            }
            return View(kullanici);
        }

        // GET: Kullanicis/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Kullanici kullanici = db.Kullanici.Find(id);
            kullanici.Sifre = null;
            if (kullanici == null)
            {
                return HttpNotFound();
            }
            return View(kullanici);
        }

        // POST: Kullanicis/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Kid,Ad,Soyad,Email,Telefon,Sifre,Ilce,DogumTarihi,Cinsiyet")] Kullanici kullanici)
        {
            if (ModelState.IsValid)
            {
                db.Entry(kullanici).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(kullanici);
        }

        public ActionResult Etkinlikler()
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
            var etkinlik = db.Etkinlik.Include(e => e.EtkinlikTipi).Include(e => e.Sporlar).Include(e => e.Mekan).Where(e => e.Kurucu == id);
            return View(etkinlik.ToList());
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
