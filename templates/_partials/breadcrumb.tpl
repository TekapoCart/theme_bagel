<nav id="crumb" data-depth="{$breadcrumb.count}" {*class="hidden-sm-down"*}>
    <!--products / Collection / H.A.N.D-->
    <ol itemscope itemtype="http://schema.org/BreadcrumbList">
        {foreach from=$breadcrumb.links item=path name=breadcrumb}
            {block name='breadcrumb_item'}
                {if $smarty.foreach.breadcrumb.last}
                    {*<span itemprop="name">{$path.title}</span>*}
                {else}
                    <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
                        <a itemprop="item" href="{$path.url}"><span itemprop="name">{$path.title}</span></a>
                        /
                        <meta itemprop="position" content="{$smarty.foreach.breadcrumb.iteration}">
                    </li>
                {/if}
            {/block}
        {/foreach}
    </ol>
</nav>