# RAML 200 Tutorial

**Objective:** Once you’re familiar with the [basics of RAML](https://raml.org/developers/raml-100-tutorial), it's time to dig into the more complex features of the language itself and take full advantage of what RAML can offer.

**Introduction**

This tutorial will guide you through a complete use case for a jukebox API. You’ll learn how to optimize and reuse your code by applying concepts such as resourceTypes and traits, and RAML utilities such as !includes. The tutorial will also demonstrate how RAML uses schemas, and show how to use them to validate an HTTP body.

Please click [here](https://github.com/raml-org/raml-examples/tree/master/others/tutorial-jukebox-api), if you want to look at the complete RAML you will build in this tutorial.

**Assumptions**

You know the [basics of RAML](https://raml.org/developers/raml-100-tutorial): how to write a RAML file with resources, parameters, methods, and responses.

## USE CASE

Build a music Jukebox. While the physical device will be responsible for displaying the information and capturing the user input, it will be relying on your API to retrieve the information requested. The Jukebox needs to be able to:

- Show the full list of artists.
- Show the full list of albums.
- Show the list of artists by nationality.
- Show the list of albums by genre.
- Search for a song by title.
- Show a particular artist's albums collection.
- Show a particular album's songs list.
- Play a song (by specifying the song id).
- Enter new Artists, Albums and Songs (only authenticated users).

**Consideration:** This is a jukebox, not a command line. People in pubs might be unable to type lots of characters, so a user friendly UI (paging, image-based, etc) would be very appreciated.

## BASE RAML FILE

If you have read the [RAML 100 Tutorial](https://raml.org/developers/raml-100-tutorial), you should be able to understand our base RAML API definition without major difficulties. Its basic structure could be described as:

```
/songs:
  get:
  post:
  /{songId}:
    get:
    /file-content:
      get:
      post:
/artists:
  get:
  post:
  /{artistId}:
    get:
    /albums
      get:
/albums:
  get:
  post:
  /{albumId}:
    get:
    /songs:
      get:
```

As you can see in the following example, the resource "/songs" doesn't have a well defined POST: body parameters are missing.

```yaml
/songs:
  description: Collection of available songs in Jukebox
  get:
    description: Get a list of songs based on the song title.
    queryParameters:
      songTitle:
        description: "The title of the song to search (it is case insensitive and doesn't need to match the whole title)"
        required: true
        minLength: 3
        type: string
        example: "Get L"
    responses:
      200:
        body:
          application/json:
            example: |
              {
                "songs": [
                  {
                    "songId": "550e8400-e29b-41d4-a716-446655440000",
                    "songTitle": "Get Lucky"
                  },
                  {
                    "songId": "550e8400-e29b-41d4-a716-446655440111",
                    "songTitle": "Loose yourself to dance"
                  },
                  {
                    "songId": "550e8400-e29b-41d4-a716-446655440222",
                    "songTitle": "Gio sorgio by Moroder"
                  }
                ]
              }
  /{songId}:
    description: Song entity
    get:
      description: Get the song with `songId = {songId}`
      responses:
        200:
          body:
            application/json:
              example: |
                {
                  "songId": "550e8400-e29b-41d4-a716-446655440000",
                  "songTitle": "Get Lucky",
                  "duration": "6:07",
                  "artist": {
                    "artistId": "110e8300-e32b-41d4-a716-664400445500"
                    "artistName": "Daft Punk",
                    "imageURL": "http://travelhymns.com/wp-content/uploads/2013/06/random-access-memories1.jpg"
                  },
                  "album": {
                    "albumId": "183100e3-0e2b-4404-a716-66104d440550",
                    "albumName": "Random Access Memories",
                    "imageURL": "http://upload.wikimedia.org/wikipedia/en/a/a7/Random_Access_Memories.jpg"
                  }
                }
        404:
          body:
            application/json:
              example: |
                {"message": "Song not found"}
    /file-content:
      description: The file to be reproduced by the client
      get:
        description: Get the file content
        responses:
          200:
      post:
  post:
```

## BODY PARAMETERS

**Form Parameters**

There are several ways of defining the body parameters for an HTTP method. For example:

```yaml
/file-content:
  description: The file to be reproduced by the client
  get:
    description: Get the file content
    responses:
      200:
        body:
          binary/octet-stream:
            example: !include heybulldog.mp3
  post:
    description: |
      Enters the file content for an existing song entity.

      Use the "binary/octet-stream" content type to specify the content from any consumer (excepting web-browsers).
      Use the "multipart-form/data" content type to upload a file which content will become the file-content
    body:
      binary/octet-stream:
      multipart/form-data:
        properties:
          file:
            description: The file to be uploaded
            required: true
            type: file
```

`/file-content` resource represents the file to reproduce when a Jukebox user selects a particular song, although, there are tons of ways of modeling this scenario on a RESTful API. We've chosen this one for this tutorial purposes. It doesn't mean it's a best practice at all.

As you can see in the POST definition, its body contains two possible content-types. The `binary/octet-stream` simply expects `file-content` to be sent as a parameter. It's a valid and popular technique for APIs that supporting files. Unfortunately, it makes the API impossible to call from a web browser (at least with the purpose of uploading a file).

For the `multipart/form-data` (and also the `application/x-www-form-urlencoded`), it is possible to define a map of form parameters, defining this map the same way that the rest of the RAML ones (in this case, the "file" field is required and of type "file").

**Schemas**

A body also can be of `application/json` content-type (among others, like `application/xml`) and for these, the expected body parameter will be a string with a valid JSON (or XML). So, this is another way of defining a method's body parameter. One of the RAML supported features is the possibility of defining schemas and apply these to the body parameters as well, as shown in the example below.

```yaml
body:
  application/json:
    type: |
      {
        "type": "object",
        "$schema": "http://json-schema.org/draft-03/schema",
        "id": "http://jsonschema.net",
        "required": true,
        "properties": {
          "songTitle": {
            "type": "string",
            "required": true
          },
          "albumId": {
            "type": "string",
            "required": true,
            "minLength": 36,
            "maxLength": 36
          }
        }
      }
    example: |
      {
        "songId": "550e8400-e29b-41d4-a716-446655440000",
        "songTitle": "Get Lucky",
        "albumId": "183100e3-0e2b-4404-a716-66104d440550"
      }
```

What the example is basically saying is: "The expected parameter is a valid json, and for valid, it needs to fulfill the specified schema definition". In this case, the represented object has:

- "songTitle" property of type "string", and it's required
- "albumId" property of type "string", and not only is it required, but it also needs to be 36 characters long.

It's not the intention of this tutorial explain how JSON and XML schemas work, but you can learn more at <http://json-schema.org/> and [http://www.w3.org/XML/Schema.html](http://json-schema.org/).

## EXTRACT SCHEMAS

One interesting RAML feature is the ability to extract the schemas and reference them by name. There are three major advantages of doing this, and the first two might look a bit obvious:

- Improve RAML readability
- Allow reusing the schemas in several sections.

The third advantage will become clear in following sections, when trying to use "resource types" and parameterize these.

```yaml
types:
  song: |
    {
      "type": "object",
      "$schema": "http://json-schema.org/draft-03/schema",
      "id": "http://jsonschema.net",
      "required": true,
      "properties": {
        "songTitle": {
          "type": "string",
          "required": true
        },
        "albumId": {
          "type": "string",
          "required": true,
          "minLength": 36,
          "maxLength": 36
        }
      }
    }
body:
  application/json:
    type: song
    example: |
      {
        "songId": "550e8400-e29b-41d4-a716-446655440000",
        "songTitle": "Get Lucky",
        "albumId": "183100e3-0e2b-4404-a716-66104d440550"
      }
```

As you can see in the code example, the schema described in previous sections is now being defined and referenced by the name "song". The name choice is not random, and the correct convention will allow you to parameterize resource types and reuse a lot of code (this will be explained in following sections).

## RESOURCE TYPES

**The "collection/collection-item" pattern**

**We are definitively not saying that all RESTful APIs are the same.** I don’t want to even suggest it. But there are absolutely some common behaviors. For example, if we are trying to represent resources that could be inferred from a business model, it will likely be analogous with the CRUD model. Given a resource, you can **c**reate a new one, **r**etrieve one or all of them and **u**pdate or **d**elete an existing one.

In that sense, we can easily identify an existing resource (to be fetched, deleted or updated), a new one (to be added to a collection) and the collection itself (to be retrieved).

```yaml
#%RAML 1.0
  title:

  /resources:
    get:
    post:
    /{resourceId}:
      get:
      put:
      delete:
```

So, we found two different type of resources. The item (represented by an id), and the collection (containing all the items). It would be nice to be able to define these types, and declare the resources of those types. Luckily, there is a way to do this in RAML. **Resource Types in RAML**

Similar to the last example code, where we only showed the resources and supported methods, this step consists in just creating the "resourceTypes" with their supported methods.

```yaml
resourceTypes:
  collection:
    get:
    post:
  collection-item:
    get:
```

As you may notice, the PUT and DELETE methods are not defined for the collection-item resourceType. This is basically because the use case does not request any resource to be deleted or updated. So, what this version is saying is "There are two resource types: collection, which has the GET and POST methods defined, and collection-item which has the GET method defined". Standing alone, it doesn't really seem to be very useful. However, it's important to understand as the first step of defining good resourceTypes and reusing patterns in the code.

**Defining and parameterizing resourceTypes**

What do we know about our collections thus far? Let's check what "/songs", "/artists", and "/albums" have in common:

- Description
- GET method with:
  - description
  - response for HTTP status 200 (which body's content type is "application/json")
- POST method with:
  - description
  - "access_token" queryParameter
  - bodyParameter with "application/json" contentType and validated by a Schema
  - response with HTTP status 200 (which body's content type is "application/json")

So, let's extract this from one of the resources (I will take "/songs" for this example, but we will end up parameterizing the resourceType, so it doesn't matter which one you choose to start).

```yaml
resourceTypes:
  collection:
    description: Collection of available songs in Jukebox
    get:
      description: Get a list of songs based on the song title.
      responses:
        200:
          body:
            application/json:
    post:
      description: |
        Add a new song to Jukebox.
      queryParameters:
        access_token:
          description: "The access token provided by the authentication application"
          example: AABBCCDD 
          required: true
          type: string
      body:
        application/json:
          type: song
      responses:
        200:
          body:
            application/json:
              example: |
                { "message": "The song has been properly entered" }
```

With the `collection` resourceType as it is right now, there is not much we can do. Applying it to the `/songs` resource is a possibility, but we don't want those descriptions, schemas, or even the POST response to be applied to all the resources since the collection is specific to `/songs`. Parameters are useful here. Suppose that you can write a "placeholder" on the resourceType to be filled with a value specified on the resource. For instance:

```
description: Collection of available <<resource>> in Jukebox
```

with `<<resource>>` receiving "songs", "artists", or "albums" depending on the resource.

While this is possible (and very useful for most scenarios), for this particular case it's not necessary for the resource to even pass the parameter thanks to **Reserved Parameters**.

A Reserved Parameter simply is a parameter with a value automatically specified by its context. For the resourceTypes case, there are two Reserved Parameters: resourcePath and resourcePathName. For the `/songs` example, the values will be "/songs" and "songs" respectively.

Now, if you are looking at the last code snippet, you will realize that we need the values to be "songs" in some cases and "song" in others. Here is where **Parameters Transformers** become handy.

There are two Parameters Transformers we could use for this example: `!singularize` and `!pluralize` (note: The only locale supported by the current version of RAML is "United States English").

So combining this, let's update our latest code snippet:

```yaml
resourceTypes:
  collection:
    description: Collection of available <<resourcePathName>> in Jukebox
    get:
      description: Get a list of <<resourcePathName>> based on the song title.
      responses:
        200:
          body:
            application/json:
    post:
      description: |
        Add a new <<resourcePathName|!singularize>> to Jukebox.
      queryParameters:
        access_token:
          description: "The access token provided by the authentication application"
          example: AABBCCDD 
          required: true
          type: string
      body:
        application/json:
          type: <<resourcePathName|!singularize>>
      responses:
        200:
          body:
            application/json:
              example: |
                { "message": "The <<resourcePathName|!singularize>> has been properly entered" }
/songs:
  type: collection
  get:
    queryParameters:
      songTitle:
        description: "The title of the song to search (it is case insensitive and doesn't need to match the whole title)"
        required: true
        minLength: 3
        type: string
        example: "Get L"
    responses:
      200:
        body:
          application/json:
            example: |
              {
                "songs": [
                  {
                    "songId": "550e8400-e29b-41d4-a716-446655440000",
                    "songTitle": "Get Lucky"
                  },
                  {
                    "songId": "550e8400-e29b-41d4-a716-446655440111",
                    "songTitle": "Loose yourself to dance"
                  },
                  {
                    "songId": "550e8400-e29b-41d4-a716-446655440222",
                    "songTitle": "Gio sorgio by Moroder"
                  }
                ]
              }
  post:
    body:
      application/json:
        example: |
          {
            "songId": "550e8400-e29b-41d4-a716-446655440000",
            "songTitle": "Get Lucky",
            "albumId": "183100e3-0e2b-4404-a716-66104d440550"
          }
```

Note that even the Schema name is specified with this parameter (singular in this case). We mentioned before that the schema name was not random - this is why. Another important aspect to stress is that defining and applying a resourceType to a resource doesn't forbid you from overwriting any of the map's elements. In this example, we still see that GET method is present in both, resource and resourceType (the same for the responses, POST, etc). Not only is this allowed, but also is the way of redefining something that changes from one resource to other. **If you think this looks like OOP inheritance, you’re right!**

Now, let's work with the "collection-item" resourceType.

There is nothing new with this code. More resourceType definitions, parameterization, and usage:

```yaml
collection-item:
  description: Entity representing a <<resourcePathName|!singularize>>
  get:
    description: |
      Get the <<resourcePathName|!singularize>>
      with <<resourcePathName|!singularize>>Id =
      {<<resourcePathName|!singularize>>Id}
    responses:
      200:
        body:
          application/json:
      404:
        body:
          application/json:
            example: |
              {"message": "<<resourcePathName|!singularize>> not found" }
/songs:
  ...
  /{songId}:
    type: collection-item
    get:
      responses:
        200:
          body:
            application/json:
              example: |
                {
                  "songId": "550e8400-e29b-41d4-a716-446655440000",
                  "songTitle": "Get Lucky",
                  "duration": "6:07",
                  "artist": {
                    "artistId": "110e8300-e32b-41d4-a716-664400445500"
                    "artistName": "Daft Punk",
                    "imageURL": "http://travelhymns.com/wp-content/uploads/2013/06/random-access-memories1.jpg"
                  },
                  "album": {
                    "albumId": "183100e3-0e2b-4404-a716-66104d440550",
                    "albumName": "Random Access Memories",
                    "imageURL": "http://upload.wikimedia.org/wikipedia/en/a/a7/Random_Access_Memories.jpg"
                  }
                }
```

But as you can see, we are still repeating lot of code. Specifically:

```yaml
get:
  responses:
    200:
      body:
        application/json:
          example: |
```

Basically, every piece of code needed to define the **examples**. And this is basically because we have only learned how to use Reserved Parameters. However, we have also mentioned that the idea of parameterizing is to specify "placeholder" to be filled with a specified value. That would solve our "examples problem".

## PARAMETERS

At the moment of defining the parameter in the resourceType (with the placeholder), there is no difference between a parameter and a reserved parameter. The actual difference only appears when passing the parameter at the resource level. For instance, a parameter named as `exampleItem` will need to be passed this way:

```yaml
/{songId}:
  type:
    collection-item:
      exampleItem: THIS IS THE EXAMPLE
```

In "human language", it's basically saying that `/{songId}` resource is of `collection-item` type. But now, it's also indicating that the value for the `collection-item` parameter `exampleItem` is "THIS IS THE EXAMPLE". Since this is a string, all the YAML rules for strings are valid. Having said that, let's take a look at some relevant code pieces.

```yaml
resourceTypes:
  collection:
    description: Collection of available <<resourcePathName>> in Jukebox
    get:
      description: Get a list of <<resourcePathName>> based on the song title.
      responses:
        200:
          body:
            application/json:
    post:
      description: |
        Add a new <<resourcePathName|!singularize>> to Jukebox.
      queryParameters:
        access_token:
          description: "The access token provided by the authentication application"
          example: AABBCCDD 
          required: true
          type: string
      body:
        application/json:
          type: <<resourcePathName|!singularize>>
      responses:
        200:
          body:
            application/json:
              example: |
                { "message": "The <<resourcePathName|!singularize>> has been properly entered" }
  collection-item:
    description: Entity representing a <<resourcePathName|!singularize>>
    get:
      description: |
        Get the <<resourcePathName|!singularize>>
        with <<resourcePathName|!singularize>>Id =
        {<<resourcePathName|!singularize>>Id}
      responses:
        200:
          body:
            application/json:
        404:
          body:
            application/json:
              example: |
                {"message": "<<resourcePathName|!singularize>> not found" }
/songs:
  type:
    collection:
      exampleCollection: |
        [
          {
            "songId": "550e8400-e29b-41d4-a716-446655440000",
            "songTitle": "Get Lucky"
          },
          {
            "songId": "550e8400-e29b-41d4-a716-446655440111",
            "songTitle": "Loose yourself to dance"
          },
          {
            "songId": "550e8400-e29b-41d4-a716-446655440222",
            "songTitle": "Gio sorgio by Morodera"
          }
        ]
      exampleItem: |
        {
          "songId": "550e8400-e29b-41d4-a716-446655440000",
          "songTitle": "Get Lucky",
          "albumId": "183100e3-0e2b-4404-a716-66104d440550"
        }
  get:
    queryParameters:
      songTitle:
        description: "The title of the song to search (it is case insensitive and doesn't need to match the whole title)"
        required: true
        minLength: 3
        type: string
        example: "Get L"
  /{songId}:
    type:
      collection-item:
        exampleItem: |
          {
            "songId": "550e8400-e29b-41d4-a716-446655440000",
            "songTitle": "Get Lucky",
            "duration": "6:07",
            "artist": {
              "artistId": "110e8300-e32b-41d4-a716-664400445500"
              "artistName": "Daft Punk",
              "imageURL": "http://travelhymns.com/wp-content/uploads/2013/06/random-access-memories1.jpg"
            },
            "album": {
              "albumId": "183100e3-0e2b-4404-a716-66104d440550",
              "albumName": "Random Access Memories",
              "imageURL": "http://upload.wikimedia.org/wikipedia/en/a/a7/Random_Access_Memories.jpg"
            }
          }
```

As you can see, the same concept shown in the previous example was applied to both the `/songs`, and `/songs/{songId}`resources. In a previous example, the code that was repeated at the end and is now completely within the resourceType at the point that the POST definition directly disappeared from the resources. **That's correct. Now, every collection-item typed resources will have a valid (generic) POST definition without you ever writing it.**

## INCLUDES

We have improved our RAML definition a lot during the last step with resourceTypes. We were able to extract common components of the resources and encapsulate these with a structure that grants inheritance-like capabilities.

Nevertheless, the RAML file still contains lot of information that could be considered as "not API-describing". Sort of "economy-class" members, if you will. **Equally important, but not necessarily part of the main RAML file**.

Through `!includes`, RAML allows us to build file-distributed API definitions, which is not only useful to encourage code reuse but also improves readability.

Here, we will extract the examples used for `/songs` resource to different files and include these in the main RAML definition.

```json
{
  "songId": "550e8400-e29b-41d4-a716-446655440000",
  "songTitle": "Get Lucky",
  "albumId": "183100e3-0e2b-4404-a716-66104d440550"
}
{
  "songId": "550e8400-e29b-41d4-a716-446655440000",
  "songTitle": "Get Lucky",
  "duration": "6:07",
  "artist": {
    "artistId": "110e8300-e32b-41d4-a716-664400445500"
    "artistName": "Daft Punk",
    "imageURL": "http://travelhymns.com/wp-content/uploads/2013/06/random-access-memories1.jpg"
  },
  "album": {
    "albumId": "183100e3-0e2b-4404-a716-66104d440550",
    "albumName": "Random Access Memories",
    "imageURL": "http://upload.wikimedia.org/wikipedia/en/a/a7/Random_Access_Memories.jpg"
  }
}
[
  {
    "songId": "550e8400-e29b-41d4-a716-446655440000",
    "songTitle": "Get Lucky"
  },
  {
    "songId": "550e8400-e29b-41d4-a716-446655440111",
    "songTitle": "Loose yourself to dance"
  },
  {
    "songId": "550e8400-e29b-41d4-a716-446655440222",
    "songTitle": "Gio sorgio by Morodera"
  }
]
```

As you can see, the extracted files contain raw strings. It's important to stress that every included file is treated as a string by RAML, which presents some well known restrictions regarding how to distribute the definition among files. More than limitations, these restrictions attempt to define a common way to work with !includes and avoid free-form defined APIs. Remember that one of RAML’s major goals is to unify criteria and encourage best-practices. The following code snippet shows how to include or "call" the extracted files from the main definition.

```yaml
/songs:
  type:
    collection:
      exampleCollection: !include jukebox-include-songs.sample
      exampleItem: !include jukebox-include-song-new.sample
  /{songId}:
    type:
      collection-item:
        exampleItem: !include jukebox-include-song-retrieve.sample
```

As shown in the last snippet, RAML features encourage you to reduce the quantity of code you write, while making it more reusable and maintainable.

## REFACTOR

We have introduced several features and made great progress with our API definition, but aren't we missing something? We have just focused on the "/songs" resource (and its descending branch). If you check your RAML file right now, you will discover that all other resources are still not taking advantage of the work we have done. Let's solve that right now! Repeat the same procedures for all the resources:

- identify and apply the collection and collection-item pattern
- pass the correct parameters
- extract the belonging examples into separated files

As you might notice, the quantity of lines in the RAML file has been significantly reduced and there are more files than before. Most important: It's visibly simpler! But not everything went so smoothly. If you look carefully, there is a problem with sub-collections (`/artists/{artistId}/albums` and `/albums/{albumId}/songs`). Since these aren't the main collections of each resource, we decided not to allow new elements to be created on them. In other words, these collections were READ-ONLY. When applying the `collection` resourceType, we also automatically added the "POST" method. As an additional consequence, the RAML definition now requires the `exampleItem` parameter to be passed for those resources too (which we have temporarily resolved by passing `{}`).

```yaml
/artists:
  /{artistId}:
    /albums:
      type:
        collection:
          exampleCollection: !include jukebox-include-artist-albums.sample
          exampleItem: {}
      description: Collection of albulms belonging to the artist
      get:
        description: Get a specific artist's albums list
```

While that's awkward, it’s not a big deal and it will actually help us go further in order to solve it.

Let's create another resourceType called `readOnlyCollection`. It will be similar to `collection` but without the "POST method". And let's apply this new resourceType to its corresponding collections: `artists/{artistId}/albums` and `/albums/{albumId}/songs`:

```yaml
readOnlyCollection:
  description: Collection of available <<resourcePathName>> in Jukebox.
  get:
    description: Get a list of <<resourcePathName>>.
    responses:
      200:
        body:
          application/json:
            example: |
              <<exampleCollection>>
/artists:
  /{artistId}:
    /albums:
      type:
        readOnlyCollection:
          exampleCollection: !include jukebox-include-artist-albums.sample
      description: Collection of albums belonging to the artist
      get:
    description: Get a specific artist's albums list
/albums:
  /{albumId}:
    /songs:
      type:
        readOnlyCollection:
          exampleCollection: !include jukebox-include-album-songs.sample
      get:
        description: Get the list of songs for the album with `albumId = {albumId}`
```

If you are following the code in detail, you will have already noticed something: `collection` and `readOnlyCollection`resourceTypes are repeating some code. Actually, `readOnlyCollection` code is completely included in `collection` code. That’s correct! And there is a way of making this even more efficient. It's all about "types composing" and it will be totally covered in a later tutorial.

## TRAITS

We are almost done! We are busy fulfilling all the requirements for the described use case. As usual however, we’ve discovered something while building, and this tutorial cannot be the exception. Will I be able to sort my collections? Shouldn't my API give users the chance of paging these? Is the strategy we chose for searching a collection good enough? What if we need to enhance and make more complex queries in the future? Let's tackle these issues. But first, we need to understand them correctly

**Understanding our resources**

Let's build a simple table to discover and agree about each collection capabilities:

| Collection/Capabilities | Searchable | Sorteable | Pageable |
| ----------------------- | ---------- | --------- | -------- |
| `/songs`                | YES        | YES       | YES      |
| `/artists`              | YES        | YES       | YES      |
| `/albums`               | YES        | YES       | YES      |
| `/artists/{aId}/albums` | NO         | YES       | YES      |
| `/albums/{aId}/songs`   | NO         | YES       | NO       |

If we consider who will be consuming the API, this table would probably look very different (small collections can be filtered, ordered and paged on the client side). For the purposes of this tutorial, we are keeping it anyway.

**Fixing the Searchable collections**

Before getting involved with the Traits concept, let's enhance the Searchable fixed parameters by applying a generic "query" queryParameter.

```yaml
/songs:
  type:
    collection:
      exampleCollection: !include jukebox-include-songs.sample
      exampleItem: !include jukebox-include-song-new.sample
  get:
    queryParameters:
      songTitle:
        description: "The title of the song to search (it is case insensitive and doesn't need to match the whole title)"
        required: true
        minLength: 3
        type: string
        example: "Get L"
/songs:
  type:
    collection:
      exampleCollection: !include jukebox-include-songs.sample
      exampleItem: !include jukebox-include-song-new.sample
  get:
    queryParameters:
      query:
        description: |
          JSON array [{"field1","value1","operator1"},{"field2","value2","operator2"},...,{"fieldN","valueN","operatorN"}] with valid searchable fields: songTitle
        example: |
          ["songTitle", "Get L", "like"]
```

**Searchable Trait**

The same way that several resources might utilize a specific resourceType, it's possible to define and reuse similar behavior with traits. This is one of these concepts that are better explained by code:

```yaml
/songs:
  type:
    collection:
      exampleCollection: !include jukebox-include-songs.sample
      exampleItem: !include jukebox-include-song-new.sample
  get:
    queryParameters:
      query:
        description: |
          JSON array [{"field1","value1","operator1"},{"field2","value2","operator2"},...,{"fieldN","valueN","operatorN"}] with valid searchable fields: songTitle
        example: |
          ["songTitle", "Get L", "like"]
traits:
  searchable:
    queryParameters:
      query:
        description: |
          JSON array [{"field1","value1","operator1"},{"field2","value2","operator2"},...,{"fieldN","valueN","operatorN"}] <<description>>
        example: |
          <<example>>
```

As you can see, this Searchable trait is comprised of a name and an applicable parameter. It is also evident in the example above that traits can be parameterized. Let's check how the trait can be applied to a method:

```yaml
/songs:
  type:
    collection:
      exampleCollection: !include jukebox-include-songs.sample
      exampleItem: !include jukebox-include-song-new.sample
  get:
    is: [searchable: {description: "with valid searchable fields: songTitle", example: "[\"songTitle\", \"Get L\", \"like\"]"}]
```

So, what the definition is really saying is that there is a trait called "Searchable" and that the "/songs" resource utilizes it. Furthermore, the trait is applied to the GET method itself, since the "Searchable" contract should only be applied to that particular method. In other cases, you could apply a trait to the whole resource, and even more: **traits can also be applied to resourceTypes.** This topic should and will be covered in a separate tutorial (types composition). Feel free to try this out anyway, and always remember that you can:

Note that we have already applied the Searchable trait to `/songs`, `/artists` and `/albums` resources.

**Other traits**

Considering our table, we need to create 2 additional traits: Orderable and Pageable. The creation is trivial, and when applied we confirm something that you might have noticed during the previous step: traits are a collection (that's why they are applied within an array).

```yaml
orderable:
  queryParameters:
    orderBy:
      description: |
        Order by field: <<fieldsList>>
      type: string
      required: false
    order:
      description: Order
      enum: [desc, asc]
      default: desc
      required: false
pageable:
  queryParameters:
    offset:
      description: Skip over a number of elements by specifying an offset value for the query
      type: integer
      required: false
      example: 20
      default: 0
    limit:
      description: Limit the number of elements on the response
      type: integer
      required: false
      example: 80
      default: 10
/songs:
  type:
    collection:
      exampleCollection: !include jukebox-include-songs.sample
      exampleItem: !include jukebox-include-song-new.sample
  get:
    is: [
      searchable: {description: "with valid searchable fields: songTitle", example: "[\"songTitle\", \"Get L\", \"like\"]"},
      orderable: {fieldsList: "songTitle"},
      pageable
    ]
```

In this case, you can see that the "Pageable" trait receives no parameter.

Go ahead! Apply the proper traits to the proper resources as we defined in the table.

## FINAL TUNING

We could say that our RAML file has been properly refactored and is now much more readable, reusable, and maintainable. Maybe a last step would be to double-check which parts of the RAML definition could now be extracted to other files (the same way we have done with the "examples"). Starting at the root, we find the schemas, and it seems a no-brainer that each JSON (in this case) could be extracted and included as we have learned.

```yaml
types:
  song: !include jukebox-include-song.schema
  artist: !include jukebox-include-artist.schema
  album: !include jukebox-include-album.schema
```

and of course, three new files will appear in your file system.

While this doesn't seem to be a revelation (it isn't), let's keep checking our RAML file to discover what else can be extracted. Honestly, resourceTypes and traits are really tempting. But if you try to follow the same strategy, you will surely fail. Remember in previous sections that we explained that the `!include` function would just take the content of the file and embed its contents as a string? That’s precisely what we wanted to do with the examples and the schemas. However, if we look at the resourceTypes and traits again, we will notice that they are not just strings, but maps (just like the rest of the RAML file). So basically, NO! You CANNOT extract these with the same approach you used to extract examples and schemas.

However, you could extract all the resourceTypes to a file (and do the same with the traits).

```
resourceTypes: !include jukebox-includes-resourceTypes.inc
```

While this is not a restriction, it’s good to note it doesn't mean it's a recommended practice. In some cases, you will need to compromise. For example: if we had 2000 lines of resourceTypes definition, we probably would like to extract this to a separate file. But if the resourceTypes are not really complicating the readability, it could also be nice to be able to see how they are defined without going to an external file. As usual, it's a matter of good judgment.

## CONCLUSION

In this tutorial, we learned how to optimize our RAML file from a code reuse and maintainability point of view, Traits, resourceTypes, and includes were introduced and a full use case was developed and refactored.

Finally, just like in every discipline, we need to use good judgment. Always remember that over engineering is never a good idea. Ever.



# RAML 200教程

**目标：**一旦熟悉了[RAML](https://raml.org/developers/raml-100-tutorial)的[基础知识](https://raml.org/developers/raml-100-tutorial)，就应该深入研究语言本身更复杂的功能，并充分利用RAML可以提供的功能。

**介绍**

本教程将指导您完成光盘机API的完整用例。您将学习如何通过应用诸如resourceTypes和traits之类的概念以及诸如！includes之类的RAML实用程序来优化和重用代码。本教程还将演示RAML如何使用模式，并展示如何使用它们来验证HTTP主体。

如果您想查看本教程中将构建的完整RAML，请单击[此处](https://github.com/raml-org/raml-examples/tree/master/others/tutorial-jukebox-api)。

**假设**

您了解[RAML](https://raml.org/developers/raml-100-tutorial)的[基础知识](https://raml.org/developers/raml-100-tutorial)：如何使用资源，参数，方法和响应编写RAML文件。

## 使用案例

建立一个音乐Jukebox。虽然物理设备将负责显示信息并捕获用户输入，但它将依靠您的API来检索所请求的信息。点唱机需要能够：

- 显示完整的艺术家列表。
- 显示完整的专辑列表。
- 按国籍显示艺术家名单。
- 按流派显示专辑列表。
- 按标题搜索歌曲。
- 显示特定艺术家的专辑集合。
- 显示特定专辑的歌曲列表。
- 播放歌曲（通过指定歌曲ID）。
- 输入新的艺术家，专辑和歌曲（仅限经过身份验证的用户）。

**考虑因素：**这是一个自动点唱机，而不是命令行。酒吧中的人可能无法输入大量字符，因此非常感谢用户友好的UI（分页，基于图像等）。

## 基础RAML文件

如果您已经阅读了[RAML 100教程](https://raml.org/developers/raml-100-tutorial)，那么您应该能够理解我们的基本RAML API定义，而不会遇到重大困难。其基本结构可描述为：

```
/songs:
  get:
  post:
  /{songId}:
    get:
    /file-content:
      get:
      post:
/artists:
  get:
  post:
  /{artistId}:
    get:
    /albums
      get:
/albums:
  get:
  post:
  /{albumId}:
    get:
    /songs:
      get:
```

正如您在下面的示例中所看到的，资源“/ songs”没有明确定义的POST：缺少body参数。

```yaml
/songs:
  description: Collection of available songs in Jukebox
  get:
    description: Get a list of songs based on the song title.
    queryParameters:
      songTitle:
        description: "The title of the song to search (it is case insensitive and doesn't need to match the whole title)"
        required: true
        minLength: 3
        type: string
        example: "Get L"
    responses:
      200:
        body:
          application/json:
            example: |
              {
                "songs": [
                  {
                    "songId": "550e8400-e29b-41d4-a716-446655440000",
                    "songTitle": "Get Lucky"
                  },
                  {
                    "songId": "550e8400-e29b-41d4-a716-446655440111",
                    "songTitle": "Loose yourself to dance"
                  },
                  {
                    "songId": "550e8400-e29b-41d4-a716-446655440222",
                    "songTitle": "Gio sorgio by Moroder"
                  }
                ]
              }
  /{songId}:
    description: Song entity
    get:
      description: Get the song with `songId = {songId}`
      responses:
        200:
          body:
            application/json:
              example: |
                {
                  "songId": "550e8400-e29b-41d4-a716-446655440000",
                  "songTitle": "Get Lucky",
                  "duration": "6:07",
                  "artist": {
                    "artistId": "110e8300-e32b-41d4-a716-664400445500"
                    "artistName": "Daft Punk",
                    "imageURL": "http://travelhymns.com/wp-content/uploads/2013/06/random-access-memories1.jpg"
                  },
                  "album": {
                    "albumId": "183100e3-0e2b-4404-a716-66104d440550",
                    "albumName": "Random Access Memories",
                    "imageURL": "http://upload.wikimedia.org/wikipedia/en/a/a7/Random_Access_Memories.jpg"
                  }
                }
        404:
          body:
            application/json:
              example: |
                {"message": "Song not found"}
    /file-content:
      description: The file to be reproduced by the client
      get:
        description: Get the file content
        responses:
          200:
      post:
  post:
```

## 身体参数

**表格参数**

有几种方法可以为HTTP方法定义body参数。例如：

```yaml
/file-content:
  description: The file to be reproduced by the client
  get:
    description: Get the file content
    responses:
      200:
        body:
          binary/octet-stream:
            example: !include heybulldog.mp3
  post:
    description: |
      Enters the file content for an existing song entity.

      Use the "binary/octet-stream" content type to specify the content from any consumer (excepting web-browsers).
      Use the "multipart-form/data" content type to upload a file which content will become the file-content
    body:
      binary/octet-stream:
      multipart/form-data:
        properties:
          file:
            description: The file to be uploaded
            required: true
            type: file
```

`/file-content`资源表示当Jukebox用户选择特定歌曲时要重现的文件，尽管有很多方法可以在RESTful API上对此场景进行建模。我们选择这个用于本教程目的。这并不意味着它是一种最佳实践。

正如您在POST定义中所看到的，它的主体包含两种可能的内容类型。在`binary/octet-stream`简单地预计`file-content`发送作为参数。对于支持文件的API，它是一种有效且流行的技术。不幸的是，它使得无法从Web浏览器调用API（至少是为了上传文件）。

对于`multipart/form-data`（以及`application/x-www-form-urlencoded`），可以定义表单参数的映射，定义此映射的方式与RAML的其余部分相同（在这种情况下，“file”字段是必需的，类型为“file”） ）。

**架构**

正文也可以是`application/json`内容类型（等等`application/xml`），对于这些，预期的body参数将是具有有效JSON（或XML）的字符串。因此，这是定义方法的body参数的另一种方法。RAML支持的功能之一是定义模式并将其应用于body参数的可能性，如下面的示例所示。

```yaml
body:
  application/json:
    type: |
      {
        "type": "object",
        "$schema": "http://json-schema.org/draft-03/schema",
        "id": "http://jsonschema.net",
        "required": true,
        "properties": {
          "songTitle": {
            "type": "string",
            "required": true
          },
          "albumId": {
            "type": "string",
            "required": true,
            "minLength": 36,
            "maxLength": 36
          }
        }
      }
    example: |
      {
        "songId": "550e8400-e29b-41d4-a716-446655440000",
        "songTitle": "Get Lucky",
        "albumId": "183100e3-0e2b-4404-a716-66104d440550"
      }
```

该示例基本上是说：“期望参数是有效的json，并且对于有效，它需要满足指定的模式定义”。在这种情况下，表示的对象具有：

- “字符串”类型的“songTitle”属性，它是必需的
- “stringId”类型的“albumId”属性，不仅是必需的，而且还需要36个字符长。

本教程的目的不是解释JSON和XML模式的工作原理，但您可以在<http://json-schema.org/>和[http://www.w3.org/XML/Schema.html上](http://json-schema.org/)了解更多[信息](http://json-schema.org/)。

## 提取方案

一个有趣的RAML功能是提取模式并按名称引用它们的能力。这样做有三个主要优点，前两个可能看起来有点明显：

- 提高RAML可读性
- 允许在几个部分中重用模式。

当尝试使用“资源类型”并参数化这些时，第三个优点将在以下部分中变得清晰。

```yaml
types:
  song: |
    {
      "type": "object",
      "$schema": "http://json-schema.org/draft-03/schema",
      "id": "http://jsonschema.net",
      "required": true,
      "properties": {
        "songTitle": {
          "type": "string",
          "required": true
        },
        "albumId": {
          "type": "string",
          "required": true,
          "minLength": 36,
          "maxLength": 36
        }
      }
    }
body:
  application/json:
    type: song
    example: |
      {
        "songId": "550e8400-e29b-41d4-a716-446655440000",
        "songTitle": "Get Lucky",
        "albumId": "183100e3-0e2b-4404-a716-66104d440550"
      }
```

正如您在代码示例中所看到的，现在正在定义前面部分中描述的模式，并通过名称“song”进行引用。名称选择不是随机的，正确的约定将允许您参数化资源类型并重用大量代码（这将在以下部分中解释）。

## 资源类型

**“收集/收集项目”模式**

**我们绝对不是说所有RESTful API都是一样的。**我甚至不想暗示它。但绝对有一些共同的行为。例如，如果我们试图表示可以从业务模型推断出的资源，那么它可能与CRUD模型类似。给定一个资源，你可以**ç** reate一个新的，**[R** etrieve一个或所有这些，**ü**PDATE或**ð** elete现有之一。

从这个意义上讲，我们可以轻松识别现有资源（要获取，删除或更新），新资源（要添加到集合中）和集合本身（要检索）。

```yaml
#%RAML 1.0
  title:

  /resources:
    get:
    post:
    /{resourceId}:
      get:
      put:
      delete:
```

所以，我们发现了两种不同类型的资源。项目（由id表示）和集合（包含所有项目）。能够定义这些类型并声明这些类型的资源会很好。幸运的是，在RAML中有一种方法可以做到这一点。**RAML中的资源类型**

与上一个示例代码类似，我们只显示了资源和支持的方法，此步骤仅包括使用其支持的方法创建“resourceTypes”。

```yaml
resourceTypes:
  collection:
    get:
    post:
  collection-item:
    get:
```

您可能会注意到，未为collection-item resourceType定义PUT和DELETE方法。这基本上是因为用例不请求删除或更新任何资源。所以，这个版本所说的是“有两种资源类型：集合，它定义了GET和POST方法，集合项目定义了GET方法”。单独站立，它似乎并不是非常有用。但是，理解作为在代码中定义良好的resourceTypes和重用模式的第一步非常重要。

**定义和参数化resourceTypes**

到目前为止，我们对收藏品了解多少？让我们看一下“/ songs”，“/ artists”和“/ albums”的共同点：

- 描述
- GET方法：
  - 描述
  - HTTP状态200的响应（主体的内容类型是“application / json”）
- POST方法：
  - 描述
  - “access_token”queryParameter
  - bodyParameter，带有“application / json”contentType，并由Schema验证
  - HTTP状态为200的响应（主体的内容类型为“application / json”）

所以，让我们从其中一个资源中提取这个（我将在这个例子中使用“/ songs”，但我们最终将参数化resourceType，因此选择启动哪一个并不重要）。

```yaml
resourceTypes:
  collection:
    description: Collection of available songs in Jukebox
    get:
      description: Get a list of songs based on the song title.
      responses:
        200:
          body:
            application/json:
    post:
      description: |
        Add a new song to Jukebox.
      queryParameters:
        access_token:
          description: "The access token provided by the authentication application"
          example: AABBCCDD 
          required: true
          type: string
      body:
        application/json:
          type: song
      responses:
        200:
          body:
            application/json:
              example: |
                { "message": "The song has been properly entered" }
```

使用现在的`collection`resourceType，我们无能为力。将它应用于`/songs`资源是可能的，但我们不希望这些描述，模式甚至POST响应都应用于所有资源，因为集合是特定的`/songs`。参数在这里很有用。假设您可以在resourceType上编写一个“占位符”，以填充资源上指定的值。例如：

```
description: Collection of available <<resource>> in Jukebox
```

与`<<resource>>`接收“歌曲”，“艺术家”，或者根据资源“专辑”。

虽然这是可能的（并且对于大多数情况非常有用），但对于这种特殊情况，由于**保留参数**，资源甚至不必传递**参数**。

保留参数只是一个参数，其值由其上下文自动指定。对于resourceTypes情况，有两个保留参数：resourcePath和resourcePathName。对于`/songs`示例中，值将是“/歌曲”和“歌曲”分别。

现在，如果您正在查看最后一个代码段，您将意识到我们需要在某些情况下将值设置为“歌曲”，而在其他情况下使用“歌曲”。这里是**参数变形金刚**变得方便的地方。

我们可以为此示例使用两个参数变换器：`!singularize`和`!pluralize`（注意：当前版本的RAML支持的唯一区域设置是“美国英语”）。

所以结合这个，让我们更新我们的最新代码片段：

```yaml
resourceTypes:
  collection:
    description: Collection of available <<resourcePathName>> in Jukebox
    get:
      description: Get a list of <<resourcePathName>> based on the song title.
      responses:
        200:
          body:
            application/json:
    post:
      description: |
        Add a new <<resourcePathName|!singularize>> to Jukebox.
      queryParameters:
        access_token:
          description: "The access token provided by the authentication application"
          example: AABBCCDD 
          required: true
          type: string
      body:
        application/json:
          type: <<resourcePathName|!singularize>>
      responses:
        200:
          body:
            application/json:
              example: |
                { "message": "The <<resourcePathName|!singularize>> has been properly entered" }
/songs:
  type: collection
  get:
    queryParameters:
      songTitle:
        description: "The title of the song to search (it is case insensitive and doesn't need to match the whole title)"
        required: true
        minLength: 3
        type: string
        example: "Get L"
    responses:
      200:
        body:
          application/json:
            example: |
              {
                "songs": [
                  {
                    "songId": "550e8400-e29b-41d4-a716-446655440000",
                    "songTitle": "Get Lucky"
                  },
                  {
                    "songId": "550e8400-e29b-41d4-a716-446655440111",
                    "songTitle": "Loose yourself to dance"
                  },
                  {
                    "songId": "550e8400-e29b-41d4-a716-446655440222",
                    "songTitle": "Gio sorgio by Moroder"
                  }
                ]
              }
  post:
    body:
      application/json:
        example: |
          {
            "songId": "550e8400-e29b-41d4-a716-446655440000",
            "songTitle": "Get Lucky",
            "albumId": "183100e3-0e2b-4404-a716-66104d440550"
          }
```

请注意，甚至使用此参数指定Schema名称（在本例中为singular）。我们之前提到模式名称不是随机的 - 这就是原因。强调的另一个重要方面是定义资源类型并将其应用于资源并不禁止您覆盖任何地图的元素。在这个例子中，我们仍然看到GET方法同时存在于resourceType和resourceType中（响应，POST等相同）。这不仅是允许的，而且是重新定义从一种资源变为另一种资源的东西的方式。**如果您认为这看起来像OOP继承，那么你是对的！**

现在，让我们使用“collection-item”resourceType。

这段代码没什么新鲜的。更多resourceType定义，参数化和用法：

```yaml
collection-item:
  description: Entity representing a <<resourcePathName|!singularize>>
  get:
    description: |
      Get the <<resourcePathName|!singularize>>
      with <<resourcePathName|!singularize>>Id =
      {<<resourcePathName|!singularize>>Id}
    responses:
      200:
        body:
          application/json:
      404:
        body:
          application/json:
            example: |
              {"message": "<<resourcePathName|!singularize>> not found" }
/songs:
  ...
  /{songId}:
    type: collection-item
    get:
      responses:
        200:
          body:
            application/json:
              example: |
                {
                  "songId": "550e8400-e29b-41d4-a716-446655440000",
                  "songTitle": "Get Lucky",
                  "duration": "6:07",
                  "artist": {
                    "artistId": "110e8300-e32b-41d4-a716-664400445500"
                    "artistName": "Daft Punk",
                    "imageURL": "http://travelhymns.com/wp-content/uploads/2013/06/random-access-memories1.jpg"
                  },
                  "album": {
                    "albumId": "183100e3-0e2b-4404-a716-66104d440550",
                    "albumName": "Random Access Memories",
                    "imageURL": "http://upload.wikimedia.org/wikipedia/en/a/a7/Random_Access_Memories.jpg"
                  }
                }
```

但正如您所看到的，我们仍在重复许多代码。特别：

```yaml
get:
  responses:
    200:
      body:
        application/json:
          example: |
```

基本上，每一段代码都需要定义**示例**。这基本上是因为我们只学会了如何使用保留参数。但是，我们还提到参数化的想法是指定要填充指定值的“占位符”。这将解决我们的“例子问题”。

## 参数

在resourceType中定义参数（使用占位符）时，参数和保留参数之间没有区别。仅在资源级别传递参数时才会显示实际差异。例如，名为as的参数`exampleItem`需要以这种方式传递：

```yaml
/{songId}:
  type:
    collection-item:
      exampleItem: THIS IS THE EXAMPLE
```

在“人类语言”中，它基本上是说`/{songId}`资源是`collection-item`类型的。但现在，它也表明`collection-item`参数的值`exampleItem`是“这就是例子”。由于这是一个字符串，因此字符串的所有YAML规则都是有效的。话虽如此，让我们来看看一些相关的代码片段。

```yaml
resourceTypes:
  collection:
    description: Collection of available <<resourcePathName>> in Jukebox
    get:
      description: Get a list of <<resourcePathName>> based on the song title.
      responses:
        200:
          body:
            application/json:
    post:
      description: |
        Add a new <<resourcePathName|!singularize>> to Jukebox.
      queryParameters:
        access_token:
          description: "The access token provided by the authentication application"
          example: AABBCCDD 
          required: true
          type: string
      body:
        application/json:
          type: <<resourcePathName|!singularize>>
      responses:
        200:
          body:
            application/json:
              example: |
                { "message": "The <<resourcePathName|!singularize>> has been properly entered" }
  collection-item:
    description: Entity representing a <<resourcePathName|!singularize>>
    get:
      description: |
        Get the <<resourcePathName|!singularize>>
        with <<resourcePathName|!singularize>>Id =
        {<<resourcePathName|!singularize>>Id}
      responses:
        200:
          body:
            application/json:
        404:
          body:
            application/json:
              example: |
                {"message": "<<resourcePathName|!singularize>> not found" }
/songs:
  type:
    collection:
      exampleCollection: |
        [
          {
            "songId": "550e8400-e29b-41d4-a716-446655440000",
            "songTitle": "Get Lucky"
          },
          {
            "songId": "550e8400-e29b-41d4-a716-446655440111",
            "songTitle": "Loose yourself to dance"
          },
          {
            "songId": "550e8400-e29b-41d4-a716-446655440222",
            "songTitle": "Gio sorgio by Morodera"
          }
        ]
      exampleItem: |
        {
          "songId": "550e8400-e29b-41d4-a716-446655440000",
          "songTitle": "Get Lucky",
          "albumId": "183100e3-0e2b-4404-a716-66104d440550"
        }
  get:
    queryParameters:
      songTitle:
        description: "The title of the song to search (it is case insensitive and doesn't need to match the whole title)"
        required: true
        minLength: 3
        type: string
        example: "Get L"
  /{songId}:
    type:
      collection-item:
        exampleItem: |
          {
            "songId": "550e8400-e29b-41d4-a716-446655440000",
            "songTitle": "Get Lucky",
            "duration": "6:07",
            "artist": {
              "artistId": "110e8300-e32b-41d4-a716-664400445500"
              "artistName": "Daft Punk",
              "imageURL": "http://travelhymns.com/wp-content/uploads/2013/06/random-access-memories1.jpg"
            },
            "album": {
              "albumId": "183100e3-0e2b-4404-a716-66104d440550",
              "albumName": "Random Access Memories",
              "imageURL": "http://upload.wikimedia.org/wikipedia/en/a/a7/Random_Access_Memories.jpg"
            }
          }
```

如您所见，前一个示例中显示的相同概念同时应用于`/songs`和`/songs/{songId}`资源。在前面的示例中，最后重复的代码现在完全位于resourceType中，而POST定义直接从资源中消失。**那是对的。现在，每个collection-item类型化的资源都将具有有效（通用）POST定义，而无需您编写它。**

## INCLUDES

在使用resourceTypes的最后一步中，我们已经大大改进了RAML定义。我们能够提取资源的通用组件，并使用一个允许类似继承功能的结构封装它们。

尽管如此，RAML文件仍然包含许多可被视为“不是API描述”的信息。如果你愿意，可以选择“经济舱”成员。**同样重要，但不一定是主RAML文件的一部分**。

通过`!includes`，RAML允许我们构建文件分布式API定义，这不仅有助于鼓励代码重用，还可以提高可读性。

在这里，我们将用于`/songs`资源的示例提取到不同的文件，并将它们包含在主RAML定义中。

```json
{
  "songId": "550e8400-e29b-41d4-a716-446655440000",
  "songTitle": "Get Lucky",
  "albumId": "183100e3-0e2b-4404-a716-66104d440550"
}
{
  "songId": "550e8400-e29b-41d4-a716-446655440000",
  "songTitle": "Get Lucky",
  "duration": "6:07",
  "artist": {
    "artistId": "110e8300-e32b-41d4-a716-664400445500"
    "artistName": "Daft Punk",
    "imageURL": "http://travelhymns.com/wp-content/uploads/2013/06/random-access-memories1.jpg"
  },
  "album": {
    "albumId": "183100e3-0e2b-4404-a716-66104d440550",
    "albumName": "Random Access Memories",
    "imageURL": "http://upload.wikimedia.org/wikipedia/en/a/a7/Random_Access_Memories.jpg"
  }
}
[
  {
    "songId": "550e8400-e29b-41d4-a716-446655440000",
    "songTitle": "Get Lucky"
  },
  {
    "songId": "550e8400-e29b-41d4-a716-446655440111",
    "songTitle": "Loose yourself to dance"
  },
  {
    "songId": "550e8400-e29b-41d4-a716-446655440222",
    "songTitle": "Gio sorgio by Morodera"
  }
]
```

如您所见，提取的文件包含原始字符串。重要的是要强调每个包含的文件都被RAML视为一个字符串，这提供了一些众所周知的关于如何在文件之间分配定义的限制。除了限制之外，这些限制还试图定义一种常用的工作方式！包括并避免使用自由格式定义的API。请记住，RAML的主要目标之一是统一标准并鼓励最佳实践。以下代码段显示了如何从主定义中包含或“调用”提取的文件。

```yaml
/songs:
  type:
    collection:
      exampleCollection: !include jukebox-include-songs.sample
      exampleItem: !include jukebox-include-song-new.sample
  /{songId}:
    type:
      collection-item:
        exampleItem: !include jukebox-include-song-retrieve.sample
```

如最后一个片段所示，RAML功能鼓励您减少编写的代码数量，同时使其更具可重用性和可维护性。

## 重构

我们已经介绍了几个功能，并且在我们的API定义方面取得了很大进展，但是我们不是缺少一些东 我们只关注“/ songs”资源（及其降序分支）。如果你现在检查你的RAML文件，你会发现所有其他资源仍然没有利用我们已经完成的工作。我们马上就解决吧！对所有资源重复相同的过程：

- 识别并应用集合和集合项模式
- 传递正确的参数
- 将所属的示例提取到分离的文件中

您可能已经注意到，RAML文件中的行数已经大大减少，并且文件比以前多。最重要的是：它明显更简单！但并非一切都如此顺利。仔细观察，子集（`/artists/{artistId}/albums`和`/albums/{albumId}/songs`）存在问题。由于这些不是每个资源的主要集合，因此我们决定不允许在它们上创建新元素。换句话说，这些集合是只读的。应用`collection`resourceType时，我们还自动添加了“POST”方法。另外一个结果是，RAML定义现在也要求`exampleItem`为这些资源传递参数（我们通过传递暂时解决了这个参数`{}`）。

```yaml
/artists:
  /{artistId}:
    /albums:
      type:
        collection:
          exampleCollection: !include jukebox-include-artist-albums.sample
          exampleItem: {}
      description: Collection of albulms belonging to the artist
      get:
        description: Get a specific artist's albums list
```

虽然这很尴尬，但这并不是什么大问题，它实际上会帮助我们进一步解决问题。

让我们创建另一个名为的resourceType `readOnlyCollection`。它将类似`collection`但没有“POST方法”。让我们将这个新的resourceType应用于其相应的集合：`artists/{artistId}/albums`和`/albums/{albumId}/songs`：

```yaml
readOnlyCollection:
  description: Collection of available <<resourcePathName>> in Jukebox.
  get:
    description: Get a list of <<resourcePathName>>.
    responses:
      200:
        body:
          application/json:
            example: |
              <<exampleCollection>>
/artists:
  /{artistId}:
    /albums:
      type:
        readOnlyCollection:
          exampleCollection: !include jukebox-include-artist-albums.sample
      description: Collection of albums belonging to the artist
      get:
    description: Get a specific artist's albums list
/albums:
  /{albumId}:
    /songs:
      type:
        readOnlyCollection:
          exampleCollection: !include jukebox-include-album-songs.sample
      get:
        description: Get the list of songs for the album with `albumId = {albumId}`
```

如果您正在详细地遵循代码，那么您已经注意到了一些事情：`collection`而`readOnlyCollection`resourceTypes正在重复一些代码。实际上，`readOnlyCollection`代码完全包含在`collection`代码中。那是对的！并且有一种方法可以提高效率。这些都是关于“类型组合”的，它将在后面的教程中完全涵盖。

## 性状

我们差不多完成了！我们正忙于满足所述用例的所有要求。然而，像往常一样，我们在构建时发现了一些东西，本教程也不例外。我可以对收藏品进行排序吗？我的API不应该让用户有机会分页吗？我们选择的搜索集合的策略是否足够好？如果我们将来需要增强并进行更复杂的查询，该怎么办？我们来解决这些问题。但首先，我们需要正确理解它们

**了解我们的资源**

让我们构建一个简单的表来发现并同意每个集合功能：

| 收集/功能               | 检索 | Sorteable | 分页 |
| ----------------------- | ---- | --------- | ---- |
| `/songs`                | 是   | 是        | 是   |
| `/artists`              | 是   | 是        | 是   |
| `/albums`               | 是   | 是        | 是   |
| `/artists/{aId}/albums` | 没有 | 是        | 是   |
| `/albums/{aId}/songs`   | 没有 | 是        | 没有 |

如果我们考虑谁将使用API，那么这个表可能看起来非常不同（可以在客户端过滤，排序和分页小集合）。出于本教程的目的，我们仍然保留它。

**修复可搜索的集合**

在介绍Traits概念之前，让我们通过应用通用的“查询”queryParameter来增强Searchable固定参数。

```yaml
/songs:
  type:
    collection:
      exampleCollection: !include jukebox-include-songs.sample
      exampleItem: !include jukebox-include-song-new.sample
  get:
    queryParameters:
      songTitle:
        description: "The title of the song to search (it is case insensitive and doesn't need to match the whole title)"
        required: true
        minLength: 3
        type: string
        example: "Get L"
/songs:
  type:
    collection:
      exampleCollection: !include jukebox-include-songs.sample
      exampleItem: !include jukebox-include-song-new.sample
  get:
    queryParameters:
      query:
        description: |
          JSON array [{"field1","value1","operator1"},{"field2","value2","operator2"},...,{"fieldN","valueN","operatorN"}] with valid searchable fields: songTitle
        example: |
          ["songTitle", "Get L", "like"]
```

**可搜索的特征**

与多个资源可能使用特定resourceType的方式相同，可以使用traits定义和重用类似的行为。这是代码中更好地解释的这些概念之一：

```yaml
/songs:
  type:
    collection:
      exampleCollection: !include jukebox-include-songs.sample
      exampleItem: !include jukebox-include-song-new.sample
  get:
    queryParameters:
      query:
        description: |
          JSON array [{"field1","value1","operator1"},{"field2","value2","operator2"},...,{"fieldN","valueN","operatorN"}] with valid searchable fields: songTitle
        example: |
          ["songTitle", "Get L", "like"]
traits:
  searchable:
    queryParameters:
      query:
        description: |
          JSON array [{"field1","value1","operator1"},{"field2","value2","operator2"},...,{"fieldN","valueN","operatorN"}] <<description>>
        example: |
          <<example>>
```

如您所见，此Searchable特征由名称和适用参数组成。在上面的例子中也很明显，可以参数化特征。让我们检查特征如何应用于方法：

```yaml
/songs:
  type:
    collection:
      exampleCollection: !include jukebox-include-songs.sample
      exampleItem: !include jukebox-include-song-new.sample
  get:
    is: [searchable: {description: "with valid searchable fields: songTitle", example: "[\"songTitle\", \"Get L\", \"like\"]"}]
```

所以，这个定义真正说的是有一个叫做“Searchable”的特性，而“/ songs”资源就是利用它。此外，特征应用于GET方法本身，因为“可搜索”合同应仅适用于该特定方法。在其他情况下，您可以将特征应用于整个资源，甚至更多：**特征也可以应用于resourceTypes。**本主题应该并将在单独的教程（类型组合）中介绍。无论如何，请随意尝试，并始终记住，您可以：

需要注意的是，我们已经申请了检索的性状`/songs`，`/artists`和`/albums`资源。

**其他特征**

考虑到我们的表，我们需要创建2个额外的特征：Orderable和Pageable。创建是微不足道的，当应用时，我们会确认您在上一步中可能注意到的内容：traits是一个集合（这就是它们在数组中应用的原因）。

```yaml
orderable:
  queryParameters:
    orderBy:
      description: |
        Order by field: <<fieldsList>>
      type: string
      required: false
    order:
      description: Order
      enum: [desc, asc]
      default: desc
      required: false
pageable:
  queryParameters:
    offset:
      description: Skip over a number of elements by specifying an offset value for the query
      type: integer
      required: false
      example: 20
      default: 0
    limit:
      description: Limit the number of elements on the response
      type: integer
      required: false
      example: 80
      default: 10
/songs:
  type:
    collection:
      exampleCollection: !include jukebox-include-songs.sample
      exampleItem: !include jukebox-include-song-new.sample
  get:
    is: [
      searchable: {description: "with valid searchable fields: songTitle", example: "[\"songTitle\", \"Get L\", \"like\"]"},
      orderable: {fieldsList: "songTitle"},
      pageable
    ]
```

在这种情况下，您可以看到“可分页”特征没有接收任何参数。

前进！将适当的特征应用于我们在表中定义的适当资源。

## 最后的调整

我们可以说我们的RAML文件已经过适当的重构，现在更具可读性，可重用性和可维护性。也许最后一步是仔细检查RAML定义的哪些部分现在可以提取到其他文件（就像我们使用“示例”一样）。从根开始，我们找到了模式，看起来很简单，每个JSON（在这种情况下）都可以被提取并包含在我们学到的内容中。

```yaml
types:
  song: !include jukebox-include-song.schema
  artist: !include jukebox-include-artist.schema
  album: !include jukebox-include-album.schema
```

当然，文件系统中会出现三个新文件。

虽然这似乎不是一个启示（它不是），但让我们继续检查我们的RAML文件以发现可以提取的其他内容。老实说，resourceTypes和traits真的很诱人。但如果你尝试遵循相同的策略，你肯定会失败。请记住，在前面的部分中我们解释过该`!include`函数只是获取文件的内容并将其内容嵌入为字符串？这正是我们想要用的例子和模式。但是，如果我们再次查看resourceTypes和traits，我们会注意到它们不仅仅是字符串，而是map（就像RAML文件的其余部分一样）。所以基本上，不！您无法使用与提取示例和模式相同的方法提取这些内容。

但是，您可以将所有resourceTypes提取到文件中（并对特征执行相同操作）。

```
resourceTypes: !include jukebox-includes-resourceTypes.inc
```

虽然这不是限制，但值得注意的是，这并不意味着它是一种推荐的做法。在某些情况下，您需要妥协。例如：如果我们有2000行的resourceTypes定义，我们可能想将它提取到一个单独的文件中。但是，如果resourceTypes并没有真正使可读性复杂化，那么能够在不转到外部文件的情况下查看它们的定义方式也很不错。像往常一样，这是一个很好的判断问题。

## 结论

在本教程中，我们学习了如何从代码重用和可维护性的角度优化我们的RAML文件，引入了Traits，resourceTypes和includes，并开发和重构了一个完整的用例。

最后，就像在每个学科中一样，我们需要运用良好的判断力。永远记住，过度工程永远不是一个好主意。永远。