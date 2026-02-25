Config = {}

Config.Title    = '🎉 Bem-vindo!'
Config.Subtitle = 'Escolhe o teu prémio de boas-vindas'
Config.PrizeCount = 3 -- até 6

Config.Prizes = {
    [1] = {
        label       = 'Dinheiro',
        description = 'Começa com dinheiro no bolso para os teus primeiros passos na cidade.',
        badge       = '5,000€',
        image       = 'money.png',
        type        = 'money',
        money       = 5000,
    },
    [2] = {
        label       = 'Kit Starter',
        description = 'Recebe um kit com itens essenciais para sobreviveres nos primeiros dias.',
        badge       = '1,000€ + Itens',
        image       = 'kitstart.png',
        type        = 'item',
        money       = 1000,
        items       = {  
            { item = 'water_bottle', count = 10 }, -- Nome corrigido  
            { item = 'sandwich',     count = 5  }, -- Nome corrigido
        }
    },
    [3] = {
        label       = 'Carro',
        description = 'Recebe um carro para te movimentares pela cidade.',
        badge       = 'Veículo',
        image       = 'elegy.png',
        type        = 'car',
        carModel    = 'elegy',
    }
    --[[[4] = {  
        label       = 'Bundle',  
        description = 'Bundle',  
        badge       = 'Bundle',  
        image       = 'prize4.png',  
        type        = 'bundle',  
        carModel    = 'elegy',  
         money       = 2500,  
        items       = {  
            { item = 'water', count = 10 },  
            { item = 'bread', count = 5  },  
            { item = 'phone', count = 1  },  
        }  
    },  
    [5] = {
        label       = 'Prémio 5',
        description = 'Descrição do prémio 5.',
        badge       = 'Especial',
        image       = 'prize5.png',
        type        = 'money',
        money       = 2500,
    },
    [6] = {
        label       = 'Prémio 6',
        description = 'Descrição do prémio 6.',
        badge       = 'Raro',
        image       = 'prize6.png',
        type        = 'item',
        money       = 0,
        items       = {  
            { item = 'water', count = 10 },  
            { item = 'bread', count = 5  },  
            { item = 'phone', count = 1  },  
        }  
    }    
        --]]
}