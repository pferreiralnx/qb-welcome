# ESX Welcome Rewards 🎁

![ESX Welcome Rewards](./ignore.png)

## 🇵🇹 Descrição (PT-PT)

Script para **prémio de boas-vindas à sua cidade!** 
Quando os civis entrarem na cidade, devem utilizar o comando `/welcome` e uma interface moderna em forma de tablet abrirá. Após a abertura, o jogador poderá escolher o prémio que mais lhe agrada entre as opções disponíveis.

### Funcionalidades principais:
- **Comando Único:** `/welcome` para abrir a interface de prémios.
- **Design Moderno:** Tablet responsivo que suporta de 1 até 6 prémios em simultâneo.
- **Tipos de Prémios:** Suporte para Dinheiro (Bank), Itens, Carros e Bundles (combinação de vários benefícios).
- **Segurança:** O script verifica na base de dados e apenas permite resgatar o prémio **uma única vez** por cidadão.
- **Integração de Garagem:** Baseado no sistema do `esx_vehicleshop` para gerar matrículas e adicionar os carros diretamente à garagem do jogador (`owned_vehicles`).

### Configuração:
Toda a lógica de prémios, descrições, imagens e quantidades pode ser alterada facilmente no ficheiro `config.lua`.

---

## 🇬🇧 Description (EN-EN)

Welcome reward script for **your FiveM server!**
When civilians join the city, they can use the `/welcome` command to open a modern tablet-style UI. Once opened, the player can choose their preferred welcome gift from the available options.

### Main Features:
- **Single Command:** `/welcome` to trigger the rewards interface.
- **Modern Design:** Responsive tablet UI that supports from 1 up to 6 rewards at once.
- **Reward Types:** Support for Money (Bank), Items, Cars, and Bundles (a combination of multiple rewards).
- **Security:** The script checks the database to ensure each player can only redeem a reward **once**.
- **Garage Integration:** Based on `esx_vehicleshop` logic to generate plates and add vehicles directly to the player's garage (`owned_vehicles`).

### Configuration:
All reward logic, descriptions, images, and amounts can be easily customized in the `config.lua` file.

---

## 🛠️ Instalação / Installation

1. Extraia a pasta `esx_welcome` para o seu diretório de `resources`.
2. Importe o ficheiro SQL para a sua base de dados:
   ```sql
   CREATE TABLE IF NOT EXISTS `welcome_rewards` (
       `id` INT AUTO_INCREMENT PRIMARY KEY,
       `identifier` VARCHAR(60) NOT NULL,
       `prize` INT NOT NULL,
       `redeemed_at` DATETIME NOT NULL
   );
3. Adicione as imagens dos seus prémios na pasta html/img/ (certifique-se que o nome no config.lua corresponde ao nome do ficheiro).
4. Adicione ao seu server.cfg: ensure esx_welcome

📞 Suporte / Support

Caso necessite de suporte técnico ou pretenda solicitar alterações personalizadas, entre em contacto através do Discord:

👉 https://discord.gg/eE58y5FbkR

