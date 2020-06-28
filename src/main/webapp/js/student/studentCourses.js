
layui.config({
    base : "/js/" //必须是 /js/ 两个/ / 都有 否则 js下的iconPicker加载不成功
}).use(['form','jquery','table','laydate','tableMerge'],function () {
    var layer=layui.layer;
    var $=layui.jquery;
    var form=layui.form;
    var table=layui.table;
    var tableMerge=layui.tableMerge;


    table.render({
        id:'studentCourses',
        elem:'#studentCourses',
        url:ctx+ "/student/getStudentCourses",
        limit:5,
        limits:[5,10,20,30],
        cols:[[
            {field:'id',title:'学生ID', merge:true,align:'center',width:110},
            {field:'username',title:'学生姓名',merge:true,align:'center',width:110},
            /*
            {field:'courseName',title:'已选课程',templet:function(d){
                    return $.map(d.courseList,function(item, index){
                        return item.courseName
                    }).join(";")  //map函数将courseList中的courseName属性全部返回，
                    // 组成新的数组 join(";")将其以;连接所有元素 的字符串
                },align:'center'},
            {field:'place',title:'上课地点',templet:function(d){
                    return $.map(d.courseList,function(item, index){
                        return item.place
                    }).join(";")  //map函数将courseList中的courseName属性全部返回，
                    // 组成新的数组 join(";")将其以;连接所有元素 的字符串
                },align:'center'}
                */
            {field:'courseName',title:'已选课程',align:'center'},
            {field:'place',title:'上课地点',align:'center'}
        ]],
        page:true,
        loading:true,
/*
* 这里详细解释下显示过程：
* 返回的数据格式为：
*
{
    "code":0,
    "msg":"",
    "count":8,"
    data":
    [{
        "id":1,
        "username":"张三",
        "courseList":
                [
                    {
                    "id":0,
                    "courseName":"C语言程序设计","place":"B202"
                    },
                    {
                    "id":0,
                    "courseName":"数据库设计新","place":"C301"
                    },
                    {
                    "id":0,
                    "courseName":"android编程","place":"A102"
                    },
                    {
                    "id":0,
                    "courseName":"java深入浅出","place":"B204"
                    },
                    {
                    "id":0,
                    "courseName":"工厂供电","place":"A102"
                    },
                    {
                    "id":0,
                    "courseName":"疯狂文言文1","place":null]
                    }
                ]
     }]
 }
 原来显示格式：
        张三  ---   课程1；课程2；课程3；课程4；  这是一行
        现在想显示为：

                    课程1
       张三         课程2
*                   课程3
*                   课程4       这样显示就是四行
*          所以首先要把返回的数据进行处理，转换成多层数据，
*          就是变成 张三；课程1      张三；课程2  。。。。这样的形式
*          原来是学生里有个课程列表，现在要把课程列表里的都拿出来，分别配上学生
*          下面parseData中先看最里层：
*          return $.map(d.courseList, function (course)  //course就是d.courseList中的每一项
                {
                    $.extend(course,d);
                    delete course.courseList;
                    console.log(course);
                    return course;
                })
*          $.extend(course,d);将d（并不是我们返回的数据，而是我们返回的数据中的每一项，
*          因为外面还有一个$.map(res.data, function (d) ）合并到course中,注意，course中的
*          id会被d中的同名id覆盖，然后再删除courseList，举例：
*          courseList第一项原来是：
*                   {
                    "id":0,
                    "courseName":"C语言程序设计","place":"B202"
                    }
*           被d中的第一项覆盖并删除courseList后为：
*                   {
                    "id":1,
                    "courseName":"C语言程序设计","place":"B202"
                    "username":"张三",
                    }
*           最终$.map(res.data, function (d){...})得到的新数组为：
*
*           [
                    {
                    "id":1,
                    "courseName":"C语言程序设计","place":"B202"
                    "username":"张三",
                    }
                    {
                    "id":1,
                    "courseName":"数据库设计新","place":"B202"
                    "username":"张三",
                    }
                    。。。。

                    {
                    "id":7,
                    "courseName":"C语言程序设计","place":"B202"
                    "username":"王安石",
                    }
*                   这样数据好了，下面就是合并单元格，如果不合并单元格就是：
*                   张三---课程1---
*                   张三---课程2---
*                   张三---课程3---
*                  这里要把张三合并；done: function (res)比较复杂
*
*                  注意 知道数据怎么变成多层数据了
 *                  此时完全可以用 layui-soul-table那个组件 就不用了设计合并单元格了
*
*
*
*
*
* */






        parseData:function (res)
        {
            res.data = $.map(res.data, function (d)
            {   //这里什么都没处理 就是遍历res.data 给d 把下面map组成的新数组直接返回
                return $.map(d.courseList, function (course)
                {
                    $.extend(course,d);
                    delete course.courseList;
                   // console.log(course);
                    return course;
                })
            });
           // console.log(res);
            return res;
        },
        done:function () {
            tableMerge.render(this);
        }
/*
        done: function (res) {  //合并单元格
            var that = this;
            //合并显示单元格字段
            var groupCells = ['id','username'];
            //合并关键字段
            var groupKeyWord = 'id';
            layui.each($.unique($.map(res.data, function (item)
            {
                return item[groupKeyWord];
            })), function (index, contains) {
                var tr = that.elem.next().find('.layui-table-main tr td[data-field="'+ groupKeyWord +'"]>.layui-table-cell:contains('+ contains +')').parents('tr');
                layui.each(groupCells, function (i, field) {
                    tr.find('td[data-field="' + field + '"]').first().attr('rowspan', tr.length).end().not(":first").remove();
                })
            })
        }
*/

    });


});



