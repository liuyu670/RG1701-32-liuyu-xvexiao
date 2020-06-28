package com.mecol.bookshop_ssm.web;


import com.mecol.bookshop_ssm.entity.*;
import com.mecol.bookshop_ssm.service.AdminService;
import com.mecol.bookshop_ssm.util.EncryptUtil;
import com.mecol.bookshop_ssm.util.GsonUtil;
import com.mecol.bookshop_ssm.util.ResultUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController
{
    @Autowired
    private AdminService adminService;



    @RequestMapping("/login")
    @ResponseBody
    //responseBody一般是作用在方法上的，加上该注解表示该方法的返回结果直接写到Http response Body中，
    // 常用在ajax异步请求中，在RequestMapping中 return返回值默认解析为跳转路径,
    // 如果你此时想让Controller返回一个字符串或者对象到前台 就会报404 not response的错误。
//当加上@ResponseBody注解后不会解析成跳转地址 会解析成相应的json格式的对象
// 集合 字符串或者xml等直接返回给前台 可以通过 ajax 的“success”：fucntion(data){} data直接获取到。
    public ResultUtil login(String username, String password, HttpServletRequest request, HttpSession session)
            throws ParseException
    {
        Admin admin=adminService.login(username, EncryptUtil.encrypt(password));
        if(admin!=null)
        {
            session.setAttribute("user",admin); //在拦截器中使用
            session.setAttribute("admin",admin); //在main.jsp中药取出admin
            session.setAttribute("usertype","1");//代表是管理员登录
            // 还有修改密码.jsp等都可以直接取出admin
            String loginIp=request.getHeader("x-forwarded-for");
            if(loginIp==null||loginIp.length()==0||"unknown".equalsIgnoreCase(loginIp))
            {
                loginIp=request.getHeader("Proxy-Client-IP");//获取代理的IP
            }
            if(loginIp==null||loginIp.length()==0||"unknown".equalsIgnoreCase(loginIp))
            {
                loginIp=request.getHeader("WL-Proxy-Client-IP");//获取代理的IP
            }
            if(loginIp==null||loginIp.length()==0||"unknown".equalsIgnoreCase(loginIp))
            {
                loginIp=request.getRemoteAddr();
            }

            Date date=new Date();
            SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String nowTime=simpleDateFormat.format(date);
            Date loginTime=simpleDateFormat.parse(nowTime);

            Date logoutTime=loginTime;

            Integer isSafeExit=0;  //logoutTime  isSafeExit也要插入 不然在数据库中就是null
            // 然后点击退出的时候会 adminLog.setIsSafeExit(1); 就会包空指针异常
            adminService.insAdminLog(username,loginIp,loginTime,logoutTime,isSafeExit);

            session.setAttribute("adminloginTime",loginTime); //点击退出的时候用的到

            return ResultUtil.ok(admin.getId());
        }
        else
            return ResultUtil.error();
    }
    /*************登录Log相关**************/
    //获取所有的登录日志
    @RequestMapping("/getAdminLogList")
    @ResponseBody
    public ResultUtil getAdminLogList(Integer page,Integer limit,HttpSession session)
            throws ParseException
    {

        return adminService.getAdminLogList(page,limit);
    }




    /********Role相关*******/
    //获取角色列表 带分页
    @RequestMapping("/getRoleList")
    @ResponseBody
    public ResultUtil getRoleList(Integer page,Integer limit)
    {
        //因为是分页查询 所以最底层sql 语句为 select * from role order by roleId
        //如果不带分页 直接是select * from role就行
        //有错误信息会在 Tomcat Loaclhost Log中输出
        return adminService.getRoles(page,limit);
    }
    //删除一个角色
    @RequestMapping("/delRole/{roleId}")
    @ResponseBody
    public ResultUtil delRole(@PathVariable("roleId")Long roleId)
    {
        /*

        try{
            adminService.delRole(roleId);
            return ResultUtil.ok();
        }
        catch (Exception e)
        {
            e.printStackTrace();
            return ResultUtil.error();
        }
     */

        //如果用上面的语句 有 try catch 那么ajax调用返回成功 不会进入error语句 并且在server
        // 或者Tomcat Localhost Log 窗口有错误输出
        //如果是下面语句 没有 try catch 那么ajax调用返回错误 直接进入error语句 可以提示数据库
        // 错误之类同时 Tomcat Localhost Log 窗口有错误输出
        adminService.delRole(roleId);
        return ResultUtil.ok();

    }

    //得到指定角色权限树
    // 注解RequestMapping中produces属性可以设置返回数据的类型以及编码，可以是json
    //produces属性 要求<spring.version>4.3.8.RELEASE</spring.version> 版本不能太低
    @RequestMapping(value="/xtreedata",produces = {"text/json;charset=UTF-8"})
    @ResponseBody
    public String xtreeData(@RequestParam(value="roleId" ,defaultValue="-1") Long roleId )
    {
        /*
        Admin admin=new Admin();  //后面的查询 仅仅用到了是一个roleId
        // 这里为什么要创建一个Admin对象 试试删除对象 直接用roleId 做getXtreeData的形参试试？？？？？
        admin.setRoleId(roleId); //roleId 是ajax发送的携带参数 代表当前选中的角色 roleId
        //entityToJson就是将实体类的属性 转换成json的形式
        return GsonUtil.entityToJson(adminService.getXtreeData(admin));
        */
        //不用admin做中介一样可以
        return GsonUtil.entityToJson(adminService.getXtreeData(roleId));
    }
    // 检查角色是否唯一  编辑角色的视乎用这个函数
    @RequestMapping("/checkRoleName/{roleName}/{roleId}")
    @ResponseBody
    public ResultUtil checkRoleName(@PathVariable("roleName") String roleName,
                                    @PathVariable("roleId") Long roleId)
    {
        //System.out.println(roleName);
        //System.out.println("曹操："+roleId);
        Role role=adminService.getRoleByRoleName(roleName);
        if(role==null)//没有这个角色名 可以
        {
            return new ResultUtil(0);
        }
        else if(role.getRoleId()==roleId) //已经有这个角色名 并且就是这个id 也可以
        {
            return new ResultUtil(0);
        }
        else  //此角色名已存在 别的roleId
        {
            return new ResultUtil(500,"已经存在此角色名");
        }
    }
    // 检查角色是否唯一 添加新角色的时候用这个函数
    @RequestMapping("/checkAddRoleName/{roleName}")
    @ResponseBody
    public ResultUtil checkRoleName(@PathVariable("roleName") String roleName)
    {
        Role role=adminService.getRoleByRoleName(roleName);
        if(role==null)//没有这个角色名 可以
        {
            return new ResultUtil(0);
        }
        else  //此角色名已存在
        {
            return new ResultUtil(500,"已经存在此角色名");
        }
    }

    //更新角色
    @RequestMapping("/updateRole")
    @ResponseBody
    public void updateRole(Role role,String m)
    {
       // System.out.println(role);
       // System.out.println(m);
        adminService.updRole(role,m);
    }
    //添加角色
    @RequestMapping("/insRole")
    @ResponseBody
    public ResultUtil insertRole(Role role,String m)
    {
        /*
        Role role1=adminService.getRoleByRoleName(role.getRoleName());
        if(role1!=null)
        {
            return new ResultUtil(500,"角色名已经存在");
        }
        用不到再判断一次了 前台输入角色名的时候 失去焦点会判断
        */

        //如果下面的sql操作有问题 Tomcat Localhost Log 的会输出错误信息
        //并且ajax的不会成功 会调用error中的函数进行提示
        adminService.insRole(role,m);
        return ResultUtil.ok();

        /*我们 加上 try catch 那么ajax调用返回成功 不会进入error语句 并且在server
         或者Tomcat Localhost Log 窗口有错误输出
        看看前端代码 往往因为父窗口重新加载 导致信息看不到
        try{
            adminService.insRole(role,m);
            return ResultUtil.ok();
        }
        catch (Exception e)
        {
            e.printStackTrace();
            return ResultUtil.error("数据库sql操作有问题");
        }
        */
    }




    /*******管理员相关******/
    //查看管理员的个人信息
    @RequestMapping("/personalDate")
    public String personalDate(HttpSession session)
    {
        Admin admin= (Admin) session.getAttribute("admin");
        Admin admin1=adminService.getAdminById(admin.getId());
        session.setAttribute("admin1",admin1);
        return "/jsp/admin/personalInfo";
    }




    @RequestMapping("/getAdminList")
    @ResponseBody
    //获取所有管理员列表 带分页
    public ResultUtil getAdminList(Integer page,Integer limit)
    {
        // Tomcat Localhost Log 会输出错误信息 如果下面的sql语句有问题
        ResultUtil admins=adminService.getAdminList(page,limit);
        //System.out.println(".."+page+"..."+limit);
        return admins;
    }
    //获取管理员对应的菜单 用于加载后台首页
    //注意这里并没有实现 菜单的排序 比如我添加一个顶级菜单 即使改变其sorting 也排在最后面

    @RequestMapping("/getMenus")
    @ResponseBody
    public List<Menu> getMenus(HttpSession session)
    {
        //System.out.println("getmenus进来了");
        List<Menu> menus=null;
        Admin admin= (Admin) session.getAttribute("admin");
        Admin admin1=adminService.getAdminById(admin.getId());
        if(admin1!=null)
        {
            menus=adminService.getMenus(admin1); //getMenus函数里只是取出来 并没有实现排序
        }
        return menus;
    }
    //编辑管理员
    @RequestMapping("/editAdmin/{id}")
    public String editAdmin(HttpServletRequest request, @PathVariable("id") int id)
    {
        Admin admin=adminService.getAdminById(id);
        List<Role> roles=adminService.getRoles();
        request.setAttribute("admin",admin);
        request.setAttribute("roles",roles);
        return "/jsp/admin/editAdmin";
    }
    //更新管理员
    @RequestMapping("/updateAdmin")
    @ResponseBody
    public ResultUtil updateAdmin(Admin admin)
    {
        try
        {
            adminService.updAdmin(admin);
            return ResultUtil.ok();
        }
        catch (Exception e)
        {
            e.printStackTrace();
            return ResultUtil.error();
        }
    }



    //更新管理员
    @RequestMapping("/updAdmin")
    @ResponseBody
    public ResultUtil updAdmin(Admin admin)//这里 前端发送过来的 自动赋值给admin中的同名字段 和之前的一样
    {
       // System.out.println("updAdmin命令进来了");
        if(admin!=null&&admin.getId()==1)
        {
            return ResultUtil.error("不允许修改");
        }
        try //只有查询的时候不需要try catch 更新 删除操作都要捕获异常 会输出错误信息
        {
            //如果sql执行失败 会有捕获异常输出 有可能在server的输出窗口 也有可能在 Tomcat Localhost Log
            adminService.updAdmin(admin);
            return ResultUtil.ok();
        }
        catch (Exception e)
        {
            e.printStackTrace();
            return ResultUtil.error();
        }

    }
//修改密码
    @RequestMapping("/changeAdminPassword")
    @ResponseBody
    public ResultUtil changeAdminPassword(String oldPassword,String newPassword1,String username)
    {
        //System.out.println("猜猜"+username);

        Admin admin=adminService.getAdminByUsername(username);
        if(admin!=null)
        {
            if(admin.getPassword().equals(EncryptUtil.encrypt(oldPassword)))
            {
                admin.setPassword(EncryptUtil.encrypt(newPassword1));
                adminService.updAdmin(admin);
                return ResultUtil.ok();
            }
            else
            {
                return ResultUtil.error("旧密码错误，请重新填写");
            }
        }
        return ResultUtil.error("请求出错！！");
    }




  //删除一个管理员
    @RequestMapping("/delAdminById/{id}")
    @ResponseBody
    public ResultUtil delAdminById(@PathVariable("id") Long id)
    {
        if(id==1)
        {
            return ResultUtil.error();
        }
        try {
            //如果sql执行失败 会有捕获异常输出 有可能在server的输出窗口 也有可能在 Tomcat Localhost Log
            adminService.delAdminById(id);
            return ResultUtil.ok();
        }catch (Exception e)
        {
            e.printStackTrace();
            return ResultUtil.error();
        }
    }
    //检查是否已经存在此用户名
    @RequestMapping("/checkAdminName/{username}")
    @ResponseBody
    public ResultUtil checkAdminName(@PathVariable("username") String username)
    {
        Admin admin=adminService.getAdminByUsername(username);
        if(admin!=null)
        {
            return new ResultUtil(500,"管理员已存在!");
        }
        return new ResultUtil(0);
    }
    //添加新管理员
    @RequestMapping("/insAdmin")
    @ResponseBody
    public ResultUtil insAdmin(Admin admin)
    {
        //如果用上面的语句 有 try catch 那么ajax调用返回成功 不会进入error语句 并且在server
        // 或者Tomcat Localhost Log 窗口有错误输出
        //如果是下面语句 没有 try catch 那么ajax调用返回错误 直接进入error语句 可以提示数据库
        // 错误之类同时 Tomcat Localhost Log 窗口有错误输出

        //如果下面的sql操作有问题 Tomcat Localhost Log 的会输出错误信息
        //并且ajax的不会成功 会调用error中的函数进行提示
        adminService.insAdmin(admin);
        return ResultUtil.ok();
    }
    /****菜单相关******/
    //获取所有菜单
    @RequestMapping("/menuData")
    @ResponseBody
    public ResultUtil menuData()
    {
        List<Menu> list=adminService.getAllMenus();
        ResultUtil resultUtil=new ResultUtil();
        resultUtil.setCode(0);
        resultUtil.setCount(list.size()+0L);
        resultUtil.setData(list);
        return resultUtil;
    }
    //通过Id更新菜单排序
    @RequestMapping("/updMenuSortingById")
    @ResponseBody
    public ResultUtil updMenuSortingById(Long menuId,String sorting)
    {
      // System.out.println("qqq"+menuId);
       // System.out.println("qqww"+sorting);
        Menu menu=new Menu();
        menu.setMenuId(menuId);
        Long sortingL;
        try
        {
            sortingL=Long.parseLong(sorting); //将字符串变成Long
        }
        catch (Exception e)
        {
            e.printStackTrace();
            return ResultUtil.error("修改失败，只允许输入整数");
        }
        menu.setSorting(sortingL);
        adminService.updMenuSortingById(menu);
        return ResultUtil.ok();
    }
    //点击添加菜单后 跳转界面
    @RequestMapping("/toSaveMenu/{menuId}/{menuLevel}")
    public String toSaveMenu(@PathVariable("menuId")Long menuId,
                             @PathVariable("menuLevel")Long menuLevel,Model model)
    {
        //System.out.println("曹操"+menuLevel);
        if(menuId!=null&&menuId!=1)
        {
            Menu menus=new Menu();
            menus.setMenuId(menuId);
            model.addAttribute("menuLevel",menuLevel); //代表添加的是几级菜单
            model.addAttribute("menu",menus);
            model.addAttribute("flag","1"); //因为编辑菜单 添加菜单
            // 都要发送/menuForm 用的都是menuForm.jsp 这里做一个标记 1表示添加菜单
            // 为空 表示编辑当前菜单 "/toEditMenu/{menuId} 中没有没有设置 flag属性
            return "/jsp/menu/menuForm";
        }
        else
        {
            model.addAttribute("msg","不允许操作！");
            return "/jsp/active";
        }

    }
    //点击 编辑菜单 跳转页面
    @RequestMapping("/toEditMenu/{menuId}")
    public String toEditMenu(@PathVariable("menuId")Long menuId,Model model)
    {
        if(menuId!=null&&menuId!=1)
        {
            Menu menus=adminService.getMenuById(menuId);
            model.addAttribute("menu",menus);
            //这里没有设置flag属性 所以flag为空 表示编辑不是添加
            return "/jsp/menu/menuForm";
        }
        else
        {
            model.addAttribute("msg","不允许操作");
            return "/jsp/active";
        }
    }
    //维护菜单信息
    @RequestMapping("/menuForm")
    @ResponseBody
    public ResultUtil menuForm(Menu menus,String flag)
    {
        //System.out.println(menus);

        if(StringUtils.isBlank(flag)) //判断flag 是空或者 null 或者 "    "
            // 表明是编辑当前菜单 不存在判断是不是只能三级菜单的问题
        {

           // List<Menu> data=adminService.checkNameSameLevel(menus); //同级菜单不能重名
           // Menu m=adminService.getMenuById(menus.getMenuId());
           // Boolean f=false;
         //   if(m.getName().equals(menus.getName())||data.size()==0)
           // {
             //   f=true;//没有重名菜单 或者 编辑后的菜单名称和此menuId对应的菜单名一样 通过
            //}
           // if(data.size()>0)
           // {
           //     return ResultUtil.error("同级菜单名不能相同");
          //  }
            menus.setSpread("false");
            adminService.updMenu(menus);
            return ResultUtil.ok("修改成功");
        }
        else if(menus.getMenuId()!=1)  //添加菜单 1是后台首页 固定不能有子菜单
            // 两种情况 情况1：menuId为0 表示添加的是最顶层菜单
            //情况2：menuId为非1 假如是2 我的面板 的复选框被选中
            //情况3：第三级菜单复选框被选中 假如个人信息下面有个菜单  测试菜单 其menuid 111 parentId 3 (个人信息)
        {

            menus.setParentId(menus.getMenuId()); //menuId parentId设成一样 情况1： 0,0  情况2： 2,2  情况3：111,111
            Menu m=adminService.getMenuById(menus.getMenuId());// 情况1 m为空 情况2 读出菜单 我的面板 情况3读出菜单 测试菜单
            if(m!=null&&m.getParentId()!=0)//这就是 选中第三级菜单复选框或者选中第二级菜单复选框的情况
            {
                Menu m1=adminService.getMenuById(m.getParentId()); //获取第二级菜单或者第三级菜单的上级菜单
                if(m1!=null&&m1.getParentId()!=0)//说明是情况3
                {
                    return ResultUtil.error("此菜单不允许添加子菜单");  //固定最多三级菜单
                }

            }
            //情况1 直接到这
            List<Menu> data=adminService.checkNameSameLevel(menus); // sql为select * from menu parentId = #{parentId} and name = #{name}
            //就是判断顶级菜单 二级菜单下有没有重名的菜单
            if(data.size()>0)
            {
                return ResultUtil.error("同级菜单名称不能相同");
            }
            menus.setMenuId(null);//menuId是自增长主键 所以不能设定 插入后自动加1
            menus.setSpread("false"); //默认不展开
            adminService.insMenu(menus);
            return ResultUtil.ok("添加成功");
        }
        else {
               return ResultUtil.error("此菜单不允许操作");
        }
    }
    //根据id删除菜单
    @RequestMapping("/delMenuById/{menuId}")
    @ResponseBody
    public ResultUtil delMenuById(@PathVariable("menuId")Long menuId)
    {
        try
        {
            if(menuId==1)
            {
                return ResultUtil.error("此菜单不允许删除！");
            }
            List<Menu> data=adminService.getMenusByParentId(menuId); //menuId作为其他菜单的parentId查询
            if(data!=null&&data.size()>0)
            {
                return ResultUtil.error("包含子菜单，不允许删除！");
            }
            List<RoleMenu> roleMenus=adminService.getRoleMenuByMenuId(menuId);
            if(roleMenus!=null&&roleMenus.size()>1)
            {
                return ResultUtil.error("此菜单已经分配给此登录角色，请先解除绑定，再尝试删除");
            }
            adminService.delMenuById(menuId);
            return ResultUtil.ok("删除成功");
        }
        catch (Exception e)
        {
            e.printStackTrace();
            return ResultUtil.error("数据库sql有误查看Log输出");
        }
    }



    /********页面跳转*******/
    @RequestMapping("/logOut")
    public ModelAndView loginout(ModelAndView modelAndView,HttpSession session)
            throws ParseException
    {
       // Admin admin= (Admin) session.getAttribute("user");
        //AdminLog adminLog=adminService.getAdminLogByUsername(admin.getUsername());

        Date loginTime= (Date) session.getAttribute("adminloginTime");
        AdminLog adminLog=adminService.getAdminLogByLoginTime(loginTime);

        adminLog.setIsSafeExit(1);

        Date date=new Date();
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String nowTime=simpleDateFormat.format(date);
        Date logoutTime=simpleDateFormat.parse(nowTime);

        adminLog.setLogoutTime(logoutTime);

        adminService.updateAdminLog(adminLog);

        session.invalidate();
        modelAndView.setViewName("redirect:/index.jsp");
        return modelAndView;
    }

    @RequestMapping("/allmain")
    public String index()
    {
        //这个重定向命令 allmain是login.js中发送的 并不是客户端发起的 和以前的不一样
        //这里做了一次转换 下面发送一次请求到 toallmain的方法 然后再打开allmain.jsp
        return "redirect:/admin/toallmain";
    }
    @RequestMapping("/toallmain")
    public String toallmain(ModelAndView modelAndView)
    {
        return "/jsp/allmain";
    }

    @RequestMapping("/main")
    public String getMain()
    {
        return "/jsp/main";
    }
    @RequestMapping("/adminList")
    public String adminList()
    {
        return "/jsp/admin/adminList";
    }
    @RequestMapping("/addAdmin")
    public String addAdmin(HttpSession session)
    {
        List<Role> roles=adminService.getRoles();
        session.setAttribute("roles",roles);
        return "/jsp/admin/addAdmin";
    }
    @RequestMapping("/roleList")
    public String roleList()
    {
        return "/jsp/role/roleList";
    }
    //注意前端ajax发送url格式为   "/admin/editRole?roleId="+data.roleId
    //会把下面函数参数role中的属性roleId 自动赋值
    //之前编辑管理员发送url格式为："/admin/editAdmin/"+data.id  所以处理方式不同
    @RequestMapping("/editRole")
    public String editRole(Role role, Model model)
    {
        role=adminService.getRoleById(role.getRoleId());
        model.addAttribute("role",role);
        return "/jsp/role/editRole";
    }
    @RequestMapping("/addRole")
    public String addRole()
    {
        return "/jsp/role/addRole";
    }

    @RequestMapping("/menuList")
    public String menuList()
    {
        return "/jsp/menu/menuList";
    }

    @RequestMapping("/changePassword")
    public String changePassword()
    {
        return "/jsp/admin/changePassword";
    }
    @RequestMapping("/adminLoginLog")
    public String adminLoginLog()
    {
        return "/jsp/admin/adminLogList";
    }
    @RequestMapping("/register")
    public String register()
    {
        return "/jsp/register/register";
    }

}
