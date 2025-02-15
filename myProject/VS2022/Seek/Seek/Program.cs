using System.Net.Http.Headers;
using Blazored.Modal;
using Seek.Components;
using Seek.DataService;
using Seek.HttpService;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddRazorComponents()
    .AddInteractiveServerComponents();
builder.Services.AddBlazoredModal();

// Add http client service
// var key = Environment.GetEnvironmentVariable("nvapi");
const string key = "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";
builder.Services.AddHttpClient<ChatRequestService>(client =>
{
    client.BaseAddress = new Uri("https://integrate.api.nvidia.com/v1/");
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