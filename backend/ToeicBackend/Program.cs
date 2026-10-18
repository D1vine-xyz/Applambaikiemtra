using Microsoft.EntityFrameworkCore;
using ToeicBackend.Data;
using ToeicBackend.Services;

var builder = WebApplication.CreateBuilder(args);

// EF Core + SQL Server (dung CSDL da tao bang create_database.sql)
builder.Services.AddDbContext<AppDbContext>(o =>
    o.UseSqlServer(builder.Configuration.GetConnectionString("Default"),
        sqlOptions => sqlOptions.UseQuerySplittingBehavior(QuerySplittingBehavior.SplitQuery)));

builder.Services.AddMemoryCache();
builder.Services.AddScoped<ExamImportService>();
builder.Services.AddScoped<ExamQueryService>();

builder.Services.AddControllersWithViews();

// CORS cho app Flutter (dev)
builder.Services.AddCors(o => o.AddDefaultPolicy(p =>
    p.AllowAnyOrigin().AllowAnyHeader().AllowAnyMethod()));

var app = builder.Build();

app.UseCors();
app.UseStaticFiles();
app.UseRouting();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Exam}/{action=Index}/{id?}");

app.Run();
