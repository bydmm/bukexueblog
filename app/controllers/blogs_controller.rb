# -*- encoding : utf-8 -*-

class BlogsController < ApplicationController
  load_and_authorize_resource
  add_breadcrumb :index, :root_path
  # GET /blogs
  # GET /blogs.json
  def index
    @blogs = Blog.order('id DESC').all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @blogs }
    end
  end
  
  def tagblog
    @blogs = Blog.find_by_tag(params[:tag])
    self.set_seo_meta(params[:tag],'','');
    respond_to do |format|
      format.html # tagblog.html.erb
      format.json { render json: @blogs }
    end
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    @blog = Blog.find(params[:id])
    self.set_seo_meta(@blog.title, BlogsHelper.join_tags(@blog), seo(@blog.content));
    add_breadcrumb @blog.title, blogs_path(@blog)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @blog }
    end
  end

  # GET /blogs/new
  # GET /blogs/new.json
  def new
    @blog = Blog.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @blog }
    end
  end

  # GET /blogs/1/edit
  def edit
    @blog = Blog.find(params[:id])
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(params[:blog])

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: '成功创建博客' }
        format.json { render json: @blog, status: :created, location: @blog }
      else
        format.html { render action: "new" }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /blogs/1
  # PUT /blogs/1.json
  def update
    @blog = Blog.find(params[:id])

    respond_to do |format|
      if @blog.update_attributes(params[:blog])
        format.html { redirect_to @blog, notice: '博客成功更新' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy

    respond_to do |format|
      format.html { redirect_to blogs_url }
      format.json { head :no_content }
    end
  end
  
  private
    def seo(text)
      moshi = /\<\!\-\- more \-\-\>/
      pre = moshi.match(text).try(:pre_match)
      pre = pre ? pre : text
    end
    
end
