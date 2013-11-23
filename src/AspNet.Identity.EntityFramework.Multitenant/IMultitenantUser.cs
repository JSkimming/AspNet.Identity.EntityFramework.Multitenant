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

    /// <summary>
    /// Minimal interface for a <see cref="IMultitenantUser{TKey, TTenant}"/> with a <see cref="string"/> user
    /// <see cref="IUser{TKey}.Id"/> and <see cref="IMultitenantUser{TKey,TTenant}.TenantId"/>.
    /// </summary>
    public interface IMultitenantUser : IMultitenantUser<string, string>
    {
    }
}
