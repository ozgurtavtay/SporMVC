
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------


namespace SporOrganizasyon.Models
{

using System;
    using System.Collections.Generic;
    
public partial class Sporlar
{

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public Sporlar()
    {

        this.Kullanici = new HashSet<Kullanici>();

        this.Etkinlik = new HashSet<Etkinlik>();

    }


    public int SporId { get; set; }

    public string SporAdi { get; set; }

    public Nullable<int> SporcuSayisi { get; set; }



    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]

    public virtual ICollection<Kullanici> Kullanici { get; set; }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]

    public virtual ICollection<Etkinlik> Etkinlik { get; set; }

}

}
