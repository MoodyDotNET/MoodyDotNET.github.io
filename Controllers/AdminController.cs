using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using moody.Models;
using Newtonsoft.Json;

namespace moody.Controllers
{
    [Route("api/[controller]")]
    public class AdminController : Controller
    {
        [HttpGet("[action]")]
        public bool login(MoodyContext db, string username, string password) {
            bool res = false;
            Administrator authen = db.Administrator
                .Where(q => q.Username == username)
                .Where(q => q.Password == password)
                .FirstOrDefault();
            if (authen != null)
            {
                HttpContext.Session.SetString("AUTHEN", JsonConvert.SerializeObject(authen));
                res = true;
            }
            return res;
        }

        [HttpGet("[action]")]
        public Administrator current(MoodyContext db) {
            String value = HttpContext.Session.GetString("AUTHEN");
            return JsonConvert.DeserializeObject<Administrator>(value);
        }

        [HttpGet("[action]")]
        public bool logout(MoodyContext db) {
            HttpContext.Session.Clear();
            return true;
        }
    }
}