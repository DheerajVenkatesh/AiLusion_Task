Instructions to setup environment:
- Make sure Python 3.11.0 is installed
- Install transformers, accelerate and diffusers using pip
- Install torch, torchaudio, torchvision using: pip install torch, torchvision, torchaudio --index-url https://download.pytorch.org/wh1/cu124 (url is for installing torch with cuda for gpu support)
- Install Julia
- Add Julia Extension to VSCode and in VSCode settings add julia.executablePath
- In Julia shell add Flux package and NPZ package using: using Pkg, Pkg,add(["Flux","NPZ"])
