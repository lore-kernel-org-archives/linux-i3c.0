Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E6BCEFC29
	for <linux-i3c@archiver.kernel.org>; Tue,  8 Oct 2024 15:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fNGsKZtvc155SWZ/PdT1wMlyJ1J8aNWl05aQ9ZTpXyI=; b=Q3mXkm8eNTnkj2
	bi/dDVy3NeiDisWfP6p7Nzn2KVrKUxEFew2eU23t+QD3Wf26EbijbyM76v4ZDG+xu+XQ2s2zR1Mwa
	p62CJX8CbmztzbqDc+3drGsWNuwRNMnDAGi05TnfCeWxBct8ut3B24fwYun4dR/8YDQiv6vzQCvvc
	KhZOL0R5n8yfNK2MIQkIbKROEo6kdkvhMM+ZPh8hTJvGRb6urxCFeBqU1cJONoIC2cLTF6dRMGBxQ
	koDnQ6e0PQA5uPFWbb7dOT0M2MftRaHd/ycMntpYlnlQrcq8OMZZZdfHnIt5QQ9/1Sgj2b6KqRdag
	d1wnouRvyjg6uM3I51cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syCW8-00000006Po4-1dJv;
	Tue, 08 Oct 2024 15:52:56 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy02A-00000004Iog-1Mv2
	for linux-i3c@lists.infradead.org;
	Tue, 08 Oct 2024 02:33:11 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4XN0S04dSvz1ympL;
	Tue,  8 Oct 2024 10:33:04 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 734191401F1;
	Tue,  8 Oct 2024 10:33:00 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemh500013.china.huawei.com (7.202.181.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 8 Oct 2024 10:32:59 +0800
Message-ID: <a192a264-e7d8-3a3b-7bcc-60975102fcc6@huawei.com>
Date: Tue, 8 Oct 2024 10:32:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2] i3c: master: svc: Fix pm_runtime_set_suspended() with
 runtime pm enabled
To: <miquel.raynal@bootlin.com>, <conor.culhane@silvaco.com>,
	<alexandre.belloni@bootlin.com>, <xiaoning.wang@nxp.com>, <jun.li@nxp.com>,
	<linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20240930091913.2545510-1-ruanjinjie@huawei.com>
Content-Language: en-US
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20240930091913.2545510-1-ruanjinjie@huawei.com>
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemh500013.china.huawei.com (7.202.181.146)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_193310_640283_97C43CE6 
X-CRM114-Status: GOOD (  12.18  )
X-Mailman-Approved-At: Tue, 08 Oct 2024 08:52:51 -0700
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Ping.

On 2024/9/30 17:19, Jinjie Ruan wrote:
> It is not valid to call pm_runtime_set_suspended() for devices
> with runtime PM enabled because it returns -EAGAIN if it is enabled
> already and working. So, call pm_runtime_disable() before to fix it.
> 
> Cc: stable@vger.kernel.org # v5.17
> Fixes: 05be23ef78f7 ("i3c: master: svc: add runtime pm support")
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
> v2:
> - Add Reviewed-by.
> - Add stable tag as Miquel suggested.
> ---
>  drivers/i3c/master/svc-i3c-master.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
> index a7bfc678153e..130cec4ee307 100644
> --- a/drivers/i3c/master/svc-i3c-master.c
> +++ b/drivers/i3c/master/svc-i3c-master.c
> @@ -1827,8 +1827,8 @@ static int svc_i3c_master_probe(struct platform_device *pdev)
>  rpm_disable:
>  	pm_runtime_dont_use_autosuspend(&pdev->dev);
>  	pm_runtime_put_noidle(&pdev->dev);
> -	pm_runtime_set_suspended(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
> +	pm_runtime_set_suspended(&pdev->dev);
>  
>  err_disable_clks:
>  	svc_i3c_master_unprepare_clks(master);

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
