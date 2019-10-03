Return-Path: <SRS0=2ljA=X5=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE1BBC4360C
	for <linux-i3c@archiver.kernel.org>; Fri,  4 Oct 2019 20:32:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D08D222C4
	for <linux-i3c@archiver.kernel.org>; Fri,  4 Oct 2019 20:32:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HL2/Hqfy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D08D222C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QeLbCj0vjmXJIcPdtGCnefJgFQp26ef4UUzO2pb0eG4=; b=HL2/Hqfy/ReC5v
	yuhMPd86C7BL+hKd8CJw3oGZ8Yke20RAEFvbTWkDTH1lUYeBvZL4qKZhRdJAT9Mi3FZBTeQahpmWN
	vrZkHhtoOW2UBN9VNhbaAEiO7fNJYsjfYtt57pHNRlfkVKkIppFa8/x6z/AUEODCd01RRTkC0O/lK
	MAxhecaKd8/6KpG27Rl5UB8Xn/l/rtHRFjol9Y4AGVrWd1hGKNBryc/5d9yo8lCfPXWk57u8kzOOY
	K8StfLfh3WJocSiS1/cDdyLqC2Cs/TyaIVZcZeZAUFP9pyBZBxQuXOUyoC99k7+EcTHxOx5HeZdlh
	plfNuHPjCopw9smfSXyQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iGUFS-0002Z8-5K; Fri, 04 Oct 2019 20:32:22 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iG27A-0008JJ-T6
 for linux-i3c@lists.infradead.org; Thu, 03 Oct 2019 14:29:58 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbrezillon) with ESMTPSA id 33AF328E8BE
Date: Thu, 3 Oct 2019 16:29:43 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: [PATCH v3 2/5] i3c: master: make sure ->boardinfo is
 initialized in add_i3c_dev_locked()
Message-ID: <20191003162943.4a0d0274@collabora.com>
In-Reply-To: <ed18fd927b5759a6a1edb351113ceca615283189.1567608245.git.vitor.soares@synopsys.com>
References: <cover.1567608245.git.vitor.soares@synopsys.com>
 <ed18fd927b5759a6a1edb351113ceca615283189.1567608245.git.vitor.soares@synopsys.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191003_072957_198983_609C55DD 
X-CRM114-Status: GOOD (  20.37  )
X-Mailman-Approved-At: Fri, 04 Oct 2019 13:32:20 -0700
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Joao.Pinto@synopsys.com,
 bbrezillon@kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 pgaj@cadence.com, robh+dt@kernel.org, linux-i3c@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Thu,  5 Sep 2019 12:00:35 +0200
Vitor Soares <Vitor.Soares@synopsys.com> wrote:

> The newdev->boardinfo assignment was missing in
> i3c_master_add_i3c_dev_locked() and hence the ->of_node info isn't
> propagated to i3c_dev_desc.
> 
> Fix this by trying to initialize device i3c_dev_boardinfo if available.
> 
> Cc: <stable@vger.kernel.org>
> Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
> Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
> ---
> Change in v3:
>   - None
> 
> Changes in v2:
>   - Change commit message
>   - Change i3c_master_search_i3c_boardinfo(newdev) to
>   i3c_master_init_i3c_dev_boardinfo(newdev)
>   - Add fixes, stable tags
> 
>  drivers/i3c/master.c | 27 +++++++++++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 586e34f..9fb99bc 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -1798,6 +1798,22 @@ i3c_master_search_i3c_dev_duplicate(struct i3c_dev_desc *refdev)
>  	return NULL;
>  }
>  
> +static void i3c_master_init_i3c_dev_boardinfo(struct i3c_dev_desc *dev)
> +{
> +	struct i3c_master_controller *master = i3c_dev_get_master(dev);
> +	struct i3c_dev_boardinfo *boardinfo;
> +
> +	if (dev->boardinfo)
> +		return;
> +
> +	list_for_each_entry(boardinfo, &master->boardinfo.i3c, node) {
> +		if (dev->info.pid == boardinfo->pid) {
> +			dev->boardinfo = boardinfo;
> +			return;
> +		}
> +	}
> +}
> +
>  /**
>   * i3c_master_add_i3c_dev_locked() - add an I3C slave to the bus
>   * @master: master used to send frames on the bus
> @@ -1818,8 +1834,9 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
>  				  u8 addr)
>  {
>  	struct i3c_device_info info = { .dyn_addr = addr };
> -	struct i3c_dev_desc *newdev, *olddev;
>  	u8 old_dyn_addr = addr, expected_dyn_addr;
> +	enum i3c_addr_slot_status addrstatus;
> +	struct i3c_dev_desc *newdev, *olddev;
>  	struct i3c_ibi_setup ibireq = { };
>  	bool enable_ibi = false;
>  	int ret;
> @@ -1878,6 +1895,8 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
>  	if (ret)
>  		goto err_detach_dev;
>  
> +	i3c_master_init_i3c_dev_boardinfo(newdev);
> +
>  	/*
>  	 * Depending on our previous state, the expected dynamic address might
>  	 * differ:
> @@ -1895,7 +1914,11 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
>  	else
>  		expected_dyn_addr = newdev->info.dyn_addr;
>  
> -	if (newdev->info.dyn_addr != expected_dyn_addr) {
> +	addrstatus = i3c_bus_get_addr_slot_status(&master->bus,
> +						  expected_dyn_addr);
> +
> +	if (newdev->info.dyn_addr != expected_dyn_addr &&
> +	    addrstatus == I3C_ADDR_SLOT_FREE) {

First, this change shouldn't be part of this patch, since the commit
message only mentions the boardinfo init stuff, not the extra 'is slot
free check'. Plus, I want the fix to be backported so we should avoid
any unneeded deps.

But even with those 2 things addressed, I'm still convinced the
'free desc when device is not reachable' change you do in patch 1 is
not that great, and the fact that you can't pre-reserve the address to
make sure no one uses it until the device had a chance to show up tends
to prove me right.

Can we please do what I suggest and solve the "not enough dev slots"
problem later on (if we really have to).

>  		/*
>  		 * Try to apply the expected dynamic address. If it fails, keep
>  		 * the address assigned by the master.


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
