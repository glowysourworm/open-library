﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace OpenLibrary.Data.ZeeRex
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class OpenLibraryZeeRexEntities : DbContext
    {
        public OpenLibraryZeeRexEntities()
            : base("name=OpenLibraryZeeRexEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<attr> attrs { get; set; }
        public virtual DbSet<authentication> authentications { get; set; }
        public virtual DbSet<@default> defaults { get; set; }
        public virtual DbSet<elementSet> elementSets { get; set; }
        public virtual DbSet<indexInfo> indexInfoes { get; set; }
        public virtual DbSet<metaInfo> metaInfoes { get; set; }
        public virtual DbSet<schema> schemata { get; set; }
        public virtual DbSet<serverInfo> serverInfoes { get; set; }
        public virtual DbSet<set> sets { get; set; }
        public virtual DbSet<setting> settings { get; set; }
        public virtual DbSet<subject> subjects { get; set; }
        public virtual DbSet<support> supports { get; set; }
    }
}
