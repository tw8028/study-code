using System.Text.Json;
using Microsoft.EntityFrameworkCore;
using Seek.Entity;
using Seek.ValueObject;

namespace Seek.DataService;

public class SeekDbContext : DbContext
{
    public DbSet<Character> Characters { get; set; }
    public DbSet<ChatMessage> ChatMessages { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder) =>
        optionsBuilder.UseSqlite(connectionString:"Data Source=SeekSqlite.dat");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Character>(entity =>
        {
            entity.HasKey(character => character.Id);
            entity.Property(character => character.CreateTime).HasDefaultValueSql("CURRENT_TIMESTAMP");
        });
        modelBuilder.Entity<ChatMessage>(entity =>
        {
            entity.HasKey(chatMessage => chatMessage.Id);
            entity.Property(chatMessage => chatMessage.Messages)
                .HasColumnType("TEXT")
                .HasConversion(
                    messages => JsonSerializer.Serialize(messages, JsonSerializerOptions.Default),
                    json => JsonSerializer.Deserialize<List<Message>>(json, JsonSerializerOptions.Default)!
                );
            entity.Property(chatMessage => chatMessage.CreateTime).HasDefaultValueSql("CURRENT_TIMESTAMP");
        });
    }
}