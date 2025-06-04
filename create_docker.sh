echo ""
echo "============================================================"
echo "   INICIANDO A CONTAINERIZAÇÃO DO PROJETO FONTEVIVA "
echo "============================================================"
echo ""

cd deploy

CAMINHO=$(pwd)

echo "credenciais Oracle:"
read -p "USUARIO " ID
read -s -p "SENHA: " PASSWORD
echo ""

# Substitui as variáveis no appsettings.json e salva como appsettings.final.json
export ID
export PASSWORD
envsubst < appsettings.template.json > appsettings.json

echo ""
echo "============================================================"
echo " 📦 Criando Imagem personalizada da aplicação ASP.NET 'FonteViva'"
echo "============================================================"
docker build -t fonte-viva .

echo ""
echo "============================================================"
echo " 📦 Criando container da aplicação ASP.NET 'FonteViva'"
echo "============================================================"
docker run -d -p 8081:8080 -v $CAMINHO:/app --name fonte-viva fonte-viva

echo ""
echo "============================================================"
echo " ✅ TUDO PRONTO! SISTEMA CONTAINERIZADO COM SUCESSO ✅"
echo "============================================================"
echo ""

echo ""
echo "============================================================"
echo "Lista de imagens no Docker: 'docker image ls'"
docker image ls
echo "============================================================"

echo ""
echo "============================================================"
echo "📦 Lista de containers ativos: 'docker ps'"
docker ps
echo "============================================================"
