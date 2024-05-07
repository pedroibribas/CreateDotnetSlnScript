# CreateDotnetSln

<br>

## Especificações
|                                              |                                              |
| -------------------------------------------- | -------------------------------------------- |
| Versão atual                                 | 1.0.0 |
| Plataforma                                   | PowerShell 7.4.2 |

<br>

## Pré-requisitos
| Ferramenta                                   | Versão |
| -------------------------------------------- | -------------------------------------------- |
| Powershell                                   | 7.4.2   |
| Git                                          | 2.38.1  |
| Dotnet CLI                                   | 8.0.204 |

<br>

## Modo de uso
- Abra o PowerShell e navegue para a pasta onde o projeto será inicializado:
```ps
PS C:> cd ./MeusProjetosDotnet
```
- Crie uma variável `newSolution` antes de rodar o script, definindo o nome da solução:
```ps
PS C:\MeusProjetosDotnet> $newSolution="PetShop"
```
- Rode o arquivo no terminal:
```ps
PS C:\MeusProjetos> ./CreateDotnetSln/CreateDotnetSln.ps1
```

<br>

## Notas das versões
### v1.0.0
- Cria arquivo da solução, bibliotecas de classe para a camada de domínio e de infra, projeto xUnit e projeto de API Web.
- Inicializa repositório git, cria .gitignore e README.
- Tratamento de erro caso variável `newSolution` não seja encontrada.