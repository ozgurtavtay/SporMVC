using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Web;

namespace SporOrganizasyon.Models
{
    public class ErrorLog
    {
        SporOEntities et = new SporOEntities();
        public void Hata(Exception ex)
        {
            StackTrace stack = new StackTrace(true);
            foreach (StackFrame frame in stack.GetFrames())
            {
                if (!string.IsNullOrEmpty(frame.GetFileName()))
                {
                    HataLoglari htl = new HataLoglari();
                    htl.DosyaAdi = Path.GetFileName(frame.GetFileName());
                    htl.MethodAdi = frame.GetMethod().ToString();
                    htl.LineNumber = frame.GetFileLineNumber();
                    htl.ColumnNumber = frame.GetFileColumnNumber();
                    htl.Message = ex.Message.ToString();

                    et.HataLoglari.Add(htl);
                    et.SaveChanges();
                }
            }
        }

        public void HataVar(string mesaj)
        {
            StackTrace stack = new StackTrace(true);
            foreach (StackFrame frame in stack.GetFrames())
            {
                if (!string.IsNullOrEmpty(frame.GetFileName()))
                {
                    HataLoglari htl = new HataLoglari();
                    htl.DosyaAdi = Path.GetFileName(frame.GetFileName());
                    htl.MethodAdi = frame.GetMethod().ToString();
                    htl.LineNumber = frame.GetFileLineNumber();
                    htl.ColumnNumber = frame.GetFileColumnNumber();
                    htl.Message = mesaj;

                    et.HataLoglari.Add(htl);
                    et.SaveChanges();
                }
            }
        }

    }
}