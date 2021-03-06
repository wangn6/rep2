//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Core.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class Provider
    {
        public Provider()
        {
            this.Builds = new HashSet<Build>();
            this.TestCases = new HashSet<TestCase>();
            this.TestEnvironments = new HashSet<TestEnvironment>();
            this.TestSuites = new HashSet<TestSuite>();
            this.SupportedEnvironments = new HashSet<SupportedEnvironment>();
            this.Products = new HashSet<Product>();
            this.Products1 = new HashSet<Product>();
            this.Products2 = new HashSet<Product>();
        }
    
        public int ProviderId { get; set; }
        public string Name { get; set; }
        public int Category { get; set; }
        public string Type { get; set; }
        public string Path { get; set; }
        public string Config { get; set; }
        public string Description { get; set; }
        public bool IsActive { get; set; }
    
        public virtual ICollection<Build> Builds { get; set; }
        public virtual ICollection<TestCase> TestCases { get; set; }
        public virtual ICollection<TestEnvironment> TestEnvironments { get; set; }
        public virtual ICollection<TestSuite> TestSuites { get; set; }
        public virtual ICollection<SupportedEnvironment> SupportedEnvironments { get; set; }
        public virtual ICollection<Product> Products { get; set; }
        public virtual ICollection<Product> Products1 { get; set; }
        public virtual ICollection<Product> Products2 { get; set; }
    }
}
