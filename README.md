Instructions to setup environment:
- Make sure Python 3.11.0 is installed.
- Install transformers, accelerate and diffusers using pip.
- Install torch, torchaudio, torchvision using: pip install torch, torchvision, torchaudio --index-url https://download.pytorch.org/wh1/cu124 (url is for installing torch with cuda for gpu support).
- Install Julia.
- Add Julia Extension to VSCode and in VSCode settings add julia.executablePath.
- In Julia shell add Flux package and NPZ package using: using Pkg, Pkg,add(["Flux","NPZ"]) (NPZ package is for importing npy files).

Approach:
In the .ipynb(python notebook) file:
- Used the nmkd/stable-diffusion-1.5-fp16 model from hugging face for image generation.
- Using diffusers library setup the DiffusionPipeline and used cuda to use my inbuilt RTX 4050 GPU.
- Gave a prompt and generated three images of the same prompt using a simple for loop and rezied the images to 224x224 resolution saved the all the images separately.
- Used tranforms from torchvision to convert the images to Tensor between the range of 0 to 1 and saved the tensors in a list.
- Used np.save() to create a .npy file consisting of the tensors as a np array.
In the .jl (julia) file:
- Imported flux and npz(npz for importing .npy file)
- Defined a simple feed forward neural network using dense function with rectified linear unit(relu) and softmax as activation function.
- Wrote a function to import the .npy file using path and then reshape the array for dense layer input.
- Then the neural network is called with the reshaped tensor as input and provides an array of output.
- Note: Only using dense layers as not familiar with flux(julia).

  Challenges encountered:
  - Using flux(julia) and understanding how different functions and imports work.
  - Finding a diffusion model and hugging face than can run with minimal hardware requirements.
  - Using julia with VSCode as VSCode did not recognise julia which had been installed.
  - Installing torch with cuda support to use inbuilt gpu device to run the models.


