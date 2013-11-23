//-----------------------------------------------------------------------
// <copyright company="James Skimming">
//     Copyright (c) 2013 James Skimming
// </copyright>
//-----------------------------------------------------------------------

namespace AspNet.Identity.EntityFramework.Multitenant
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using Microsoft.AspNet.Identity.EntityFramework;

    /// <summary>
    /// Class defining a multi-tenant user login.
    /// </summary>
    /// <typeparam name="TKey">The type of <see cref="IdentityUserLogin{TKey}.UserId"/> for a user.</typeparam>
    /// <typeparam name="TTenantKey">The type of <see cref="TenantId"/> for a user.</typeparam>
    public class MultitenantIdentityUserLogin<TKey, TTenantKey> : IdentityUserLogin<TKey>
    {
        /// <summary>
        /// Gets or sets the unique identifier of the tenant.
        /// </summary>
        public virtual TTenantKey TenantId { get; set; }
    }
}
