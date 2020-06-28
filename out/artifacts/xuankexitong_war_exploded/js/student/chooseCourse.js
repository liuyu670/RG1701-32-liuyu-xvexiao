
layui.use(['form','jquery','table','laydate'],function () {
    var layer=layui.layer;
    var $=layui.jquery;
    var form=layui.form;
    var table=layui.table;


    table.render({
        id:'chooseCourse',
        elem:'#chooseCourse',
        url:ctx+ "/student/getCourse",
        limit:10,
        limits:[10,20,30,40],
        cols:[[
            {field:'id',title:'课程ID',align:'center',width:110},
            {field:'courseName',title:'课程名称',align:'center'},
            {field:'place',title:'上课地点',align:'center',width:120},
            {field:'lessonType',title:'课程类型',align:'center',width:120},
            {field:'credit',title:'学分',align:'center',width:120},
            { field: 'username', title : '授课老师', width:120,templet: '<div>{{d.teacher.username}}</div>'},
            {title:'选课',align:'center',width:120,toolbar:"#barDemo"}  //注意！！！！
            // 宽度设置大一点 否则 删除图标显示不出来 然后会出现下拉符号 显示
            // 删除符号 但此时点击就不会有效果了 所以windth设大一点 都显示出来
        ]],
        page:true,
        loading:true

    });

    table.on('tool(chooseCourse)',function (obj) {
        var data=obj.data;

        if(obj.event==='choose')
        {
            layer.confirm('确定要选择：'+data.courseName+'么？',function (index) {
                $.ajax({
                    url:ctx+"/student/choose",
                    type:"POST",
                    data:{
                        "id":data.id //课程id
                    },
                    success:function (d) {
                        if(d.code==0)
                        {
                            layer.msg("选择成功",{icon:1});
                        }
                        else
                        {
                            layer.msg("已经选择了此课程，请重新选择",{icon:5});
                        }
                    },
                    error:function () {
                        layer.msg("选择失败，检查sql及输出",{icon:5});
                    }
                })
                layer.close(index);
            });
        }
        else if(obj.event==='del')
        {
            layer.confirm('确定要取消：'+data.courseName+'的选择吗？',function (index) {
                $.ajax({
                    url:ctx+"/student/deleteCourse",
                    type:"POST",
                    data:{
                        "id":data.id //课程id
                    },
                    success:function (d) {
                        if(d.code==0)
                        {
                            layer.msg("取消成功",{icon:1});
                        }
                        else
                        {
                            layer.msg(d.msg,{icon:5});
                        }
                    },
                    error:function () {
                        layer.msg("取消失败，检查sql及输出",{icon:5});
                    }
                })
                layer.close(index);
            });

        }
    })

});

