Return-Path: <SRS0=GBB+=SB=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8B42C43381
	for <linux-i3c@archiver.kernel.org>; Sat, 30 Mar 2019 07:55:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 902DE2184C
	for <linux-i3c@archiver.kernel.org>; Sat, 30 Mar 2019 07:55:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rgnlnkm9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 902DE2184C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MSlfVlBBEX/F7sqw9qYRdhQIxAYqLcntbEZM5jD6Phg=; b=rgnlnkm9WWA7ka
	JXsZ++L9dYecFXUpLyRIbV1tLWZN0UaNBrDVymZ/r87Z9IkZu5FK/K5jSZTnicrMsdOlsnSbVwiqX
	IYX5zRHzNe9Hdba/9gQDvVr/ddzuqgsuXfBtfVoy5K9EBX5+aMG5msvZVc0CC89s3kmulOtJZpcp9
	SeqpEVHyEB8icBZOohYvt1zhVGmWso7StiUaI/ZH/9BJbb/nwy9tC+ine4ROJdeIgybucSAsquc0W
	/xx460YWjCpExkBj9OqqZDRjmUGLrHz9GLGCkPLcbaxulkRKt9Y3Rh0jscZcD8L4PY2P6bVJ9whUC
	M24YwqdU4+FYqq3P8/rw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hA8pQ-00036y-4Q; Sat, 30 Mar 2019 07:55:00 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hA8pN-00036a-C0
 for linux-i3c@lists.infradead.org; Sat, 30 Mar 2019 07:54:59 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D5BAE274F9B;
 Sat, 30 Mar 2019 07:54:54 +0000 (GMT)
Date: Sat, 30 Mar 2019 08:54:52 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: vitor <vitor.soares@synopsys.com>
Subject: Re: [PATCH] i3c: master:dw: Fix dw_i3c_master_disable controller by
 using correct mask
Message-ID: <20190330085452.47ec2621@collabora.com>
In-Reply-To: <e02e8ce4-e392-99db-b1c1-d9b5046033d4@synopsys.com>
References: <9af6e8d204c7d846b727a9a010b79f1df7ecec1e.1551907779.git.vitor.soares@synopsys.com>
 <e02e8ce4-e392-99db-b1c1-d9b5046033d4@synopsys.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190330_005457_545968_64FD7401 
X-CRM114-Status: GOOD (  15.74  )
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
 bbrezillon@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Wed, 27 Mar 2019 21:37:59 +0000
vitor <vitor.soares@synopsys.com> wrote:

> Hi Boris,
> 
> 
> On 06/03/19 21:57, Vitor Soares wrote:
> > The controller is disable by clear the DEV_CTRL_ENABLE bit rather

		      ^disabled by clearing

> > than set it. This is fixed by using the correct mask.

	 ^setting


The commit message is not accurate. You were not setting the
DEV_CTRL_ENABLE bit, you were actually masking all other bits and
keeping the DEV_CTRL_ENABLE one unchanged.

> >
> > Fixes: 1dd728f5d4d4 ("i3c: master: Add driver for Synopsys DesignWare IP")

Missing

Cc: <stable@vger.kernel.org>

line.

Can you send a new version with this fixed?

Thanks,

Boris

> > Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
> > ---
> >  drivers/i3c/master/dw-i3c-master.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> > index bb03079..ec385fb 100644
> > --- a/drivers/i3c/master/dw-i3c-master.c
> > +++ b/drivers/i3c/master/dw-i3c-master.c
> > @@ -300,7 +300,7 @@ to_dw_i3c_master(struct i3c_master_controller *master)
> >  
> >  static void dw_i3c_master_disable(struct dw_i3c_master *master)
> >  {
> > -	writel(readl(master->regs + DEVICE_CTRL) & DEV_CTRL_ENABLE,
> > +	writel(readl(master->regs + DEVICE_CTRL) & ~DEV_CTRL_ENABLE,
> >  	       master->regs + DEVICE_CTRL);
> >  }
> >    
> 
> Friendly ping.
> 
> 
> Best regards,
> Vitor Soares
> 
> _______________________________________________
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
