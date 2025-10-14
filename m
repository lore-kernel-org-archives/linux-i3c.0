Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E17CCD183
	for <linux-i3c@archiver.kernel.org>; Tue, 14 Oct 2025 01:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O10zLQjF0Lf5NtKESSsLTRN7Am2CjGMkG7ekS8gtWR8=; b=gYFriowWPTF/Yu
	mdQV2YdZZkQvFZoRBhgFp1Q86Glsi2cyKAl3lGbwoW72crhZTmD7OU7NZguD70HKoApe7HA6k1gOo
	dUf5Obl24LEXZOVsNsqiU428Y1xRebfhC+yliJJ9AhU0b1oDaek1M2lAFndq8lSyCP/j+bRjdp0Zi
	qKCWKd/qVNosS59x9p7hO0qfmDKz1ahzz+DyVu2sd8ei/wyp/cQtAS7hLhI3r9XYUVsEAdheA6pjx
	RPRzyJ0Im0F6X67UAZfUWH4e3B1i8gCNS6/5WXL0e743fMbCtmw2Z0a1z5wVBPl8BOzABPYTh1Stv
	3iqnaxpTI9loSJvF/Fdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8UGV-0000000EvcE-01V0;
	Tue, 14 Oct 2025 01:55:51 +0000
Received: from cssvr7.cse.ust.hk ([143.89.41.157] helo=cse.ust.hk)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8UGS-0000000Evbq-0anI
	for linux-i3c@lists.infradead.org;
	Tue, 14 Oct 2025 01:55:50 +0000
Received: from osx.local (ecs-119-8-240-30.compute.hwclouds-dns.com [119.8.240.30])
	(authenticated bits=0)
	by cse.ust.hk (8.18.1/8.12.5) with ESMTPSA id 59E1tWbH3266543
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 14 Oct 2025 09:55:39 +0800
ARC-Seal: i=1; a=rsa-sha256; d=cse.ust.hk; s=arccse; t=1760406940; cv=none;
	b=TG2eDPngy1F+FYyMTrlX6x9XY1uQqFwbkPSCOlvTF/Ifjud9UMkFGMME2umX0DLmHDYOT/pJlKrribTS8cuftD+BNHJyxtKdbRMolyE3Brer19UOlur91nn+IBmP9bQuAylgnsiHcJn61XN0E0EHXXffD8rlBrSFZTWm3I0PDPg=
ARC-Message-Signature: i=1; a=rsa-sha256; d=cse.ust.hk; s=arccse;
	t=1760406940; c=relaxed/relaxed;
	bh=G++JBLc5OONg4P4tABuFONmwLMMGyA7zCS68NMAH4tE=;
	h=DKIM-Signature:Date:From:To:Subject:Message-ID:MIME-Version; b=xuDtpo1OE0ISqB+jWu8ylzK7bTAOXc+Rxp/6SiKCQ2aogR6L5Wh1ET4QZY56N6vHjiQj3jW88HfGulGLtvdw5hESfFugKEEmmS08BFVo8eSF/6+zxVBYIIsKgfB4I3+5LmnFTO/7AEtffJYH4J62BVDw9a0Sha2DkTj7wEHCy2I=
ARC-Authentication-Results: i=1; cse.ust.hk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cse.ust.hk;
	s=cseusthk; t=1760406940;
	bh=G++JBLc5OONg4P4tABuFONmwLMMGyA7zCS68NMAH4tE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lDaXZY7XrO+vLBk8Z77JHj8UzAyV9y4RKBSEJecsFCCaacVjyj6Zg6G1i8Mj6d2tt
	 zZKdkfrVWxXyWE7IAW5il+8AE8HqzDKdyRvvqAW0EAqapN1J1Td0vAyQ11tzBz9WlA
	 uVKCKR51ouC8TPV7jzC6W4IyoBUBnp+4hDENL7FI=
Date: Tue, 14 Oct 2025 09:55:26 +0800
From: Shuhao Fu <sfual@cse.ust.hk>
To: Frank Li <Frank.li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: fix refcount inconsistency in i3c_master_register
Message-ID: <aO2tjp_FsV_WohPG@osx.local>
References: <aOYSTX5EA_nRoIY_@osx.local>
 <aOfgB6UpBha+pvqa@lizhi-Precision-Tower-5810>
 <aOio4HtjjfXclSW1@osx.local>
 <aO1etATnPSklqdua@lizhi-Precision-Tower-5810>
 <20251013210953.GA2124@DESKTOP-2SPVBES.localdomain>
 <aO12r9v4xaJKHUQs@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aO12r9v4xaJKHUQs@lizhi-Precision-Tower-5810>
X-Env-From: sfual
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_185548_801013_1940079D 
X-CRM114-Status: GOOD (  35.47  )
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

On Mon, Oct 13, 2025 at 06:01:19PM -0400, Frank Li wrote:
> On Tue, Oct 14, 2025 at 05:09:53AM +0800, Shuhao Fu wrote:
> > On Mon, Oct 13, 2025 at 04:19:00PM -0400, Frank Li wrote:
> > > On Fri, Oct 10, 2025 at 02:34:08PM +0800, Shuhao Fu wrote:
> > > > On Thu, Oct 09, 2025 at 12:17:11PM -0400, Frank Li wrote:
> > > > > On Wed, Oct 08, 2025 at 03:27:09PM +0800, Shuhao Fu wrote:
> > > > > > In `i3c_master_register`, a possible refcount inconsistency has been
> > > > > > identified, causing possible resource leak.
> > > > > >
> > > > > > Function `of_node_get` increases the refcount of `parent->of_node`. If
> > > > > > function `i3c_bus_init` fails, the function returns immediately without
> > > > > > a corresponding decrease, resulting in an inconsistent refcounter.
> > > > > >
> > > > > > In this patch, an extra goto label is added to ensure the balance of
> > > > > > refcount when `i3c_bus_init` fails.
> > > > > >
> > > > > > Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
> > > > > > Signed-off-by: Shuhao Fu <sfual@cse.ust.hk>
> > > > > > ---
> > > > > >  drivers/i3c/master.c | 5 ++++-
> > > > > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> > > > > > index d946db75d..9f4fe98d2 100644
> > > > > > --- a/drivers/i3c/master.c
> > > > > > +++ b/drivers/i3c/master.c
> > > > > > @@ -2885,7 +2885,7 @@ int i3c_master_register(struct i3c_master_controller *master,
> > > > > >
> > > > > >  	ret = i3c_bus_init(i3cbus, master->dev.of_node);
> > > > > >  	if (ret)
> > > > > > -		return ret;
> > > > > > +		goto err_put_of_node;
> > > > >
> > > > > I think it'd better to set release function for master dev to release
> > > > > of_node because of_node_put() also missed at i3c_master_unregister()
> > > > >
> > > > > you can refer drivers/base/platform.c
> > > > >
> > > > > Frank
> > > >
> > > > Do you mean that we should do `of_node_release` in
> > > > `platform_device_release`, instead of respecting the refcounting via
> > > > `of_node_put`?
> > >
> > > Sorry, I checked code again.
> > >
> > > static void i3c_masterdev_release(struct device *dev)
> > > {
> > >         ...
> > >         of_node_put(dev->of_node);
> > > }
> > >
> > > i3c_master_register()
> > > {
> > > 	...
> > > 	master->dev.release = i3c_masterdev_release;
> > > 	...
> > > };
> > >
> > > Suppose of_node_put() will be auto called when put_device(&master->dev);
> > >
> > > Do you really meet the problem or just static anaysis?
> > >
> > > Frank
> >
> > Honestly, it's from static analysis.
> >
> > My apologies for overlooking the release handle. I checked the code once
> > again. It still looks suspicious as it would not call `put_device` if it
> > fails. I also checked call sites related to `i3c_master_register` and
> > they dont seem to do the clean-up if register fails.
> 
> 
> @@ -2814,10 +2816,6 @@ int i3c_master_register(struct i3c_master_controller *master,
>         INIT_LIST_HEAD(&master->boardinfo.i2c);
>         INIT_LIST_HEAD(&master->boardinfo.i3c);
> 
> -       ret = i3c_bus_init(i3cbus, master->dev.of_node);
> -       if (ret)
> -               return ret;
> -
>         device_initialize(&master->dev);
>         dev_set_name(&master->dev, "i3c-%d", i3cbus->id);
> 
> @@ -2825,6 +2823,10 @@ int i3c_master_register(struct i3c_master_controller *master,
>         master->dev.coherent_dma_mask = parent->coherent_dma_mask;
>         master->dev.dma_parms = parent->dma_parms;
> 
> +       ret = i3c_bus_init(i3cbus, master->dev.of_node);
> +        if (ret)
> +                goto err_put_dev;
> +
> 
> I inject at error at i3c_bus_init(), above code can trigger i3c_masterdev_release,
> which call of_node_put().
> 
> Frank
> 

Thank you for fixing the refcounting issue. May I kindly ask for a
reported-by tag for this fix "Reported-by: Shuhao Fu <sfual@cse.ust.hk>"?

Thanks,
Shuhao

> >
> > Shuhao
> > > >
> > > > >
> > > > > >
> > > > > >  	device_initialize(&master->dev);
> > > > > >  	dev_set_name(&master->dev, "i3c-%d", i3cbus->id);
> > > > > > @@ -2973,6 +2973,9 @@ int i3c_master_register(struct i3c_master_controller *master,
> > > > > >  err_put_dev:
> > > > > >  	put_device(&master->dev);
> > > > > >
> > > > > > +err_put_of_node:
> > > > > > +	of_node_put(master->dev.of_node);
> > > > > > +
> > > > > >  	return ret;
> > > > > >  }
> > > > > >  EXPORT_SYMBOL_GPL(i3c_master_register);
> > > > > > --
> > > > > > 2.39.5 (Apple Git-154)
> > > > > >
> > > > > >
> > > > > > --
> > > > > > linux-i3c mailing list
> > > > > > linux-i3c@lists.infradead.org
> > > > > > https://apc01.safelinks.protection.outlook.com/?url=http%3A%2F%2Flists.infradead.org%2Fmailman%2Flistinfo%2Flinux-i3c&data=05%7C02%7Csfual%40connect.ust.hk%7Cdbe4f1ecc0c84f304fca08de0aa414ff%7C6c1d415239d044ca88d9b8d6ddca0708%7C1%7C0%7C638959897018898845%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=%2BmCDBh4d6Se%2BuO5xJgSDVupMRir7ZFH7f8RtzGUucoE%3D&reserved=0
> > > >
> > > > --
> > > > linux-i3c mailing list
> > > > linux-i3c@lists.infradead.org
> > > > https://apc01.safelinks.protection.outlook.com/?url=http%3A%2F%2Flists.infradead.org%2Fmailman%2Flistinfo%2Flinux-i3c&data=05%7C02%7Csfual%40connect.ust.hk%7Cdbe4f1ecc0c84f304fca08de0aa414ff%7C6c1d415239d044ca88d9b8d6ddca0708%7C1%7C0%7C638959897018922222%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=MdqJwKEKImd8UAQ0hyHjWyZx8vX1YSxU%2FqKDgpF0JPA%3D&reserved=0

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
