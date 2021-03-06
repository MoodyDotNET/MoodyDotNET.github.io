using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using moody.Extensions;
using moody.Models;

namespace moody.Controllers
{
    [Route("api/[controller]")]
    public class AlbumController : Controller
    {
        [HttpGet("[action]")]
        public IEnumerable<Album> all(MoodyContext db)
        {
            return db.Album;
        }

        [HttpGet("[action]")]
        public Album get(MoodyContext db, int id)
        {
            return db.Album.Where(a => a.AlbumId == id).FirstOrDefault();
        }

        [HttpPost("[action]")]
        [AdminFilter]
        public bool insert(MoodyContext db, [FromBody]Album album)
        {

            Administrator admin = HttpContext.Session.Get<Administrator>("ADMIN");
            db.Album.Add(new Album
            {
                AlbumName = album.AlbumName,
                Genre = album.Genre,
                DateReleased = album.DateReleased,
                LastModifyAt = DateTime.Now,
                LastModifyBy = admin.UserId
            });
            db.SaveChanges();
            return true;

        }

        [HttpPut("[action]")]
        [AdminFilter]
        public bool update(MoodyContext db, [FromBody]Album album)
        {
            Administrator admin = HttpContext.Session.Get<Administrator>("ADMIN");
            Album t = db.Album.Where(a => a.AlbumId == album.AlbumId).First();
            t.AlbumName = album.AlbumName;
            t.Genre = album.Genre;
            t.DateReleased = album.DateReleased;
            t.LastModifyBy = admin.UserId;
            t.LastModifyAt = DateTime.Now;
            db.SaveChanges();
            return true;

        }

        [HttpDelete("[action]")]
        [AdminFilter]
        public bool delete(MoodyContext db, [FromBody]Album album)
        {
            db.Album.Remove(db.Album.Where(a => a.AlbumId == album.AlbumId).First());
            db.SaveChanges();
            return true;
        }

        [HttpGet("[action]")]
        public IEnumerable<Album> lastest(MoodyContext db)
        {
            return db.Album
                .OrderByDescending(a => a.DateReleased)
                .Take(3)
                .ToList();
        }
    }
}
