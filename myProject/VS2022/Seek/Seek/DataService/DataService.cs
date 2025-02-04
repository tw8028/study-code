using Microsoft.EntityFrameworkCore;
using Seek.Entity;

namespace Seek.DataService;

public class DataService
{
    private readonly SeekDbContext context;

    public DataService(SeekDbContext context)
    {
        this.context = context;
        this.context.Database.EnsureCreated();
    }

    // Character CRUD
    public async Task<int> AddCharacterAsync(Character character)
    {
        context.Characters.Add(character);
        return await context.SaveChangesAsync();
    }

    public async Task<Character?> GetCharacterAsync(int id)
        => await context.Characters.FindAsync(id);

    public async Task<List<Character>> GetAllCharactersAsync()
        => await context.Characters.ToListAsync();

    public async Task<int> UpdateCharacterAsync(Character character)
    {
        var existing = await context.Characters.FindAsync(character.Id);
        if (existing == null) return 0;

        existing.Name = character.Name;
        existing.Description = character.Description;
        existing.SystemPrompt = character.SystemPrompt;

        context.Characters.Update(existing);
        return await context.SaveChangesAsync();
    }

    public async Task<int> DeleteCharacterAsync(int id)
    {
        var character = await context.Characters.FindAsync(id);
        if (character == null) return 0;
        context.Characters.Remove(character);
        return await context.SaveChangesAsync();
    }

    // ChatMessage CRUD
    public async Task<int> AddChatMessageAsync(Chat chat)
    {
        context.ChatMessages.Add(chat);
        return await context.SaveChangesAsync();
    }

    public async Task<Chat?> GetChatMessageAsync(int id)
        => await context.ChatMessages.FindAsync(id);

    public async Task<List<Chat>> GetAllChatMessagesAsync()
        => await context.ChatMessages.ToListAsync();

    public async Task<int> UpdateChatMessageAsync(Chat chat)
    {
        // context.ChatMessages.Update(chatMessage);
        var existing = await context.ChatMessages.FindAsync(chat.Id);
        if (existing == null) return 0;

        existing.Title = chat.Title;
        existing.Messages = chat.Messages;

        context.ChatMessages.Update(existing);
        return await context.SaveChangesAsync();
    }

    public async Task<int> DeleteChatMessageAsync(int id)
    {
        var chatMessage = await context.ChatMessages.FindAsync(id);
        if (chatMessage == null) return 0;
        context.ChatMessages.Remove(chatMessage);
        return await context.SaveChangesAsync();
    }
}