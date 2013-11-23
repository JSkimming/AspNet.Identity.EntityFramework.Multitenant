//-----------------------------------------------------------------------
// <copyright company="James Skimming">
//     Copyright (c) 2013 James Skimming
// </copyright>
//-----------------------------------------------------------------------

namespace AspNet.Identity.EntityFramework.Multitenant
{
    using System;
    using System.Collections.Generic;
    using System.Data.Entity;
    using System.Linq;
    using Microsoft.AspNet.Identity.EntityFramework;

    /// <summary>
    /// Identity <see cref="DbContext"/> for multi tenant user accounts.
    /// </summary>
    /// <typeparam name="TUser">The type of user.</typeparam>
    public class MultitenantIdentityDbContext<TUser>
        : MultitenantIdentityDbContext<TUser, IdentityRole, string, string, MultitenantIdentityUserLogin, IdentityUserRole, IdentityUserClaim>
        where TUser : MultitenantIdentityUser
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="MultitenantIdentityDbContext{TUser}"/> class.
        /// </summary>
        public MultitenantIdentityDbContext()
            : this("DefaultConnection")
        {
        }

        /// <summary>
        /// Initializes a new instance of the <see cref="MultitenantIdentityDbContext{TUser}"/> class.
        /// </summary>
        /// <param name="nameOrConnectionString">Either the database name or a connection string. </param>
        public MultitenantIdentityDbContext(string nameOrConnectionString)
            : base(nameOrConnectionString)
        {
        }

        /// <summary>
        /// Applies custom model definitions for multi-tenancy.
        /// </summary>
        /// <param name="modelBuilder">The builder that defines the model for the context being created. </param>
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.Entity<TUser>()
                .Property(e => e.TenantId)
                .HasMaxLength(128)
                .IsRequired();
        }
    }
}
