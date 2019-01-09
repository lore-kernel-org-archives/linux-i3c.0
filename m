Return-Path: <SRS0=kSke=PR=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E89FC43387
	for <linux-i3c@archiver.kernel.org>; Wed,  9 Jan 2019 17:49:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11FAA206BA
	for <linux-i3c@archiver.kernel.org>; Wed,  9 Jan 2019 17:49:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d4BbrwdD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="WByuLxyk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11FAA206BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jYhl5Ss7aM5UbGSCWresrvfIOtQweoTwrpaASCXcZu8=; b=d4BbrwdDhAfNSP
	hUUKb0GipX1dBSJNJv/NDWd5Jo13BDsvNNK45Omg2trumMNPkMNwm/Eyp5M28G7Cbbesu6N3wVdZB
	7zpFgCLw41JC6wKQDA35Sqo5GqMzywT7oiZnw433/wYOuRpKV8Ivi+f5z+21m99eMS2HtCrzvB7r4
	Ga6lTcIMbsyfr8yE1eiRuk0olPGzEsRn7K/ELGjzJ1Rr7ALIEYwdEYEyT3NeJGd9k3S2aAp0waSSs
	ltziMpXW4gAj5fz0mb6k5+klZu9flmHratj010VMfSjOxoWOma9362raYvZOEowKIUTANFm4h1c/S
	loTc6wt64zYWxFXssucQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghHyN-0002V7-L8; Wed, 09 Jan 2019 17:48:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghHyJ-0002Um-BX
 for linux-i3c@lists.infradead.org; Wed, 09 Jan 2019 17:48:59 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6BAF120665;
 Wed,  9 Jan 2019 17:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1547056134;
 bh=5RkBrQb9PJWOsw1gY+/zxyE1AyRvmlXt2AljzShcv6w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WByuLxykLARlVmEsrzlPrHtJcG9MyxMdKKZHUZ5pqWGrBco3AmWhDS9XNY+v8Azq5
 0heempn/Le87jqYjlaPyjUc94AWBJGb+mM0JJyNNimDnNyykFbG9xwTbpNHg4p13o8
 x23B8dZU/kRDUzfAJqEX1ull6KGlQhmoI9y93R34=
Date: Wed, 9 Jan 2019 18:48:46 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Vitor Soares <vitor.soares@synopsys.com>
Subject: Re: [PATCH] i3c: master: dw-i3c-master: fix i3c_attach/reatach
Message-ID: <20190109184846.56c75c3f@bbrezillon>
In-Reply-To: <2e33e1f72db978f77ced019ae085c972050ca4e9.1547040890.git.vitor.soares@synopsys.com>
References: <2e33e1f72db978f77ced019ae085c972050ca4e9.1547040890.git.vitor.soares@synopsys.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190109_094855_508016_CAA1BBB2 
X-CRM114-Status: GOOD (  14.76  )
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
Cc: linux-i3c@lists.infradead.org, joao.pinto@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Wed,  9 Jan 2019 15:58:05 +0100
Vitor Soares <vitor.soares@synopsys.com> wrote:

> This patch fix i3c attach/reatach functions.
> 
> During the i3c_attach the driver doesn't threat the static address used for

					   ^treat?

> SETDASA CCC command.

Or maybe

"
During the i3c_attach the driver *ignores* the static address used for ...
"

> 
> During the i3c_reatach the driver doesn't update master->addrs[data->index] with

		 ^reattach

> new address if old_dyn_addr = 0.
> 

Missing Fixes tag here:

Fixes: 1dd728f5d4d4 ("i3c: master: Add driver for Synopsys DesignWare IP")

> Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
> ---
>  drivers/i3c/master/dw-i3c-master.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index b532e2c..b84acbc 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -901,9 +901,6 @@ static int dw_i3c_master_reattach_i3c_dev(struct i3c_dev_desc *dev,
>  	       master->regs +
>  	       DEV_ADDR_TABLE_LOC(master->datstartaddr, data->index));
>  
> -	if (!old_dyn_addr)
> -		return 0;
> -
>  	master->addrs[data->index] = dev->info.dyn_addr;
>  
>  	return 0;
> @@ -925,11 +922,11 @@ static int dw_i3c_master_attach_i3c_dev(struct i3c_dev_desc *dev)
>  		return -ENOMEM;
>  
>  	data->index = pos;
> -	master->addrs[pos] = dev->info.dyn_addr;
> +	master->addrs[pos] = dev->info.dyn_addr ?: dev->info.static_addr;

						^ add a space between '?' and ':'

>  	master->free_pos &= ~BIT(pos);
>  	i3c_dev_set_master_data(dev, data);
>  
> -	writel(DEV_ADDR_TABLE_DYNAMIC_ADDR(dev->info.dyn_addr),
> +	writel(DEV_ADDR_TABLE_DYNAMIC_ADDR(master->addrs[pos]),
>  	       master->regs +
>  	       DEV_ADDR_TABLE_LOC(master->datstartaddr, data->index));
>  


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
