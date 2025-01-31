namespace Seek.Entity;

public record Character(
    int Id,
    string Name,
    string Description,
    string SystemPrompt,
    DateTime CreateTime
);