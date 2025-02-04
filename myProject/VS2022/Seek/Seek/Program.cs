using System.Net.Http.Headers;
using Blazored.Modal;
using Seek.Components;
using Seek.ValueObject;
using Seek.DataService;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddRazorComponents()
    .AddInteractiveServerComponents();
builder.Services.AddBlazoredModal();

// Add http client service
var key = Environment.GetEnvironmentVariable("SEEK_API_KEY");
builder.Services.AddHttpClient<ChatRequest>(client =>
{
    client.BaseAddress = new Uri("https://api.deepseek.com/");
    client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", key);
});

// Add data service
builder.Services.AddDbContext<SeekDbContext>();
builder.Services.AddScoped<DataService>();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error", createScopeForErrors: true);
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();


app.UseAntiforgery();

app.MapStaticAssets();
app.MapRazorComponents<App>()
    .AddInteractiveServerRenderMode();

app.Run();