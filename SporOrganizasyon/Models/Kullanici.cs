
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
    
public partial class Kullanici
{

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public Kullanici()
    {

        this.Etkinlik = new HashSet<Etkinlik>();

        this.Sporlar = new HashSet<Sporlar>();

    }


    public int Kid { get; set; }

    public string Ad { get; set; }

    public string Soyad { get; set; }

    public string Email { get; set; }

    public string Telefon { get; set; }

    public string Sifre { get; set; }

    public string Ilce { get; set; }

    public Nullable<System.DateTime> DogumTarihi { get; set; }

    public Nullable<int> Cinsiyet { get; set; }

    public int isLogin { get; set; }



    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]

    public virtual ICollection<Etkinlik> Etkinlik { get; set; }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]

    public virtual ICollection<Sporlar> Sporlar { get; set; }

}

}
