# Tech Challenge - DB Infra

erDiagram
    Cliente {
        String id PK
        String nome
        String documento UK
        TipoDocumento tipoDocumento
        String telefone
        String email
        DateTime createdAt
        DateTime updatedAt
    }

    Veiculo {
        String id PK
        String placa UK
        String marca
        String modelo
        Int ano
        String clienteId FK
        DateTime createdAt
        DateTime updatedAt
    }

    Servico {
        String id PK
        String nome
        String descricao
        Float precoBase
        Int tempoMedioMinutos
        Boolean ativo
        DateTime createdAt
        DateTime updatedAt
    }

    Peca {
        String id PK
        String nome
        String descricao
        Float precoUnitario
        Int quantidadeEstoque
        Int quantidadeReservada
        Boolean ativo
        DateTime createdAt
        DateTime updatedAt
    }

    OrdemServico {
        String id PK
        Int numero UK
        String clienteId FK
        String veiculoId FK
        StatusOS status
        String diagnostico
        Float valorTotal
        DateTime dataCriacao
        DateTime dataInicioDiagnostico
        DateTime dataInicioExecucao
        DateTime dataFinalizacao
        DateTime dataEntrega
        DateTime createdAt
        DateTime updatedAt
    }

    OrdemServicoServico {
        String id PK
        String ordemServicoId FK
        String servicoId FK
        Float valor
        DateTime createdAt
    }

    OrdemServicoPeca {
        String id PK
        String ordemServicoId FK
        String pecaId FK
        Int quantidade
        Float valorUnitario
        DateTime createdAt
    }

    Orcamento {
        String id PK
        String ordemServicoId FK
        Float valorServicos
        Float valorPecas
        Float valorTotal
        StatusOrcamento status
        DateTime dataGeracao
        DateTime dataAprovacao
        DateTime createdAt
        DateTime updatedAt
    }

    Usuario {
        String id PK
        String nome
        String email UK
        String senhaHash
        PapelUsuario papel
        DateTime createdAt
        DateTime updatedAt
    }

    HistoricoStatusOS {
        String id PK
        String ordemServicoId FK
        StatusOS statusAnterior
        StatusOS statusNovo
        String observacao
        DateTime createdAt
    }

    Cliente ||--o{ Veiculo : "possui"
    Cliente ||--o{ OrdemServico : "solicita"
    Veiculo ||--o{ OrdemServico : "vinculado a"
    OrdemServico ||--o{ OrdemServicoServico : "contém"
    Servico ||--o{ OrdemServicoServico : "atribuído em"
    OrdemServico ||--o{ OrdemServicoPeca : "utiliza"
    Peca ||--o{ OrdemServicoPeca : "alocada em"
    OrdemServico ||--o{ Orcamento : "gera"
    OrdemServico ||--o{ HistoricoStatusOS : "registra histórico"