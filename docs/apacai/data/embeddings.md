Embeddings in Swarms are multidimensional representations of text data. Embeddings carry semantic information, which makes them useful for extracting relevant chunks from large bodies of text for search and querying.

Swarms provides a way to build embedding drivers that are reused in downstream framework components. Every embedding driver has two basic methods that can be used to generate embeddings:

* `embed_text_artifact()` for `TextArtifact`s
* `embed_string()` for any string

!!! info
    More embedding drivers are coming soon.

## OpenAI Embeddings

This embedding driver uses [OpenAI Embeddings API](https://platform.openai.com/docs/guides/embeddings) to generate embeddings for texts of arbitrary length. This driver automatically chunks the input text to fit into the token limit.

The **OpenAiEmbeddingDriver** uses the following parameters:

| Parameter    | Description                                                                           | Required |
|--------------|---------------------------------------------------------------------------------------|----------|
| api_type     | Can be changed to use OpenAI models on Azure.                                         | NO       |
| api_version  | API version.                                                                          | NO       |
| api_base     | API URL.                                                                              | NO       |
| api_key      | API key to pass directly; by default uses `OPENAI_API_KEY_PATH` environment variable. | NO       |
| dimensions   | Vector dimensions. Default is `1536`.                                                 | NO       |
| model        | OpenAI embedding model name. Uses `text-embedding-ada-002` by default.                | NO       |
| organization | OpenAI organization.                                                                  | NO       |
| tokenizer    | Custom `TiktokenTokenizer`                                                            | NO       |
| user         | OpenAI user.                                                                          | NO       |

Here is how you can use it:

```python
from swarms.drivers import OpenAiEmbeddingDriver


OpenAiEmbeddingDriver().embed_string("Hello Swarms!")
```

Which will generate a 1536-dimensional embedding vector:

```
[0.0018219146877527237, 0.00609285244718194, -0.00580900302156806, ...]
```

## Azure OpenAI Embeddings

The **AzureOpenAiEmbeddingDriver** uses the same parameters as **OpenAiEmbeddingDriver** with updated defaults. In addition to those parameters, **AzureOpenAiEmbeddingDriver** has the following additional and modified parameters:

| Parameter     | Description                 | Required |
|---------------|-----------------------------|----------|
| api_base      | API URL.                    | YES      |
| deployment_id | Azure OpenAI deployment ID. | YES      |
| model         | OpenAI model name.          | YES      |