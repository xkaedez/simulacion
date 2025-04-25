## How to

Antes de clonar el repositorio, asegúrate de tener instalado lo siguiente en tu sistema:

- [GNU Octave](https://www.gnu.org/software/octave/)  
- [Python 3](https://www.python.org/downloads/)
- [pip](https://pip.pypa.io/en/stable/) **o** una herramienta alternativa como [UV](https://github.com/astral-sh/uv)
- [GIT](https://git-scm.com/downloads)

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

