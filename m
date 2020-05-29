Return-Path: <SRS0=lAkP=7L=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MISSING_HEADERS,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4338C433E0
	for <linux-i3c@archiver.kernel.org>; Fri, 29 May 2020 14:42:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B01DC20776
	for <linux-i3c@archiver.kernel.org>; Fri, 29 May 2020 14:42:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MsM9mN+o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B01DC20776
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:From:Date:Reply-To:To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zNSct/+7xsbvNgNrmgU23NtIHurY+OwGR7l7qI3Idx8=; b=MsM9mN+oB+T1IX
	GDWGwmGGM+TsUpkcZi5JGGrO/oGbGAPawcNod/LzLmwNjVrGvEMcoR+wRn2e+rkps5Icr7S2BShJo
	cwonlL3VZNy32EXDTa/DTNRXKH/qka444W/izD4jD63bPs/apXoPocBqCL96pkEkWZRfVEJh0G3O+
	48y8W8Se7huRFeteJn/wD9csbar6v7AXDacBF6StDu4ylXy9RDEL87jRy6KdxAkOXNriUGW+aZvBq
	5Ou0a8d7UBNbCj1tF8Lwcgq5sMeWa4yNd8IAaby5PYp7CWzWYTRkb0Q58N6+7+LzmZMjDl8D6nlHG
	4u9mOp9K4GI3mduxfLJw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jegDI-0007Gw-L9; Fri, 29 May 2020 14:42:24 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jegDG-0007GK-5i
 for linux-i3c@lists.infradead.org; Fri, 29 May 2020 14:42:23 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C252C2A466D;
 Fri, 29 May 2020 15:42:17 +0100 (BST)
Date: Fri, 29 May 2020 16:42:14 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2 1/2] i3c: master add i3c_master_attach_boardinfo to
 preserve boardinfo
Message-ID: <20200529164214.49ba670c@collabora.com>
In-Reply-To: <1590053542-389-1-git-send-email-pthombar@cadence.com>
References: <1590053467-32079-1-git-send-email-pthombar@cadence.com>
 <1590053542-389-1-git-send-email-pthombar@cadence.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_074222_339237_65A51399 
X-CRM114-Status: GOOD (  17.45  )
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
Cc: mparab@cadence.com, bbrezillon@kernel.org, praneeth@ti.com,
 Parshuram Thombare <pthombar@cadence.com>, linux-kernel@vger.kernel.org,
 vitor.soares@synopsys.com, pgaj@cadence.com, linux-i3c@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Thu, 21 May 2020 11:32:22 +0200
Parshuram Thombare <pthombar@cadence.com> wrote:

> Boardinfo was lost if I3C object for devices with boardinfo
> available are not created or not added to the I3C device list
> because of some failure e.g. SETDASA failed, retrieve info failed etc
> This patch adds i3c_master_attach_boardinfo which scan boardinfo list
> in the master object and 'attach' it to the I3C device object.
> 
> Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
> Signed-off-by: Parshuram Thombare <pthombar@cadence.com>

This patch looks good to me. I'll apply it just after the merge window.

> ---
>  drivers/i3c/master.c | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 5f4bd52121fe..3d995f247cb7 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -1776,6 +1776,21 @@ static void i3c_master_bus_cleanup(struct i3c_master_controller *master)
>  	i3c_master_detach_free_devs(master);
>  }
>  
> +static void i3c_master_attach_boardinfo(struct i3c_dev_desc *i3cdev)
> +{
> +	struct i3c_master_controller *master = i3cdev->common.master;
> +	struct i3c_dev_boardinfo *i3cboardinfo;
> +
> +	list_for_each_entry(i3cboardinfo, &master->boardinfo.i3c, node) {
> +		if (i3cdev->info.pid != i3cboardinfo->pid)
> +			continue;
> +
> +		i3cdev->boardinfo = i3cboardinfo;
> +		i3cdev->info.static_addr = i3cboardinfo->static_addr;
> +		return;
> +	}
> +}
> +
>  static struct i3c_dev_desc *
>  i3c_master_search_i3c_dev_duplicate(struct i3c_dev_desc *refdev)
>  {
> @@ -1831,10 +1846,10 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
>  	if (ret)
>  		goto err_detach_dev;
>  
> +	i3c_master_attach_boardinfo(newdev);
> +
>  	olddev = i3c_master_search_i3c_dev_duplicate(newdev);
>  	if (olddev) {
> -		newdev->boardinfo = olddev->boardinfo;
> -		newdev->info.static_addr = olddev->info.static_addr;
>  		newdev->dev = olddev->dev;
>  		if (newdev->dev)
>  			newdev->dev->desc = newdev;


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
