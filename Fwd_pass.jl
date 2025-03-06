using Pkg; Pkg.add(["Flux","NPZ"])
using Flux
using Flux: relu, Dense
using NPZ  # for importing npy files

# Define a simple feedforward neural network
model = Chain(
    Dense(224 * 224 * 3, 128, relu),  
    Dense(128, 10),               
    softmax                       
)

# Load preprocessed image tensor from .npy file
function load_preprocessed_tensor(file_path)
    data = npzread(file_path)  # Load the .npy file
    img_array = Float32.(data[1, :, :, :])  # Take the first image (assuming batch format)
    return reshape(img_array, 224 * 224 * 3)  # Flatten for Dense layer input
end

#Forward pass
tensor_path = "prep_img_tensor.npy"  # Path to saved .npy file
input_tensor = load_preprocessed_tensor(tensor_path)
output = model(input_tensor)

println("Model output:", output)