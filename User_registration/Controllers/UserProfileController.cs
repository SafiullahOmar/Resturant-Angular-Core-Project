using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using User_registration.Model;

namespace User_registration.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserProfileController : ControllerBase
    {

        private UserManager<ApplicationUser> _userManager;
        public UserProfileController(UserManager<ApplicationUser> userManager)
        {

            _userManager = userManager;
        }

        [HttpGet]
        [Route("UserProfile")]
        [Authorize]

        public async Task<object> getUserProfile() {
            var userId = User.Claims.First(c => c.Type == "UserID").Value;
            var usr=await _userManager.FindByIdAsync(userId);

            return new { usr.FullName, usr.Email, usr.UserName };
        }
    }
}
