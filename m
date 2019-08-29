Return-Path: <SRS0=0Lh8=WZ=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EC5AC3A59F
	for <linux-i3c@archiver.kernel.org>; Thu, 29 Aug 2019 10:45:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7442D2189D
	for <linux-i3c@archiver.kernel.org>; Thu, 29 Aug 2019 10:45:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pfjYDees"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7442D2189D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fEmgBumlL5PSPDbETeEr8phL6zp1Gm5XMM5Eq+XLazI=; b=pfjYDeesozVHKM
	rhWEI7/cAostNblOUR4PU3fjV6S9Y7rx2b9j0qzNn8FE8EEpmK+UdQ0i2enn81ZoiJjB0lO5YcHn/
	Yk5P/Beb2Xevw/xJ4H7FTMMrh5NdMoJsVecTW+i7cBvmDzY5zlA9aRVxuJp0c4q08lC2oCYQzlJG3
	2ve/aiV4GVVVkQFk53FubDi+qJUN/g+kGUwmMeu4BWcYkqULt7gLYo1nSluOrMiEBdVQwG5wGDrD6
	1Vg0BvlSF8yW6N3UzCjkHUHAPxQQ7CNPjFf/10tNKE8UUG0a32PcWCzcQqnvLVRK5SPmyYBE+snGv
	GQ3uszyQDBXw+oyycI2w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3HvR-0006WO-5j; Thu, 29 Aug 2019 10:45:09 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3HvO-0005oA-Kj
 for linux-i3c@lists.infradead.org; Thu, 29 Aug 2019 10:45:08 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 85BB928626E;
 Thu, 29 Aug 2019 11:45:02 +0100 (BST)
Date: Thu, 29 Aug 2019 12:44:57 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: [PATCH 2/4] i3c: master: Check if devices have
 i3c_dev_boardinfo on i3c_master_add_i3c_dev_locked()
Message-ID: <20190829124457.3a750932@collabora.com>
In-Reply-To: <3e21481ddf53ea58f5899df6ec542b79b8cbcd68.1567071213.git.vitor.soares@synopsys.com>
References: <cover.1567071213.git.vitor.soares@synopsys.com>
 <3e21481ddf53ea58f5899df6ec542b79b8cbcd68.1567071213.git.vitor.soares@synopsys.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190829_034506_824004_FB3A0CC8 
X-CRM114-Status: GOOD (  18.26  )
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
 bbrezillon@kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-i3c@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Thu, 29 Aug 2019 12:19:33 +0200
Vitor Soares <Vitor.Soares@synopsys.com> wrote:

> The I3C devices described in DT might not be attached to the master which
> doesn't allow to assign a specific dynamic address.

I remember testing this when developing the framework, so, unless
another patch regressed it, it should already work. I suspect patch 1
is actually the regressing this use case.

> 
> This patch check if a device has i3c_dev_boardinfo and add it to
> i3c_dev_desc structure. In this conditions, the framework will try to
> assign the i3c_dev_boardinfo->init_dyn_addr even if stactic address = 0.
> 
> Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
> ---
>  drivers/i3c/master.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 4d29e1f..85fbda6 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -1795,6 +1795,23 @@ i3c_master_search_i3c_dev_duplicate(struct i3c_dev_desc *refdev)
>  	return NULL;
>  }
>  
> +static struct i3c_dev_boardinfo *
> +i3c_master_search_i3c_boardinfo(struct i3c_dev_desc *dev)
> +{
> +	struct i3c_master_controller *master = i3c_dev_get_master(dev);
> +	struct i3c_dev_boardinfo *boardinfo;
> +
> +	if (dev->boardinfo)
> +		return NULL;
> +
> +	list_for_each_entry(boardinfo, &master->boardinfo.i3c, node) {
> +		if (dev->info.pid == boardinfo->pid)
> +			return boardinfo;
> +	}
> +
> +	return NULL;
> +}
> +
>  /**
>   * i3c_master_add_i3c_dev_locked() - add an I3C slave to the bus
>   * @master: master used to send frames on the bus
> @@ -1816,6 +1833,7 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
>  {
>  	struct i3c_device_info info = { .dyn_addr = addr };
>  	struct i3c_dev_desc *newdev, *olddev;
> +	struct i3c_dev_boardinfo *boardinfo;
>  	u8 old_dyn_addr = addr, expected_dyn_addr;
>  	struct i3c_ibi_setup ibireq = { };
>  	bool enable_ibi = false;
> @@ -1875,6 +1893,10 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
>  	if (ret)
>  		goto err_detach_dev;
>  
> +	boardinfo = i3c_master_search_i3c_boardinfo(newdev);
> +	if (boardinfo)
> +		newdev->boardinfo = boardinfo;
> +
>  	/*
>  	 * Depending on our previous state, the expected dynamic address might
>  	 * differ:


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
