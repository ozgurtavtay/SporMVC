using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using SporOrganizasyon.Models;
namespace SporOrganizasyon.Controllers
{
    public class DenemeController : Controller
    {

        public RedirectResult Index2()
        {
            return Redirect("/Home/Index");
        }

        public ActionResult Index3()
        {
            return RedirectToAction("Index2");
        }

        [HttpPost]
        public ActionResult Json(Kullanici model)
        {
            var x = model.Email;
            if (model != null)
            {
                return Json(new { status = "success", message = "Your message successfuly sent!", name = x
                }, JsonRequestBehavior.AllowGet);
                
            }
            else
            {
                return Json(new { success = false, message = "Olmadı Bidaha" }, JsonRequestBehavior.AllowGet);
            }

        }

        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Deneme/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Deneme/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Deneme/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Deneme/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
