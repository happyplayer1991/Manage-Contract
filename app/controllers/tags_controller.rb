class TagsController < ApplicationController

    def add
        @tag = Tag.new(tag_post_parmas)
        if(@tag.save)
            respond_to do |format|
                format.json {
                    render :json => @tag
                }
            end
        else
        end
    end

    private
        def tag_post_parmas
            params.require(:tag).permit(:name)
        end
end
