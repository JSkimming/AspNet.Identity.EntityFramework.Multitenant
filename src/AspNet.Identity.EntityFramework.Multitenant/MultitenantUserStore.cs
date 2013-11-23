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
    /// The store for a multi tenant user.
    /// </summary>
    /// <typeparam name="TUser">The type of user.</typeparam>
    public class MultitenantUserStore<TUser>
        : MultitenantUserStore<TUser, IdentityRole, string, string, MultitenantIdentityUserLogin, IdentityUserRole, IdentityUserClaim>
        where TUser : MultitenantIdentityUser
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="MultitenantUserStore{TUser}"/> class.
        /// </summary>
        /// <param name="context">The <see cref="DbContext"/>.</param>
        public MultitenantUserStore(DbContext context)
            : base(context)
        {
        }
    }
}
