Return-Path: <SRS0=0Lh8=WZ=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EC9BC3A59F
	for <linux-i3c@archiver.kernel.org>; Thu, 29 Aug 2019 11:15:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5449C22CF5
	for <linux-i3c@archiver.kernel.org>; Thu, 29 Aug 2019 11:15:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W3qso+GP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5449C22CF5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cZBnzkdeOyiQ03g2DKI+/Uh+DetLWiNEi7ZharmvhCY=; b=W3qso+GPhaYk0O
	gCvnZjRA/RdCmtN+3uMN/mIln6CeSmD/bqeVVP5Big3C6NczDIxW91+nv/rmrLheNRgGsuJkSV+gF
	9oSGhDIwQ12txLT9StfIdVxOkbgdDfkT9hqLYpYxDSiOVwwh2Y6acVmZGXkyhA4ioxO79F6kMu/4h
	Hq3c/L8fw2L7+gEB0famOqebau0C3//kO3txCcqsxpPAMfyDKs2s5AgSs5fnKRPOFMXDKogv5g/QO
	9YR5VBBBV27YUQiXO024y4j+U7mUY/rzhPzu3d0BFPmmMJ4bzxnMeFsh3251noTT8XjQLeTJ7Hs1n
	5eKwUjqGbVQ8cP4vu8+Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3IOn-0008UE-VL; Thu, 29 Aug 2019 11:15:29 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3IOl-0008Tq-LX
 for linux-i3c@lists.infradead.org; Thu, 29 Aug 2019 11:15:29 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 18C5527900A;
 Thu, 29 Aug 2019 12:15:24 +0100 (BST)
Date: Thu, 29 Aug 2019 13:15:19 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: [PATCH 4/4] i3c: master: dw: reattach device on first available
 location of address table
Message-ID: <20190829131519.3f420c64@collabora.com>
In-Reply-To: <e03fb41054a8431b27cc84c3d83ada9464172ef7.1567071213.git.vitor.soares@synopsys.com>
References: <cover.1567071213.git.vitor.soares@synopsys.com>
 <e03fb41054a8431b27cc84c3d83ada9464172ef7.1567071213.git.vitor.soares@synopsys.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190829_041527_936930_79552AB7 
X-CRM114-Status: GOOD (  15.58  )
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

On Thu, 29 Aug 2019 12:19:35 +0200
Vitor Soares <Vitor.Soares@synopsys.com> wrote:

> For today the reattach function only update the device address on the
> controller.
> 
> Update the location to the first available too, will optimize the
> enumeration process avoiding additional checks to keep the available
> positions on address table consecutive.

Given the number of available slots I honestly don't think it makes a
difference, but I also don't mind this change, so

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> 
> Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
> ---
>  drivers/i3c/master/dw-i3c-master.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 1d83c97..62261ac 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -898,6 +898,22 @@ static int dw_i3c_master_reattach_i3c_dev(struct i3c_dev_desc *dev,
>  	struct dw_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
>  	struct i3c_master_controller *m = i3c_dev_get_master(dev);
>  	struct dw_i3c_master *master = to_dw_i3c_master(m);
> +	int pos;
> +
> +	pos = dw_i3c_master_get_free_pos(master);
> +
> +	if (data->index > pos && pos > 0) {
> +		writel(0,
> +		       master->regs +
> +		       DEV_ADDR_TABLE_LOC(master->datstartaddr, data->index));
> +
> +		master->addrs[data->index] = 0;
> +		master->free_pos |= BIT(data->index);
> +
> +		data->index = pos;
> +		master->addrs[pos] = dev->info.dyn_addr;
> +		master->free_pos &= ~BIT(pos);
> +	}
>  
>  	writel(DEV_ADDR_TABLE_DYNAMIC_ADDR(dev->info.dyn_addr),
>  	       master->regs +


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
