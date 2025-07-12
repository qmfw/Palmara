import os
from dotenv import load_dotenv
from fastapi import APIRouter, UploadFile, File, Form
from fastapi.responses import JSONResponse
from openai import OpenAI
from io import BytesIO
import base64

from app.prompts import generate_analysis_prompt, generate_forecast_prompt
from app.utils import encode_image_to_base64

load_dotenv()
OPENAI_API_KEY = os.getenv("OPENAI_API_KEY")
client = OpenAI(api_key=OPENAI_API_KEY)

router = APIRouter()

@router.post("/api/palm-read")
async def read_palm_image(
    image: UploadFile = File(...),
    age: int = Form(...),
    gender: str = Form(...),
    dob: str = Form(...)
):
    img_bytes = await image.read()
    img_base64 = encode_image_to_base64(img_bytes)

    # Step 1: Analyze lines with Vision
    vision_response = client.chat.completions.create(
        model="gpt-4-vision-preview",
        messages=[
            {
                "role": "user",
                "content": [
                    {"type": "text", "text": generate_analysis_prompt()},
                    {"type": "image_url", "image_url": {"url": f"data:image/jpeg;base64,{img_base64}"}}
                ]
            }
        ],
        max_tokens=1000
    )

    line_summary = vision_response.choices[0].message.content

    # Step 2: Forecast prompt based on analysis
    forecast_response = client.chat.completions.create(
        model="gpt-4",
        messages=[
            {
                "role": "user",
                "content": generate_forecast_prompt(age, gender, dob, line_summary)
            }
        ],
        max_tokens=300
    )

    prediction = forecast_response.choices[0].message.content

    return JSONResponse({
        "lines": line_summary,
        "prediction": prediction
    }) 