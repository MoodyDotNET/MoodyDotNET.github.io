﻿// <auto-generated />
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage;
using Microsoft.EntityFrameworkCore.Storage.Internal;
using moody.Models;
using System;

namespace moody.Migrations
{
    [DbContext(typeof(MoodyContext))]
    [Migration("20180608170508_EditAlbumTitle")]
    partial class EditAlbumTitle
    {
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "2.0.3-rtm-10026")
                .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

            modelBuilder.Entity("moody.Models.Administrator", b =>
                {
                    b.Property<int>("UserId")
                        .ValueGeneratedOnAdd()
                        .HasColumnName("UserID");

                    b.Property<bool>("Available");

                    b.Property<string>("FirstName")
                        .HasMaxLength(50);

                    b.Property<DateTime?>("LastModifyAt")
                        .HasColumnType("datetime");

                    b.Property<int?>("LastModifyBy");

                    b.Property<string>("LastName")
                        .HasMaxLength(50);

                    b.Property<string>("MiidleName")
                        .HasMaxLength(50);

                    b.Property<string>("Password")
                        .IsRequired()
                        .HasMaxLength(50)
                        .IsUnicode(false);

                    b.Property<string>("Username")
                        .IsRequired()
                        .HasMaxLength(50)
                        .IsUnicode(false);

                    b.HasKey("UserId");

                    b.HasIndex("LastModifyBy");

                    b.ToTable("Administrator");
                });

            modelBuilder.Entity("moody.Models.Album", b =>
                {
                    b.Property<int>("AlbumId")
                        .ValueGeneratedOnAdd()
                        .HasColumnName("AlbumID");

                    b.Property<string>("CoverLink")
                        .HasMaxLength(10)
                        .IsUnicode(false);

                    b.Property<DateTime?>("DateReleased")
                        .HasColumnType("datetime");

                    b.Property<string>("Genre")
                        .HasMaxLength(20)
                        .IsUnicode(false);

                    b.Property<string>("Title")
                        .IsRequired()
                        .HasColumnName("Album")
                        .HasMaxLength(50);

                    b.HasKey("AlbumId");

                    b.ToTable("Album");
                });

            modelBuilder.Entity("moody.Models.Artist", b =>
                {
                    b.Property<int>("ArtistCode")
                        .ValueGeneratedOnAdd();

                    b.Property<bool>("Available");

                    b.Property<int?>("Band");

                    b.Property<string>("Biography")
                        .HasMaxLength(500);

                    b.Property<DateTime?>("BirthDate")
                        .HasColumnType("datetime");

                    b.Property<string>("CoverLink")
                        .IsRequired()
                        .ValueGeneratedOnAdd()
                        .HasDefaultValueSql("('404.png')")
                        .HasMaxLength(10)
                        .IsUnicode(false);

                    b.Property<string>("FirstName")
                        .IsRequired()
                        .HasMaxLength(50);

                    b.Property<string>("Introduce")
                        .HasMaxLength(100);

                    b.Property<DateTime?>("LastModifyAt")
                        .HasColumnType("datetime");

                    b.Property<int?>("LastModifyBy");

                    b.Property<string>("LastName")
                        .IsRequired()
                        .HasMaxLength(50);

                    b.Property<string>("MiddleName")
                        .HasMaxLength(50);

                    b.Property<int?>("ProducerCode");

                    b.HasKey("ArtistCode");

                    b.HasIndex("Band");

                    b.HasIndex("LastModifyBy");

                    b.HasIndex("ProducerCode");

                    b.ToTable("Artist");
                });

            modelBuilder.Entity("moody.Models.Category", b =>
                {
                    b.Property<int>("TagCode")
                        .ValueGeneratedOnAdd();

                    b.Property<string>("TagName")
                        .HasMaxLength(50)
                        .IsUnicode(false);

                    b.HasKey("TagCode");

                    b.ToTable("Category");
                });

            modelBuilder.Entity("moody.Models.Member", b =>
                {
                    b.Property<int>("UserId")
                        .ValueGeneratedOnAdd()
                        .HasColumnName("UserID");

                    b.Property<string>("FirstName")
                        .HasMaxLength(50);

                    b.Property<string>("LastName")
                        .HasMaxLength(50);

                    b.Property<string>("MiddleName")
                        .HasMaxLength(50);

                    b.Property<string>("Password")
                        .IsRequired()
                        .HasMaxLength(50)
                        .IsUnicode(false);

                    b.Property<string>("Username")
                        .IsRequired()
                        .HasMaxLength(50)
                        .IsUnicode(false);

                    b.HasKey("UserId");

                    b.HasIndex("Username")
                        .IsUnique()
                        .HasName("UK_Table_1");

                    b.ToTable("Member");
                });

            modelBuilder.Entity("moody.Models.Producer", b =>
                {
                    b.Property<int>("ProducerCode")
                        .ValueGeneratedOnAdd();

                    b.Property<string>("Address")
                        .IsRequired()
                        .HasMaxLength(100);

                    b.Property<bool>("Available");

                    b.Property<string>("CompanyName")
                        .IsRequired()
                        .HasMaxLength(50);

                    b.Property<DateTime?>("LastModifyAt")
                        .HasColumnType("datetime");

                    b.Property<int?>("LastModifyBy");

                    b.Property<string>("Owner")
                        .IsRequired()
                        .HasMaxLength(50);

                    b.HasKey("ProducerCode");

                    b.HasIndex("LastModifyBy");

                    b.ToTable("Producer");
                });

            modelBuilder.Entity("moody.Models.Rating", b =>
                {
                    b.Property<int>("UserId")
                        .HasColumnName("UserID");

                    b.Property<int>("SongId")
                        .HasColumnName("SongID");

                    b.Property<double>("Score");

                    b.HasKey("UserId", "SongId");

                    b.HasIndex("SongId");

                    b.ToTable("Rating");
                });

            modelBuilder.Entity("moody.Models.Song", b =>
                {
                    b.Property<int>("SongCode")
                        .ValueGeneratedOnAdd();

                    b.Property<int?>("AlbumId")
                        .HasColumnName("AlbumID");

                    b.Property<bool>("Available");

                    b.Property<int>("Composer");

                    b.Property<int>("ContributingArtist");

                    b.Property<string>("CoverLink")
                        .IsRequired()
                        .ValueGeneratedOnAdd()
                        .HasDefaultValueSql("('404.png')")
                        .HasMaxLength(10)
                        .IsUnicode(false);

                    b.Property<DateTime?>("DateReleased")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("datetime")
                        .HasDefaultValueSql("(((1)/(1))/(1900))");

                    b.Property<DateTime?>("LastModifyAt")
                        .HasColumnType("datetime");

                    b.Property<int?>("LastModifyBy");

                    b.Property<TimeSpan?>("Length")
                        .HasColumnType("time(0)");

                    b.Property<int>("ListeningFrequency")
                        .ValueGeneratedOnAdd()
                        .HasDefaultValueSql("((0))");

                    b.Property<string>("LyricCode")
                        .IsRequired()
                        .ValueGeneratedOnAdd()
                        .HasDefaultValueSql("('N/A')")
                        .HasMaxLength(20)
                        .IsUnicode(false);

                    b.Property<double>("Rating")
                        .ValueGeneratedOnAdd()
                        .HasDefaultValueSql("((0))");

                    b.Property<string>("Subtitle")
                        .IsRequired()
                        .HasMaxLength(50);

                    b.Property<string>("Title")
                        .IsRequired()
                        .HasMaxLength(50);

                    b.HasKey("SongCode");

                    b.HasIndex("AlbumId");

                    b.HasIndex("Composer");

                    b.HasIndex("ContributingArtist");

                    b.HasIndex("LastModifyBy");

                    b.ToTable("Song");
                });

            modelBuilder.Entity("moody.Models.Tag", b =>
                {
                    b.Property<int>("TagCode");

                    b.Property<int>("SongCode");

                    b.HasKey("TagCode", "SongCode");

                    b.HasIndex("SongCode");

                    b.ToTable("Tag");
                });

            modelBuilder.Entity("moody.Models.Administrator", b =>
                {
                    b.HasOne("moody.Models.Administrator", "LastModifyByNavigation")
                        .WithMany("InverseLastModifyByNavigation")
                        .HasForeignKey("LastModifyBy")
                        .HasConstraintName("FK_Administrator_Administrator");
                });

            modelBuilder.Entity("moody.Models.Artist", b =>
                {
                    b.HasOne("moody.Models.Artist", "BandNavigation")
                        .WithMany("InverseBandNavigation")
                        .HasForeignKey("Band")
                        .HasConstraintName("FK_Artist_Artist");

                    b.HasOne("moody.Models.Administrator", "LastModifyByNavigation")
                        .WithMany("Artist")
                        .HasForeignKey("LastModifyBy")
                        .HasConstraintName("FK_Artist_Administrator");

                    b.HasOne("moody.Models.Producer", "ProducerCodeNavigation")
                        .WithMany("Artist")
                        .HasForeignKey("ProducerCode")
                        .HasConstraintName("FK_Artist_Producer");
                });

            modelBuilder.Entity("moody.Models.Producer", b =>
                {
                    b.HasOne("moody.Models.Administrator", "LastModifyByNavigation")
                        .WithMany("Producer")
                        .HasForeignKey("LastModifyBy")
                        .HasConstraintName("FK_Producer_Administrator");
                });

            modelBuilder.Entity("moody.Models.Rating", b =>
                {
                    b.HasOne("moody.Models.Song", "Song")
                        .WithMany("RatingNavigation")
                        .HasForeignKey("SongId")
                        .HasConstraintName("FK_Rating_Song");

                    b.HasOne("moody.Models.Member", "User")
                        .WithMany("Rating")
                        .HasForeignKey("UserId")
                        .HasConstraintName("FK_Rating_Member");
                });

            modelBuilder.Entity("moody.Models.Song", b =>
                {
                    b.HasOne("moody.Models.Album", "Album")
                        .WithMany("Song")
                        .HasForeignKey("AlbumId")
                        .HasConstraintName("FK_Song_Album");

                    b.HasOne("moody.Models.Artist", "ComposerNavigation")
                        .WithMany("SongComposerNavigation")
                        .HasForeignKey("Composer")
                        .HasConstraintName("FK_Song_Artist");

                    b.HasOne("moody.Models.Artist", "ContributingArtistNavigation")
                        .WithMany("SongContributingArtistNavigation")
                        .HasForeignKey("ContributingArtist")
                        .HasConstraintName("FK_Song_Artist1");

                    b.HasOne("moody.Models.Administrator", "LastModifyByNavigation")
                        .WithMany("Song")
                        .HasForeignKey("LastModifyBy")
                        .HasConstraintName("FK_Song_Administrator");
                });

            modelBuilder.Entity("moody.Models.Tag", b =>
                {
                    b.HasOne("moody.Models.Song", "SongCodeNavigation")
                        .WithMany("Tag")
                        .HasForeignKey("SongCode")
                        .HasConstraintName("FK_Tag_Song");

                    b.HasOne("moody.Models.Category", "TagCodeNavigation")
                        .WithMany("Tag")
                        .HasForeignKey("TagCode")
                        .HasConstraintName("FK_Tag_Category");
                });
#pragma warning restore 612, 618
        }
    }
}
