## How to

Antes de clonar el repositorio, asegúrate de tener instalado lo siguiente en tu sistema:

- [GNU Octave](https://www.gnu.org/software/octave/)  
- [Python 3](https://www.python.org/downloads/)
- [pip](https://pip.pypa.io/en/stable/) **o** una herramienta alternativa como [UV](https://github.com/astral-sh/uv)
- [GIT](https://git-scm.com/downloads)

```bash
git clone https://github.com/xkaedez/simulacion.git
```

Despues de clonar el repositorio
```bash
cd simulacion
```

Crear un venv para no instalar modulo globalmente:

```bash
python -m venv modulos
```

en Windows Powershell ejecutar
```bash
modulos\Scripts\Activate.ps1
```
Linux
```bash
source modulos/bin/activate
```

instalar los modulos:
```bash
pip install -r requirements.txt
```

Con `uv`:

```bash
uv pip install -r requirements.txt
```

## WSL
Esta es la manera facil de levantar el env, los requisitos son git y GNU Octave.
Si se usa una distribucion GNU/Linux saltar al paso de clonar el repo.

en Windows powershell
```bash
wsl --install -d ubuntu
```
Entrar a ubuntu
```bash 
wsl -d ubuntu
```

Agregar el repositorio de [GNU Octave](https://launchpad.net/~octave/+archive/ubuntu/stable)
```bash
sudo add-apt-repository ppa:octave/stable
```

Actualizar repos
```bash
sudo apt update && sudo apt upgrade
```
Instalar octave y git
```bash
sudo apt install octave
```
```bash
sudo apt install git
```

Clonar el repo
```bash
git clone https://github.com/xkaedez/simulacion.git
``` 

Ejecutar setup.sh
```bash
./setup.sh
```

Si el script falla, verificar dependencias.
