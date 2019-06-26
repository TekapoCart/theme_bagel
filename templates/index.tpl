{extends file=$layout}

{block name='content'}
    {block name='hook_home'}
        {$HOOK_HOME nofilter}
    {/block}
{/block}