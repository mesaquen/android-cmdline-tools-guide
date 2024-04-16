---
title: "Android SDK ferramentas de linha de comando"
subtitle: Um guia detalhado para você configurar seu ambiente de desenvolvimento
subject: Um guia detalhado para você configurar seu ambiente de desenvolvimento android
author: Mesaque Francisco

lang: pt-BR

keyworks:
  - "android"
  - "sdk"
  - "emulator"
  - "linha de comando"
...

# Android SDK: guia de instalação

Este guia foi criado para auxiliar na configuração do ambiente de desenvolvimento para aplicações móveis Android. Atualmente, estou utilizando o GNU/Linux, porém, acredito que os passos descritos aqui possam ser adaptados para outras plataformas.

Se você tiver alguma dúvida ou sugestão, não hesite em me contatar através do meu GitHub ([@mesaquen](https://github.com/mesaquen)).

## Ferramentas de linha de comando

- Abra a [página de download do android
  sdk](https://developer.android.com/studio#command-line-tools-only)
- Pesquise por "Command line tools only"
- Faça o download do pacote de ferramentas para o seu sistema
  operacional

### Extrair arquivos e configurando as variáveis de ambiente

Crie um diretório chamado `.android_sdk` e extraia as ferramentas de linha de comando que você baixou anteriormente:

```code
mkdir .android_sdk
unzip commandlinetools-linux-9477386_latest.zip -d ~/.android_sdk/
```

Exporte as seguintes variáveis de ambiente em seu arquivo `.bashrc`:

```code
export ANDROID_SDK_ROOT="$HOME/.android_sdk"
export PATH="$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$PATH"
export PATH="$ANDROID_SDK_ROOT/emulator:$PATH"
```

### Instalar a versão mais nova das cmdline-tools

```code
$ANDROID_SDK_ROOT/cmdline-tools/bin/sdkmanager \
--sdk_root=$ANDROID_SDK_ROOT "cmdline-tools;latest"
```

Depois de instalar as ferramentas de linha de comando, o sdkmanager deve ser capaz de reconhecer a localização do SDK e você não precisará mais fornecer a flag sdk_root.

### Instale as plataformas, ferramentas de compilação e extras

```code
sdkmanager "platforms;android-33" "build-tools;33.0.2"
sdkmanager "extras;google;m2repository" "extras;android;m2repository"
sdkmanager "platform-tools" "tools"
sdkmanager --licenses
```

## Pacotes instalados

Para ver a lista de pacotes instalados execute o comando:

```code
sdkmanager --list_installed
```

## AVD: Android Virtual Device

Você precisará baixar a imagem do sistema antes de criar o AVD. Execute o comando para ver a lista de imagens disponíveis:

```code
sdkmanager --list | grep system-images
```

### Instalar a imagem escolhida

```code
sdkmanager "system-images;android-33;google_apis_playstore;x86_64"
```

### Criar o AVD executando o comando

Crie um AVD usando o seguinte comando:

```code
avdmanager create avd -n device \
--device pixel -k "system-images;android-33;google_apis_playstore;x86_64"
```

Para ver a lista de dispositivos virtuais disponíveis, execute:

```code
avdmanager list avd
```

## Emulador

Você pode iniciar o emulador passando o nome do AVD como parâmetro do comando:

```code
emulator @device
```

Aqui, "device" é o nome do AVD.
