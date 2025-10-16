# Living IA - Sistema de Análise Imobiliária

Sistema web completo para análise inteligente de dados imobiliários utilizando Machine Learning e visualizações interativas.

## 📋 Sobre o Projeto

Living IA é uma aplicação que combina análise de dados, inteligência artificial e visualização interativa para fornecer insights sobre o mercado imobiliário. O sistema permite:

- **Análise de Dados**: Clustering e análise estatística de imóveis
- **Previsão de Preços**: Modelos de Machine Learning para prever valores
- **Visualizações Interativas**: Dashboards dinâmicos com gráficos e métricas
- **Gestão de Dados**: API REST para manipulação de dados de lotes e apartamentos
- **Autenticação**: Sistema de login e registro de usuários

## 🏗️ Arquitetura

O projeto está dividido em duas partes principais:

### Backend (Python/Flask)
- **API REST**: Endpoints para manipulação de dados
- **Machine Learning**: Análise de clusters e previsão de preços
- **Dashboard Interativo**: Visualizações com Dash/Plotly
- **Banco de Dados**: MongoDB para persistência

### Frontend (Vue 3/TypeScript)
- **Interface Moderna**: UI responsiva com Tailwind CSS
- **SPA**: Single Page Application com Vue Router
- **Gerenciamento de Estado**: Pinia para state management
- **TypeScript**: Tipagem estática para maior confiabilidade

## 🚀 Tecnologias Utilizadas

### Backend
- **Flask** - Framework web Python
- **Flask-CORS** - Cross-Origin Resource Sharing
- **PyMongo** - Driver MongoDB para Python
- **Pandas** - Análise e manipulação de dados
- **NumPy** - Computação numérica
- **Scikit-learn** - Machine Learning
- **Plotly** - Gráficos interativos
- **Dash** - Framework para dashboards analíticos

### Frontend
- **Vue 3** - Framework JavaScript progressivo
- **TypeScript** - Superset tipado do JavaScript
- **Vite** - Build tool e dev server
- **Vue Router** - Roteamento SPA
- **Pinia** - Gerenciamento de estado
- **Axios** - Cliente HTTP
- **Tailwind CSS** - Framework CSS utility-first

### Banco de Dados
- **MongoDB Atlas** - Banco de dados NoSQL na nuvem

## 📦 Instalação

### Pré-requisitos

- Python 3.12 ou superior
- Node.js 18 ou superior
- npm ou yarn
- Conta MongoDB Atlas (ou MongoDB local)

### Backend

1. Clone o repositório:
```bash
git clone https://github.com/JONTK123/Projeto-Integrador-5.git
cd Projeto-Integrador-5
```

2. Crie e ative um ambiente virtual Python:
```bash
python -m venv venv

# Windows
venv\Scripts\activate

# Linux/Mac
source venv/bin/activate
```

3. Instale as dependências:
```bash
pip install -r requirements.txt
```

4. Configure as variáveis de ambiente:
Crie um arquivo `.env` na raiz do projeto com:
```env
MONGODB_URI=sua_connection_string_mongodb
DATABASE_NAME=living_datas
```

5. Execute a aplicação:
```bash
python -m backend.api.app
```

O backend estará disponível em `http://localhost:5000`

### Frontend

1. Navegue até o diretório do frontend:
```bash
cd frontend/well-living
```

2. Instale as dependências:
```bash
npm install
```

3. Execute o servidor de desenvolvimento:
```bash
npm run dev
```

O frontend estará disponível em `http://localhost:5173`

## 🎯 Funcionalidades

### API REST

#### Endpoints de Dados
- `GET /data` - Dados de exemplo
- `GET /mongo` - Testa conexão MongoDB
- `GET /mongo/get/lotes` - Lista todos os lotes
- `GET /mongo/get/apartamentos` - Lista todos os apartamentos
- `POST /mongo/insert/lotes` - Insere um lote
- `POST /mongo/insert/apartamentos` - Insere um apartamento
- `POST /mongo/insert_all/lotes` - Insere múltiplos lotes
- `POST /mongo/insert_all/apartamentos` - Insere múltiplos apartamentos

#### Endpoints de Autenticação
- `POST /auth/login` - Login de usuário
- `POST /auth/register` - Registro de novo usuário

#### Dashboard
- `/dash/` - Dashboard interativo com visualizações

### Machine Learning

O sistema utiliza os seguintes algoritmos:

1. **K-Means Clustering**
   - Agrupa imóveis por características similares
   - Identifica clusters de alto e baixo preço
   - Normalização de dados com StandardScaler

2. **Random Forest Regressor**
   - Previsão de preços baseada em área
   - Avaliação com métricas MSE e R²
   - Feature importance para interpretabilidade

3. **Análise Estatística**
   - Remoção de outliers (método IQR)
   - Estatísticas descritivas por cluster
   - Agregações e visualizações

## 📊 Estrutura do Projeto

```
Projeto-Integrador-5/
├── backend/
│   ├── api/
│   │   ├── __init__.py
│   │   └── app.py              # Aplicação Flask principal
│   ├── handlers/
│   │   ├── __init__.py
│   │   └── mongo_handler.py    # Handler MongoDB
│   ├── models/
│   │   ├── __init__.py
│   │   └── document.py         # Modelo de documento
│   ├── __init__.py
│   ├── dashboard.py            # Dashboard Dash/Plotly
│   ├── documents_list.py       # Dados de exemplo
│   └── ia_analysis.py          # Análise com ML
├── frontend/
│   └── well-living/
│       ├── src/
│       │   ├── views/
│       │   │   ├── Dashboard.vue
│       │   │   ├── Login.vue
│       │   │   └── Register.vue
│       │   ├── services/
│       │   │   └── auth.ts
│       │   ├── composables/
│       │   │   └── useAuth.ts
│       │   ├── router/
│       │   │   └── index.ts
│       │   ├── App.vue
│       │   ├── main.ts
│       │   └── style.css
│       ├── public/
│       ├── index.html
│       ├── package.json
│       ├── vite.config.ts
│       └── tsconfig.json
├── .gitignore
├── requirements.txt
└── README.md
```

## 🔒 Segurança

**IMPORTANTE**: Este projeto contém credenciais hardcoded no código. Para uso em produção:

1. Remova todas as credenciais do código
2. Use variáveis de ambiente para dados sensíveis
3. Configure `.env` adequadamente
4. Nunca commite arquivos `.env` no repositório
5. Use secrets management em produção

Exemplo de configuração segura:
```python
# No código
from os import getenv
handler = MongoHandler(getenv('MONGODB_URI'), getenv('DATABASE_NAME'))
```

## 🧪 Testes

Para executar os testes do frontend:
```bash
cd frontend/well-living
npm run test
```

## 📝 Build para Produção

### Backend
```bash
# Configure suas variáveis de ambiente de produção
# Use um servidor WSGI como Gunicorn
pip install gunicorn
gunicorn -w 4 backend.api.app:app
```

### Frontend
```bash
cd frontend/well-living
npm run build
```

Os arquivos compilados estarão em `frontend/well-living/dist/`

## 🤝 Contribuindo

1. Fork o projeto
2. Crie uma branch para sua feature (`git checkout -b feature/NovaFeature`)
3. Commit suas mudanças (`git commit -m 'Adiciona nova feature'`)
4. Push para a branch (`git push origin feature/NovaFeature`)
5. Abra um Pull Request

## 📄 Licença

Este projeto é parte do Projeto Integrador 5 e está disponível para fins educacionais.

## 👥 Autores

- Equipe Living IA
- Projeto Integrador 5

## 📞 Suporte

Para questões e suporte, abra uma issue no repositório do GitHub.

## 🎓 Contexto Acadêmico

Este projeto foi desenvolvido como parte do Projeto Integrador 5, demonstrando a aplicação prática de:
- Desenvolvimento Full Stack
- Machine Learning aplicado
- Análise de dados
- Visualização de informações
- Arquitetura de software
- Integração de tecnologias modernas

---

**Nota**: Este é um projeto acadêmico em desenvolvimento. Contribuições e sugestões são bem-vindas!
