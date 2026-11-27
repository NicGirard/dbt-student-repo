{% macro learn_logging() %}
    {# Ajouter un commentaire jinja. Ce commentaire ne affiche pas lors de la compilation. #}
    {{ log("Hello world!" , info=True) }}

{% endmacro %}