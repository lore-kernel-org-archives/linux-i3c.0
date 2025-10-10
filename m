Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4626CCCA476
	for <linux-i3c@archiver.kernel.org>; Fri, 10 Oct 2025 06:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3dcJfqCyTKEcYg5kFacfd/S1FKKhHYa3kLnobB3Dr1g=; b=k0p9T8U+qWue9o
	T2lh6iziSCjoigIp5GiAz8VvJ2ezWHSr4Rio+JzGWOkV9PvBxvB3983hUZG04YtxUi5O/0OhYquX6
	3kO2z0saYc/uupCWl3FzuKrqWrf2IOuWKludQBKA/87ijC9T1usWm00Dut3KzsQdkdcNtxBF5MkHU
	MCYRAD8Jwl9uAE++O/XLnywxCC9jZ5qOtz5Qx4nwNF5+c9MMI5jHvG8Wm8HZY+PzhRfgRNDiJjtkE
	CBo7iXs5n5Xc3PXHgjhg5ABobc01S5Ui/RYY56kPJl4/WDdRPz/5JA9vrdCFEYKZ35vrG95I1kbCk
	4ibUo86b48oJJp+V0ccg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v76iM-00000007mFR-3yfA;
	Fri, 10 Oct 2025 06:34:54 +0000
Received: from cssvr7.cse.ust.hk ([143.89.41.157] helo=cse.ust.hk)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v76iJ-00000007mE8-2jRK
	for linux-i3c@lists.infradead.org;
	Fri, 10 Oct 2025 06:34:53 +0000
Received: from osx.local (ecs-119-8-240-33.compute.hwclouds-dns.com [119.8.240.33] (may be forged))
	(authenticated bits=0)
	by cse.ust.hk (8.18.1/8.12.5) with ESMTPSA id 59A6YDcH2442651
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 10 Oct 2025 14:34:19 +0800
ARC-Seal: i=1; a=rsa-sha256; d=cse.ust.hk; s=arccse; t=1760078061; cv=none;
	b=iyh4uTH33qzmNtoDxOsdakGME2842mUtVmLWN51a/yKyinCxDIxVJmEYQYyEvSGUfOpn4XMNrZqWl6GIEYq4scd9w1p12keduyncuGV3aFV9GKEt3SdbRELp8apI7y+Re53ObPm6xwXldEMQcHmohYLtAQtDqILChXNjP4Mt9JE=
ARC-Message-Signature: i=1; a=rsa-sha256; d=cse.ust.hk; s=arccse;
	t=1760078061; c=relaxed/relaxed;
	bh=mlixuZgziH+wjVJSfwbssxjlyT8K5O91PRYV9CIA+nk=;
	h=DKIM-Signature:Date:From:To:Subject:Message-ID:MIME-Version; b=w7ZddfkYI4L+Q2EOFZPOE1oRWTDGc8ECcVRnBW7X9/NS/p/rbaTS3++y+x/A0F6Yiw8m0vp/Ce30znLiocO52lMmm4ieL56OSjzHBLQBTFgY6ATAAvJ7kvKPE8/xrcBiKzTjL6hWwUTptGk7GnyGibF+A/ZyqFzi3128WdHyvY8=
ARC-Authentication-Results: i=1; cse.ust.hk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cse.ust.hk;
	s=cseusthk; t=1760078061;
	bh=mlixuZgziH+wjVJSfwbssxjlyT8K5O91PRYV9CIA+nk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tCruLc/4VmyGm6a9MIIxurcOVxwTx/Iel0VnEiWBcsHRHBLAazx26FnqJo9z+w1xl
	 5qvgVTWRNwFrdeAjjjFL2vNQzoj2ci1LvpaxZ/3SWZ8vJHpUR58JpBYz6YCGFs1nWP
	 N8tTDQoClniJcd9twSb2tTt7cKNbKmV8UO23vjoM=
Date: Fri, 10 Oct 2025 14:34:08 +0800
From: Shuhao Fu <sfual@cse.ust.hk>
To: Frank Li <Frank.li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: fix refcount inconsistency in i3c_master_register
Message-ID: <aOio4HtjjfXclSW1@osx.local>
References: <aOYSTX5EA_nRoIY_@osx.local>
 <aOfgB6UpBha+pvqa@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aOfgB6UpBha+pvqa@lizhi-Precision-Tower-5810>
X-Env-From: sfual
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_233452_300104_A65BBB14 
X-CRM114-Status: GOOD (  20.78  )
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

On Thu, Oct 09, 2025 at 12:17:11PM -0400, Frank Li wrote:
> On Wed, Oct 08, 2025 at 03:27:09PM +0800, Shuhao Fu wrote:
> > In `i3c_master_register`, a possible refcount inconsistency has been
> > identified, causing possible resource leak.
> >
> > Function `of_node_get` increases the refcount of `parent->of_node`. If
> > function `i3c_bus_init` fails, the function returns immediately without
> > a corresponding decrease, resulting in an inconsistent refcounter.
> >
> > In this patch, an extra goto label is added to ensure the balance of
> > refcount when `i3c_bus_init` fails.
> >
> > Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
> > Signed-off-by: Shuhao Fu <sfual@cse.ust.hk>
> > ---
> >  drivers/i3c/master.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> > index d946db75d..9f4fe98d2 100644
> > --- a/drivers/i3c/master.c
> > +++ b/drivers/i3c/master.c
> > @@ -2885,7 +2885,7 @@ int i3c_master_register(struct i3c_master_controller *master,
> >
> >  	ret = i3c_bus_init(i3cbus, master->dev.of_node);
> >  	if (ret)
> > -		return ret;
> > +		goto err_put_of_node;
> 
> I think it'd better to set release function for master dev to release
> of_node because of_node_put() also missed at i3c_master_unregister()
> 
> you can refer drivers/base/platform.c
> 
> Frank

Do you mean that we should do `of_node_release` in
`platform_device_release`, instead of respecting the refcounting via
`of_node_put`? 

> 
> >
> >  	device_initialize(&master->dev);
> >  	dev_set_name(&master->dev, "i3c-%d", i3cbus->id);
> > @@ -2973,6 +2973,9 @@ int i3c_master_register(struct i3c_master_controller *master,
> >  err_put_dev:
> >  	put_device(&master->dev);
> >
> > +err_put_of_node:
> > +	of_node_put(master->dev.of_node);
> > +
> >  	return ret;
> >  }
> >  EXPORT_SYMBOL_GPL(i3c_master_register);
> > --
> > 2.39.5 (Apple Git-154)
> >
> >
> > --
> > linux-i3c mailing list
> > linux-i3c@lists.infradead.org
> > https://apc01.safelinks.protection.outlook.com/?url=http%3A%2F%2Flists.infradead.org%2Fmailman%2Flistinfo%2Flinux-i3c&data=05%7C02%7Csfual%40connect.ust.hk%7Cbfee3f910b654276330508de074f5750%7C6c1d415239d044ca88d9b8d6ddca0708%7C1%7C0%7C638956234525799989%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=aTeKcQJDC2Av%2FQ1MjtDuoOYrWJ6ZwhbjQbHs%2Fci90jw%3D&reserved=0

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
