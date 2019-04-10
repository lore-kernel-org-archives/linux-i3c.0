Return-Path: <SRS0=MhNy=SM=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAD10C10F11
	for <linux-i3c@archiver.kernel.org>; Wed, 10 Apr 2019 10:38:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A691E20830
	for <linux-i3c@archiver.kernel.org>; Wed, 10 Apr 2019 10:38:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bgfO0ikN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A691E20830
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cm/PA0tx54jRupLr3/3HmJeUY7MGnu0qL9zs/hcBQEE=; b=bgfO0ikNISuppZ
	iUpLCN368PMeH+brJpNpVJ0SPz+TwJEGfIN6/01qEXhTjnEue27dNhFLip/xMzae77pZUOszirM2e
	35mQ5Bbj6vcb9Xin1mxchDKdt9bpRt5JaMR9FF9JSjL1Evvcq6yUDG7kWXutGagEO436GaGFtl6tl
	HoZ0+75gg2svH3/bUyosu8J75BV7GoVHmo4Evyv/zQ7tS3YLe59ly1Ck3BNBsS+7bjZSsh1qBzVg1
	9AMc4MHVNoO79wCr30sHhb20wGv4vgHBR2OEI2AnUHFCtFRv0SLuzxNQNw2N85IXqPx9bNY5eTxw+
	Oy/Ez1kla5GJwRC8ZsOQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEAcr-0004eU-Hf; Wed, 10 Apr 2019 10:38:41 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEAcH-0003zi-3n
 for linux-i3c@lists.infradead.org; Wed, 10 Apr 2019 10:38:28 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 8CC67260667;
 Wed, 10 Apr 2019 11:38:03 +0100 (BST)
Date: Wed, 10 Apr 2019 12:37:59 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Vitor Soares <vitor.soares@synopsys.com>
Subject: Re: [PATCH] i3c: Fix the verification of random PID
Message-ID: <20190410123759.4fbee94f@collabora.com>
In-Reply-To: <f787c7ac5a4a82624b1711b9eba2a2a1d4cf5b58.1554828338.git.vitor.soares@synopsys.com>
References: <f787c7ac5a4a82624b1711b9eba2a2a1d4cf5b58.1554828338.git.vitor.soares@synopsys.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190410_033805_661667_6D2BBB17 
X-CRM114-Status: GOOD (  16.10  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: linux-i3c@lists.infradead.org, joao.pinto@synopsys.com,
 stable@vger.kernel.org, Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Tue,  9 Apr 2019 18:59:59 +0200
Vitor Soares <vitor.soares@synopsys.com> wrote:

> The validation of random PID should be done by checking the
> boardinfo->pid instead of info.pid which is empty.
> 
> Doing the change the info struture declaration is no longer necessary.
> 
> Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
> Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
> 
Note for you future contributions: please don't add a blank line
between Cc and SoB/Fixes lines.

> Cc: Boris Brezillon <bbrezillon@kernel.org>
> Cc: <stable@vger.kernel.org>
> ---
>  drivers/i3c/master.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 569ea68..d23a57e 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -2006,7 +2006,6 @@ of_i3c_master_add_i3c_boardinfo(struct i3c_master_controller *master,
>  {
>  	struct i3c_dev_boardinfo *boardinfo;
>  	struct device *dev = &master->dev;
> -	struct i3c_device_info info = { };
>  	enum i3c_addr_slot_status addrstatus;
>  	u32 init_dyn_addr = 0;
>  
> @@ -2038,8 +2037,8 @@ of_i3c_master_add_i3c_boardinfo(struct i3c_master_controller *master,
>  
>  	boardinfo->pid = ((u64)reg[1] << 32) | reg[2];
>  
> -	if ((info.pid & GENMASK_ULL(63, 48)) ||
> -	    I3C_PID_RND_LOWER_32BITS(info.pid))
> +	if ((boardinfo->pid & GENMASK_ULL(63, 48)) ||
> +	    I3C_PID_RND_LOWER_32BITS(boardinfo->pid))
>  		return -EINVAL;
>  
>  	boardinfo->init_dyn_addr = init_dyn_addr;


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
