Write-Host "[WARN] Lendo script de geração de solução .NET v1.0.0." -ForegroundColor Yellow
if (Test-Path Variable:\newSolution) {
    Write-Host "[INFO] Criando solução:" -ForegroundColor Cyan

    Write-Host "[INFO] Etapa 1/9 - Cria arquivo .sln" -ForegroundColor Cyan
    dotnet new sln -o ./$newSolution
    
    Write-Host "[INFO] Etapa 2/9 - Cria Domain" -ForegroundColor Cyan
    dotnet new classlib -o ./$newSolution/$newSolution.Domain
    
    Write-Host "[INFO] Etapa 3/9 - Cria Infrastructure" -ForegroundColor Cyan
    dotnet new classlib -o ./$newSolution/$newSolution.Infrastructure
    
    Write-Host "[INFO] Etapa 4/9 - Cria Tests" -ForegroundColor Cyan
    dotnet new xunit -o ./$newSolution/$newSolution.Tests
    
    Write-Host "[INFO] Etapa 5/9 - Cria WebApi" -ForegroundColor Cyan
    dotnet new webapi -o ./$newSolution/$newSolution.WebApi
    
    Write-Host "[INFO] Etapa 6/9 - Registra projetos criados no arquivo .sln" -ForegroundColor Cyan
    dotnet sln ./$newSolution/$newSolution.sln add ./$newSolution/$newSolution.Domain\$newSolution.Domain.csproj
    dotnet sln ./$newSolution/$newSolution.sln add ./$newSolution/$newSolution.Infrastructure\$newSolution.Infrastructure.csproj
    dotnet sln ./$newSolution/$newSolution.sln add ./$newSolution/$newSolution.Tests\$newSolution.Tests.csproj
    dotnet sln ./$newSolution/$newSolution.sln add ./$newSolution/$newSolution.WebApi\$newSolution.WebApi.csproj

    Write-Host "[INFO] Etapa 7/9 - Inicializa repositório git" -ForegroundColor Cyan
    git init ./$newSolution

    Write-Host "[INFO] Etapa 8/9 - Cria gitignore" -ForegroundColor Cyan
    dotnet new gitignore -o ./$newSolution

    Write-Host "[INFO] Etapa 9/9 - Cria README" -ForegroundColor Cyan
    New-Item -Path "./$newSolution/README.md" -ItemType File

    Write-Host "[INFO] A solução $newSolution está pronta!" -ForegroundColor Cyan

    # CLEANING
    # Remove-Item -Path .\$newSolution\ -Recurse -Force;
}
else {
    Write-Host "[ERRO] Variável 'newSolution' não encontrada. Defina uma variável 'newSolution' com o nome a ser dado à solução e tente novamente. Acesse o README.md para mais informações." -ForegroundColor DarkRed
    Write-Host "[INFO] O script lido não gerou nenhuma solução e foi terminado." -ForegroundColor Cyan
}