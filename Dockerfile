FROM jupyter/tensorflow-notebook:022da74a0c8f
USER root
RUN apt update -y && apt install -y imagemagick pdf2svg poppler-utils
RUN pip install "spacy==1.9.0"
RUN pip install "inflection==0.3.1"
RUN pip install "psycopg2-binary==2.7.5"
RUN python -m spacy.en.download parser
RUN python -m spacy.de.download parser
RUN pip install gensim
RUN pip install git+git://github.com/mkrphys/ipython-tikzmagic.git
RUN pip install jupyter_nbextensions_configurator jupyter_contrib_nbextensions
RUN jupyter contrib nbextension install --user
RUN jupyter nbextensions_configurator enable --user
COPY IllustratedIntroductionToNeuralNetworks.ipynb /home/jovyan/work/IllustratedIntroductionToNeuralNetworks.ipynb
RUN mkdir -p /home/jovyan/.local/share/jupyter
RUN jupyter trust /home/jovyan/work/IllustratedIntroductionToNeuralNetworks.ipynb
RUN touch /home/jovyan/work/None0000000.png
RUN chmod -R a+rwx /home/jovyan
WORKDIR /home/jovyan/work
