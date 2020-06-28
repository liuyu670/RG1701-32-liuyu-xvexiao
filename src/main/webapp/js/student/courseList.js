
layui.use(['form','jquery','table','laydate'],function () {
    var layer=layui.layer;
    var $=layui.jquery;
    var form=layui.form;
    var table=layui.table;



    table.render({
        id:'courseList',
        elem:'#courseList',
        url:ctx+ "/student/getCourseList",
        limit:10,
        limits:[10,20,30,40],
        cols:[[
            {field:'id',title:'课程ID',align:'center',width:110},
            {field:'courseName',title:'课程名称',width:200,align:'center'},
            {field:'place',title:'上课地点',align:'center',width:160},
            {field:'lessonType',title:'课程类型',align:'center',width:160},
            {field:'credit',title:'学分',align:'center',width:160},
            { field: 'username', title : '授课老师', width:160,templet: '<div>{{d.teacher.username}}</div>'}
        ]],
        page:true,
        loading:true

    });


});



