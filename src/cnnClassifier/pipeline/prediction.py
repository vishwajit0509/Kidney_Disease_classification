import numpy as np
from tensorflow.keras.models import load_model
from tensorflow.keras.preprocessing import image
import os

class PredictionPipeline:
    def __init__(self, filename):
        self.filename = filename
    
    def predict(self):
        try:
            # Load model
            model_path = os.path.join("artifacts", "training", "model.h5")
            model = load_model(model_path)
            
            # Load and preprocess image
            img = image.load_img(self.filename, target_size=(224, 224))
            img_array = image.img_to_array(img)
            img_array = img_array / 255.0  # Normalize if needed
            img_array = np.expand_dims(img_array, axis=0)
            
            # Get prediction probabilities
            probs = model.predict(img_array)[0]
            print(f"Prediction probabilities: {probs}")  # Debug output
            
            # Determine prediction
            if probs[1] > 0.5:  # Assuming index 1 is tumor
                prediction = 'Tumor'
                confidence = float(probs[1])
            else:
                prediction = 'Normal'
                confidence = float(probs[0])
            
            return [{
                "image": prediction,
                "confidence": confidence
            }]
            
        except Exception as e:
            print(f"Prediction error: {str(e)}")
            return [{"error": str(e)}]