
layui.use(['form','jquery','table','laydate'],function () {
    var layer=layui.layer;
    var $=layui.jquery;
    var form=layui.form;
    var table=layui.table;



    table.render({
        id:'studentCourses',
        elem:'#studentCourses',
        url:ctx+ "/teacher/getStudentCourses",
        limit:5,
        limits:[5,10,20,30],
        cols:[[
            {field:'id',title:'课程ID',align:'center',width:110},
            {field:'courseName',title:'课程名称',align:'center',width:180},
            {field:'place',title:'上课地点',align:'center',width:160},
            {field:'username',title:'选课学生名单',templet:function(d){
                    return $.map(d.studentList,function(item, index){
                        return item.username
                    }).join(";")  //map函数将courseList中的courseName属性全部返回，
                    // 组成新的数组 join(";")将其以;连接所有元素 的字符串
                },align:'center'}
        ]],
        page:true,
        loading:true

    });


});



