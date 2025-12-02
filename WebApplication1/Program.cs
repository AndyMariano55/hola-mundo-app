var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

// Mapear la ruta principal y devolver HTML
app.MapGet("/", () => Results.Content(@"
<!DOCTYPE html>
<html lang='es'>
<head>
    <meta charset='UTF-8'>
    <title>Hola Mundo</title>
    <style>
        body {
            background-color: #f0f8ff;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        h1 {
            color: #007ACC;
            font-size: 3em;
            text-shadow: 2px 2px 4px #aaa;
        }
        p {
            color: #333;
            font-size: 1.2em;
        }
    </style>
</head>
<body>
    <div>
        <h1>¡Hola Mundo!</h1>
        <p>Desde C# y ASP.NET Core 🚀</p>
    </div>
</body>
</html>
", "text/html"));

// Hacer que la app escuche en todas las interfaces en el puerto 80
app.Urls.Add("http://0.0.0.0:80");

app.Run();
