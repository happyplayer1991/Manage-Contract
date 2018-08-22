# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "turbolinks:load", ->
    
    $("input[name=publish_type]").on "change", (event) ->
        type = parseInt($(this).val())
        if type
            $(".publish-date").addClass 'd-none'
        else
            $(".publish-date").removeClass 'd-none'
    
    # $(".tags_added").select2
    #     multiple: true,
    #     tags: true,
    #     data: ["most","popular"]
    #     # tokenSeparators: [',', ' '],

    #     # createTag: (params) ->
    #     #     term = $.trim(params.term)

    #     #     if term == ''
    #     #         return null

    #     #     return {
    #     #         id: term,
    #     #         text: term,
    #     #         newTag: true 
    #     #     }

    #     # insertTag: (data, tag) -> 
    #     #     data.push(tag)
    # data = {
    #     id: 1,
    #     text: 'A'
    # }

    # newOption = new Option(data.text, data.id, false, false);
    # $('.tags_added').append(newOption).trigger('change');

    # $('.tags_added').val(['most', 'popular']);
    # $('.tags_added').trigger('change'); 

    # #null
    # $(".tags_added").val(null).trigger('change');

    #add new category
    $(".add-new-category").on "click", (e) ->
        e.preventDefault()
        $.ajax({
            url: '/categories/add', 
            type: 'POST',
            dataType: 'json',
            data: {
                category: {
                    name: $('#category_name').val()
                }
            },
            complete: () -> 
                    
            success: (data, textStatus, xhr) ->
                ele = '<tr>'
                #
                ele += "<td class='text-center'>"
                ele += "<input type='checkbox' name='blog[category_ids][]'' id='blog_category_ids_' value='" + data.id + "' multiple='multiple'>"
                ele += '</td>'
                #
                ele += "<td class='text-center'>"
                ele += data.name
                ele += '</td>'
                #
                ele += "<td class='text-center'>"
                ele += "<a class='fa fa-edit fa-lg text-success' href='/categories/" + data.id + "/edit'></a>"
                ele += "<a class='fa fa-trash fa-lg text-danger' data-confirm='Are you sure?' rel='nofollow' data-method='delete' href='/categories/" + data.id + "'></a>"
                ele += '</td>'

                ele += '</tr>'

                $(".cat-list").append(ele)

            error: () -> 
        })
        
    #add new tag
    $(".add-new-tag").on "click", (e) ->
        e.preventDefault()
        tag_name = $('#tag_name').val()
        if tag_name!= null
            $.ajax({
                url: '/tags/add', 
                type: 'POST',
                dataType: 'json',
                data: {
                    tag: {
                        name: tag_name
                    }
                },
                complete: () -> 
                        
                success: (data, textStatus, xhr) ->
                    ele  = "<span class='badge badge-success mr-1'>" + data.name + "</span>"
                    ele += "<input type='hidden' name='blog[tag_ids][]'' id='blog_tag_ids_' value='" + data.id + "' multiple='multiple'>"
                    $('.tags-list').append(ele)
                error: () -> 
            })

    # $('.tag-ids').select2({
    #   tags: true,
    #   tokenSeparators: [','],
    #   placeholder: 'Separated by comma',
    #   data: ["most","popular"]
    # });
