# Use a imagem base do Jupyter Notebook
FROM jupyter/minimal-notebook

# Atualize os pacotes e instale as bibliotecas necessárias
RUN conda update --all && \
  conda install --yes \
  numpy pandas matplotlib scikit-learn tensorflow jupyterlab

# Instale bibliotecas específicas para cada tópico
RUN conda install --yes \
  nltk

# Copie o notebook e arquivos relacionados para a pasta de trabalho
COPY notebooks /home/jovyan/work

# Defina a pasta de trabalho padrão
WORKDIR /home/jovyan/work

# Exponha a porta do Jupyter Notebook
EXPOSE 8888

# Comando para iniciar o Jupyter Notebook
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser"]
