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
    public class EtkinlikController : Controller
    {
        SporOEntities db = new SporOEntities();
        SessionContext context = new SessionContext();    

        // GET: Etkinlik/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Etkinlik etkinlik = db.Etkinlik.Find(id);
            if (etkinlik == null)
            {
                return HttpNotFound();
            }
            return View(etkinlik);
        }

        // GET: Etkinlik/Create
        public ActionResult Create()
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

            ViewBag.TipId = new SelectList(db.EtkinlikTipi, "TipId", "Tip");
            ViewBag.Sid = new SelectList(db.Sporlar, "SporId", "SporAdi");
            ViewBag.MekanID = new SelectList(db.Mekan, "Mid", "MekanAdi");
            return View();
        }

        // POST: Etkinlik/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "EtkinlikId,EtkinlikAdi,TipId,MekanID,EtkinlikTarihi,Kontenjan,isActive,Sid")] Etkinlik etkinlik)
        {
            if (ModelState.IsValid)
            {
                etkinlik.isActive = 1;
                var User = context.GetUserData();
                var kurucu = (from k in db.Kullanici where k.Kid == User.Kid select k).SingleOrDefault();
                etkinlik.Kurucu = kurucu.Kid;
                etkinlik.Kullanici.Add(kurucu);
                db.Etkinlik.Add(etkinlik);
                db.SaveChanges();
                return Redirect(Url.Content("~/"));
            }

            ViewBag.TipId = new SelectList(db.EtkinlikTipi, "TipId", "Tip", etkinlik.TipId);
            ViewBag.Sid = new SelectList(db.Sporlar, "SporId", "SporAdi", etkinlik.Sid);
            ViewBag.MekanID = new SelectList(db.Mekan, "Mid", "MekanAdi", etkinlik.MekanID);
            return View(etkinlik);
        }

        // GET: Etkinlik/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Etkinlik etkinlik = db.Etkinlik.Find(id);
            if (etkinlik == null)
            {
                return HttpNotFound();
            }
            ViewBag.TipId = new SelectList(db.EtkinlikTipi, "TipId", "Tip", etkinlik.TipId);
            ViewBag.Sid = new SelectList(db.Sporlar, "SporId", "SporAdi", etkinlik.Sid);
            ViewBag.MekanID = new SelectList(db.Mekan, "Mid", "MekanAdi", etkinlik.MekanID);
            return View(etkinlik);
        }

        // POST: Etkinlik/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "EtkinlikId,EtkinlikAdi,TipId,MekanID,EtkinlikTarihi,Kontenjan,isActive,Sid")] Etkinlik etkinlik)
        {
            if (ModelState.IsValid)
            {
                db.Entry(etkinlik).State = EntityState.Modified;
                db.SaveChanges();
                return Redirect(Url.Content("~/"));
            }
            ViewBag.TipId = new SelectList(db.EtkinlikTipi, "TipId", "Tip", etkinlik.TipId);
            ViewBag.Sid = new SelectList(db.Sporlar, "SporId", "SporAdi", etkinlik.Sid);
            ViewBag.MekanID = new SelectList(db.Mekan, "Mid", "MekanAdi", etkinlik.MekanID);
            return View(etkinlik);
        }

        // GET: Etkinlik/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Etkinlik etkinlik = db.Etkinlik.Find(id);
            if (etkinlik == null)
            {
                return HttpNotFound();
            }
            return View(etkinlik);
        }

        // POST: Etkinlik/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Etkinlik etkinlik = db.Etkinlik.Find(id);
            db.Etkinlik.Remove(etkinlik);
            db.SaveChanges();
            return Redirect(Url.Content("~/"));
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
