#!/bin/bash

# Atualiza os pacotes
sudo apt-get update

# Remover versões antigas do docker
sudo apt-get remove docker-engine docker.io

# Instalar versão mais recente do docker
sudo apt install docker.io

# Mensagem de sucesso
clear
echo "Docker instalado com sucesso"
docker --version

# Pergunta ao usuário se deseja iniciar o Docker junto com a inicialização da máquina
read -p "Deseja iniciar o Docker automaticamente com a inicialização da máquina? (s/n): " choice

if [[ $choice == "s" || $choice == "S" ]]; then
  # Configura o Docker para iniciar automaticamente com a inicialização da máquina
  sudo systemctl enable docker
  echo "O Docker foi configurado para iniciar automaticamente com a inicialização da máquina."
else
  echo "O Docker não será iniciado automaticamente com a inicialização da máquina."
fi

read -p "Deseja adicionar o docker como permissão desse usuário? [s/n]: " choice

if [[ $choice == "s" || $choice == "S" ]]; then
    sudo groupadd docker
    sudo usermod -aG docker $USER
    echo "Agora para rodar o docker não é necessário o sudo"
else
    echo "Agora para rodar o docker é necessário o sudo"
fi

