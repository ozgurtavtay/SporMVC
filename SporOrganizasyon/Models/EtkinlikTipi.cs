
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
    
public partial class EtkinlikTipi
{

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public EtkinlikTipi()
    {

        this.Etkinlik = new HashSet<Etkinlik>();

    }


    public int TipId { get; set; }

    public string Tip { get; set; }

    public string Aciklama { get; set; }



    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]

    public virtual ICollection<Etkinlik> Etkinlik { get; set; }

}

}
