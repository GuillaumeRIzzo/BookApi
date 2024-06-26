﻿using System.ComponentModel.DataAnnotations;

namespace BookAPI.Models
{
    public class ModelViewUser
    {
        private User user;

        public ModelViewUser() { }
        public ModelViewUser(User user)
        {
            this.user = user;
        }

        public int UserId { get; set; }
        [Required]
        public string UserFirstname { get; set; } = null!;

        [Required]
        public string UserLastname { get; set; } = null!;

        [Required]
        public string UserPassword { get; set; } = null!;

        [Required]
        public string UserLogin { get; set; } = null!;

        [Required]
        public string UserEmail { get; set; } = null!;

        [Required]
        public string UserRight { get; set; } = "User"!;
    }
}
