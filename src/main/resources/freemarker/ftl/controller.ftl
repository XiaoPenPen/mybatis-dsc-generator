package ${controllerUrl};

import ${entityUrl}.${entityName};
import ${serviceUrl}.${entityName}Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
<#if isSwagger=="true" >
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
</#if>
/**
 * @author: ${author}
 * @time    ${createTime}
 *
 */
 <#if isSwagger=="true" >
@Api(description = "${entityComment}",value="${entityComment}" )
</#if>
@RestController
@RequestMapping("/${objectName}")
public class ${entityName}Controller{

    @Autowired
    private ${entityName}Service ${entityNameLow}Service;

    /**
     * 新增
     */
    @PostMapping("/${entityNameLow}")
    <#if isSwagger=="true" >
    @ApiOperation(value = "新增")
    </#if>
    public Result insert(@RequestBody ${entityName} ${entityNameLow}){
        ${entityNameLow}Service.save(${entityNameLow});
        return Result.init(${entityNameLow});
    }

    /**
     * 批量删除
     * @param   ${entityNameLow}Ids
     */
    @DeleteMapping("/${entityNameLow}")
    <#if isSwagger=="true" >
    @ApiOperation(value = "批量删除")
    </#if>
    public Result delete(@RequestParam List<String> ${entityNameLow}Ids){
        ${entityNameLow}Service.removeByIds(${entityNameLow}Ids);
        return Result.init();
    }

    /**
    * 删除单个
    * @param   ${entityNameLow}Id
    */
    @DeleteMapping("/${entityNameLow}/{${entityNameLow}Id}")
    <#if isSwagger=="true" >
    @ApiOperation(value = "删除单个")
    </#if>
    public Result deleteById(@PathVariable String ${entityNameLow}Id){
        ${entityNameLow}Service.removeById(${entityNameLow}Id);
        return Result.init();
    }

    /**
    * 修改
    * @param   ${entityNameLow}
    */
    @PutMapping("/${entityNameLow}")
    <#if isSwagger=="true" >
    @ApiOperation(value = "修改")
    </#if>
    public Result update(@RequestBody ${entityName} ${entityNameLow}){
        ${entityNameLow}Service.updateById(${entityNameLow});
        return Result.init();
    }

    /**
    * 查询列表
    * @param
    */
    @GetMapping("/${entityNameLow}s")
    <#if isSwagger=="true" >
    @ApiOperation(value = "查询列表")
    </#if>
    public Result list${entityName}s(@RequestParam @ApiParam("当前页码") Integer pageIndex, @RequestParam @ApiParam("当前页大小") Integer pageSize){
        IPage page = ${entityNameLow}Service.getBaseMapper().selectPage(new Page<>(pageIndex, pageSize), null);
        return Result.init(page);
    }

    /**
    * 查询单个
    * @param
    */
    @GetMapping("/${entityNameLow}/{${entityNameLow}Id}")
    <#if isSwagger=="true" >
    @ApiOperation(value = "查询单个")
    </#if>
    public Result get(@PathVariable String ${entityNameLow}Id){
        ${entityName} ${entityNameLow} = ${entityNameLow}Service.getById(${entityNameLow}Id);
        return Result.init(${entityNameLow});
    }


}