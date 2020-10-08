﻿using System.Collections.Generic;
using System.Threading.Tasks;

namespace NetModular.Module.Common.Infrastructure.AreaCrawlingHandler
{
    /// <summary>
    /// 行政区域数据爬取处理
    /// </summary>
    public interface IAreaCrawlingHandler
    {
        Task<IList<AreaCrawlingModel>> Crawling();
    }
}
