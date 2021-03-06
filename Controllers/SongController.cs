﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using moody.Extensions;
using moody.Models;
using Newtonsoft.Json;

namespace moody.Controllers
{
    [Route("api/[controller]")]
    public class SongController : Controller
    {
        [HttpGet("[action]")]
        public IEnumerable<Song> all(MoodyContext db)
        {
            return db.Song;
        }

        [HttpGet("[action]")]
        public IEnumerable<Song> from(MoodyContext db, int albumId)
        {
            return db.Song.Where(s => s.AlbumId == albumId);
        }

        [HttpGet("[action]")]
        public IEnumerable<Song> search(MoodyContext db, string searchField)
        {
            return db.Song
                .Where(s => s.Title.Contains(searchField) || s.Subtitle.Contains(searchField));
        }

        [HttpGet("[action]")]
        public Song get(MoodyContext db, int id)
        {
            Song song = db.Song.Where(s => s.SongCode == id).FirstOrDefault();
            song.ListeningFrequency++;
            db.SaveChanges();
            return song;
        }

        [HttpPost("[action]")]
        public IEnumerable<string> getGenre(MoodyContext db, Song song)
        {
            List<string> genres = new List<string>();
            foreach (var item in song.Tag)
            {
                genres = (db.Category.Where(t => t.TagCode == item.TagCode).Select(g => g.TagName).ToList());
            }
            return genres;
        }

        [HttpGet("[action]")]
        public IEnumerable<string> getGenre(MoodyContext db, int id)
        {
            List<string> genres = new List<string>();
            // foreach (var item in song.Tag) {
            genres = (db.Category.Where(t => t.TagCode == id).Select(g => g.TagName).ToList());
            // }
            return genres;
        }

        [HttpGet("[action]")]
        public Category getTag(MoodyContext db, int id)
        {
            Category tag = db.Category.Where(t => t.TagCode == id).First();
            return tag;
        }

        [HttpPost("[action]")]
        [AdminFilter]
        public bool insert(MoodyContext db, [FromBody]Song song)
        {
            Administrator admin = HttpContext.Session.Get<Administrator>("ADMIN");
            Song s = new Song
            {
                Title = song.Title,
                Subtitle = song.Subtitle,
                AlbumId = song.AlbumId,
                ContributingArtist = song.ContributingArtist,
                Composer = song.Composer,
                DateReleased = song.DateReleased,
                Lyric = song.Lyric,
                LastModifyAt = DateTime.Now,
                LastModifyBy = admin.UserId
            };
            db.Song.Add(s);
            db.SaveChanges();
            foreach (var t in song.Tag)
            {
                t.SongCode = s.SongCode;
            }
            s.Tag = song.Tag;
            db.SaveChanges();
            return true;

        }

        [HttpPut("[action]")]
        [AdminFilter]
        public bool update(MoodyContext db, [FromBody]Song song)
        {
            Administrator admin = HttpContext.Session.Get<Administrator>("ADMIN");
            Song t = db.Song.Where(a => a.SongCode == song.SongCode).First();
            t.Title = song.Title;
            t.Subtitle = song.Subtitle;
            t.AlbumId = song.AlbumId;
            t.ContributingArtist = song.ContributingArtist;
            t.Composer = song.Composer;
            t.DateReleased = song.DateReleased;
            t.Lyric = song.Lyric;
            t.LastModifyBy = admin.UserId;
            t.LastModifyAt = DateTime.Now;
            db.SaveChanges();
            db.Tag.RemoveRange(db.Tag.Where(tag => tag.SongCode == song.SongCode));
            db.SaveChanges();
            foreach (var tag in song.Tag)
            {
                db.Tag.Add(tag);
            }
            db.SaveChanges();
            return true;

        }

        [HttpDelete("[action]")]
        [AdminFilter]
        public bool delete(MoodyContext db, [FromBody]Song song)
        {
            db.Tag.RemoveRange(db.Tag.Where(tag => tag.SongCode == song.SongCode));
            db.Song.Remove(db.Song.Where(a => a.SongCode == song.SongCode).First());
            db.SaveChanges();
            return true;

        }


        /// <summary>
        /// Top 6 song have the amount of listening
        /// </summary>
        /// <param name="db"></param>
        /// <returns></returns>
        [HttpGet("[action]")]
        public IEnumerable<Song> mostListen(MoodyContext db)
        {
            return db.Song
                .OrderByDescending(s => s.ListeningFrequency)
                .Take(6)
                .ToList();
        }

        /// <summary>
        /// Top 6 song have highest Rating
        /// </summary>
        /// <param name="db"></param>
        /// <returns></returns>
        [HttpGet("[action]")]
        public IEnumerable<Song> suggested(MoodyContext db)
        {
            return db.Song
                .OrderByDescending(s => s.Rating)
                .Take(6)
                .ToList();
        }

        [HttpGet("[action]")]
        public IEnumerable<Song> related(MoodyContext db, int songID)
        {
            Song main = db.Song.Where(s => s.SongCode == songID).FirstOrDefault();
            return db.Song.Where(s => (
            (s.Composer == main.Composer || s.ContributingArtist == main.ContributingArtist) && s.SongCode != songID));
        }
    }
}