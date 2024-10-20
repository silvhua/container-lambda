# https://docs.aws.amazon.com/lambda/latest/dg/python-image.html#python-image-base
FROM public.ecr.aws/lambda/python:3.12

# Copy requirements.txt
COPY requirements.txt ./helloWorld

# Install the specified packages
RUN pip install -r helloWorld/requirements.txt

# Copy function code
COPY app.py ./helloWorld

# Set the CMD to your handler (could also be done as a parameter override outside of the Dockerfile)
CMD [ "lambda_function.handler" ]