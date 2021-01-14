# 产品发布系统

### 18231064 赵相成



## 实现操作

- 创建产品（对名称，产品描述的字数限制）

  ![image-20210115042108511](http://ruby-git.act.buaa.edu.cn/ruby-2020/18231064/-/tree/product/product_releaser/images/image-1.png)

  实现判空，长度限制（名字的长度为了方便设置为10而不是ppt中的45）

  

- 显示单个产品（同时显示相关评论）

  ![image-20210115042243930](http://ruby-git.act.buaa.edu.cn/ruby-2020/18231064/-/tree/product/product_releaser/images/image-2.png)



- 列出所有产品（可按类型筛选，可分页）

  - ​	列出所有产品，分页

    ![image-20210115042334893](http://ruby-git.act.buaa.edu.cn/ruby-2020/18231064/-/tree/product/product_releaser/images/image-3.png)

  - 按类型筛选

    方法：进入对应的category，显示出属于该类的所有产品

    ​	![image-20210115042414138](http://ruby-git.act.buaa.edu.cn/ruby-2020/18231064/-/tree/product/product_releaser/images/image-4.png)

    

- 编辑产品

- 删除产品（同时删除相关评论）

- 为产品添加评论（评论字数限制）

- 删除评论

- 重名判定

  ![image-20210115043222480](http://ruby-git.act.buaa.edu.cn/ruby-2020/18231064/-/tree/product/product_releaser/images/image-5.png)



## 未遇到的问题

- 脚手架搭建

  ​	该系统模型关系较简单，类比cookbook3和blog4的练习即可完成脚手架的搭建





## 遇到并解决的问题

- 如何实现对属性长度、重复等的限制

  在model中添加validates声明的参数

  ```ruby
  validates :name,		#对哪一属性限制
      presence: true,		#非空
      length: {maximum: 45}, #最大长度
      on: :create,  		#针对哪一操作
      allow_nil: false	
  validates :name, :uniqueness => { :message =>'Already taken'} #不能重名
  ```

- 修改时之前的限制未生效（如可以通过Edit使某一Product的name为空或超出长度限制）

  ​	删去 `on: :create`这一只针对创建操作的限制

- 如何正确的删除comment

  - 修改controller：

  ![image-20210115044051301](http://ruby-git.act.buaa.edu.cn/ruby-2020/18231064/-/tree/product/product_releaser/images/image-6.png)

  - 修改views

    ![image-20210115044135664](http://ruby-git.act.buaa.edu.cn/ruby-2020/18231064/-/tree/product/product_releaser/images/image-7.png)

- 如何实现分页

  ​	调用`will_paginate`插件

  

## 美中不足的地方

- 按类型筛选的方式不够理想

  ​	理想的方式是在列出所有Product的页面能通过选择类别来显示不同类别下的Product，没能实现。最终实现方法为点进具体的类（category），显示出该类下所有的Product

- 丑

  ​	前端工作不足