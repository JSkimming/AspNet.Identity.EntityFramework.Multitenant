using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using Microsoft.AspNet.Identity;

namespace IntegerPkImplementation
{
    public static class IdentityExtensions
    {
        public static int GetUserIdInt(this IIdentity identity)
        {
            if (identity == null)
                throw new ArgumentNullException("identity");

            string stringUserId = identity.GetUserId();

            int userId;
            if (string.IsNullOrWhiteSpace(stringUserId) || !int.TryParse(stringUserId, out userId))
            {
                return default(int);
            }

            return userId;
        }
    }
}
