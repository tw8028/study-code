from openai import OpenAI
import os

def chat_with_seek():
    path = os.getenv('SEEK_API_KEY')
    client = OpenAI(api_key=path, base_url="https://api.deepseek.com")
    
    response = client.chat.completions.create(
        model="deepseek-chat",
        messages=[
            {"role": "system", "content": "You are a helpful assistant"},
            {"role": "user", "content": "hello"},
        ],
        stream=False
    )
    return response.choices[0].message.content