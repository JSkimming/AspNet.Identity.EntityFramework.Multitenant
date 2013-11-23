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
    using Microsoft.AspNet.Identity;
    using Microsoft.AspNet.Identity.EntityFramework;

    /// <summary>
    /// Minimal class for a <see cref="MultitenantIdentityUser{TKey, TTenantKey, TLogin, TRole, TClaim}"/> with a
    /// <see cref="string"/> user <see cref="IUser{TKey}.Id"/> and
    /// <see cref="MultitenantIdentityUserLogin{TKey, TTenant}.TenantId"/>.
    /// </summary>
    public class MultitenantIdentityUser :
        MultitenantIdentityUser<string, string, MultitenantIdentityUserLogin, IdentityUserRole, IdentityUserClaim>
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="MultitenantIdentityUser"/> class.
        /// </summary>
        public MultitenantIdentityUser()
        {
            Id = Guid.NewGuid().ToString();
        }

        /// <summary>
        /// Initializes a new instance of the <see cref="MultitenantIdentityUser"/> class.
        /// </summary>
        /// <param name="userName">The <see cref="IdentityUser{TKey, TLogin, TRole, TClaim}.UserName"/> of the user.</param>
        public MultitenantIdentityUser(string userName)
            : this()
        {
            if (string.IsNullOrWhiteSpace(userName))
                throw new ArgumentNullException("userName");

            UserName = userName;
        }
    }
}
