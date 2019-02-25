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
    public class MekansController : Controller
    {
        private SporOEntities db = new SporOEntities();

        // GET: Mekans
        public ActionResult Index()
        {
            var mekan = db.Mekan.Include(m => m.Ilceler);
            return View(mekan.ToList());
        }

        // GET: Mekans/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Mekan mekan = db.Mekan.Find(id);
            if (mekan == null)
            {
                return HttpNotFound();
            }
            return View(mekan);
        }

        // GET: Mekans/Create
        public ActionResult Create()
        {
            ViewBag.IlceId = new SelectList(db.Ilceler, "Id", "Ad");
            ViewBag.Iller = new SelectList(db.Iller, "Id", "Sehir");
            return View();
        }

        // POST: Mekans/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Mid,MekanAdi,IlceId")] Mekan mekan)
        {
            if (ModelState.IsValid)
            {
                db.Mekan.Add(mekan);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.IlceId = new SelectList(db.Ilceler, "Id", "Ad", mekan.IlceId);
            return View(mekan);
        }

        // GET: Mekans/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Mekan mekan = db.Mekan.Find(id);
            if (mekan == null)
            {
                return HttpNotFound();
            }
            ViewBag.IlceId = new SelectList(db.Ilceler, "Id", "Ad", mekan.IlceId);
            return View(mekan);
        }

        // POST: Mekans/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Mid,MekanAdi,IlceId")] Mekan mekan)
        {
            if (ModelState.IsValid)
            {
                db.Entry(mekan).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IlceId = new SelectList(db.Ilceler, "Id", "Ad", mekan.IlceId);
            return View(mekan);
        }

        // GET: Mekans/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Mekan mekan = db.Mekan.Find(id);
            if (mekan == null)
            {
                return HttpNotFound();
            }
            return View(mekan);
        }

        // POST: Mekans/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Mekan mekan = db.Mekan.Find(id);
            db.Mekan.Remove(mekan);
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
