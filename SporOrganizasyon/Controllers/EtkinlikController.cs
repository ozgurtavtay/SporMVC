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
    public class EtkinlikController : Controller
    {
        private SporOEntities db = new SporOEntities();

        // GET: Etkinlik
        public ActionResult Index()
        {
            var etkinlik = db.Etkinlik.Include(e => e.EtkinlikTipi);
            return View(etkinlik.ToList());
        }

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
            ViewBag.TipId = new SelectList(db.EtkinlikTipi, "TipId", "Tip");
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
                db.Etkinlik.Add(etkinlik);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.TipId = new SelectList(db.EtkinlikTipi, "TipId", "Tip", etkinlik.TipId);
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
                return RedirectToAction("Index");
            }
            ViewBag.TipId = new SelectList(db.EtkinlikTipi, "TipId", "Tip", etkinlik.TipId);
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
