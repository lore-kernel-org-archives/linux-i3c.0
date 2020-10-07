Return-Path: <SRS0=zTQb=DO=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89C29C47095
	for <linux-i3c@archiver.kernel.org>; Wed,  7 Oct 2020 13:15:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06D6821775
	for <linux-i3c@archiver.kernel.org>; Wed,  7 Oct 2020 13:15:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="z7XT62i3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06D6821775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=to8f294yJ/STJ07YrtkSkMcRLRWIIwbUKQ7GUt49HP0=; b=z7XT62i3dfwmk/9q5j7C/CX5b
	0Kc0uCdxYo3sWIOUgwqPlKUq64mh3iKHFOHM62EacnUnG4pSXOfFQ9ZhfaTbVMIEioe1YAJbhqSyZ
	qAGeJhkil9dFQYBtxLkiyHW7MHiFgRsQg2orDQ5MRg3yRgZ3Q0njvbWv02AjNZ0l6kt1KzYudekwK
	GwMtZWpesnFVOiKErSD5BAFH3gMV+6IaYdwjstijE8cTTrKS/VkzWbfJYS3y9jxVf+tM8Nd/Z9lCK
	iJEHbtkSrXzIr2L0+duJpbNucl65X+u0Nj7oZXT4yp28MO6vUYh/qffWuEEmBXV9njmWgK4oEQsA+
	HrHy/3KxA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQ9IE-00016j-6G; Wed, 07 Oct 2020 13:15:42 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQ9IB-00015w-Rj
 for linux-i3c@lists.infradead.org; Wed, 07 Oct 2020 13:15:40 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 6380E28ADDD;
 Wed,  7 Oct 2020 14:15:37 +0100 (BST)
Date: Wed, 7 Oct 2020 15:15:34 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Jing Xiangfeng <jingxiangfeng@huawei.com>
Subject: Re: [PATCH] i3c: master: Fix error return in cdns_i3c_master_probe()
Message-ID: <20201007151534.6fd4d5d7@collabora.com>
In-Reply-To: <20200911033350.23904-1-jingxiangfeng@huawei.com>
References: <20200911033350.23904-1-jingxiangfeng@huawei.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201007_091539_986587_F43A8B39 
X-CRM114-Status: GOOD (  16.79  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: linux-kernel@vger.kernel.org, pgaj@cadence.com,
 linux-i3c@lists.infradead.org, bbrezillon@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Fri, 11 Sep 2020 11:33:50 +0800
Jing Xiangfeng <jingxiangfeng@huawei.com> wrote:

> Fix to return negative error code -ENOMEM from the error handling
> case instead of 0.
> 
> Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>

Queued to i3c/next.

Thanks,

Boris

> ---
>  drivers/i3c/master/i3c-master-cdns.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
> index 3fee8bd7fe20..3f2226928fe0 100644
> --- a/drivers/i3c/master/i3c-master-cdns.c
> +++ b/drivers/i3c/master/i3c-master-cdns.c
> @@ -1635,8 +1635,10 @@ static int cdns_i3c_master_probe(struct platform_device *pdev)
>  	master->ibi.slots = devm_kcalloc(&pdev->dev, master->ibi.num_slots,
>  					 sizeof(*master->ibi.slots),
>  					 GFP_KERNEL);
> -	if (!master->ibi.slots)
> +	if (!master->ibi.slots) {
> +		ret = -ENOMEM;
>  		goto err_disable_sysclk;
> +	}
>  
>  	writel(IBIR_THR(1), master->regs + CMD_IBI_THR_CTRL);
>  	writel(MST_INT_IBIR_THR, master->regs + MST_IER);


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
