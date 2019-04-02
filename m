Return-Path: <SRS0=X30F=SE=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0FDAC4360F
	for <linux-i3c@archiver.kernel.org>; Tue,  2 Apr 2019 11:48:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71F8720857
	for <linux-i3c@archiver.kernel.org>; Tue,  2 Apr 2019 11:48:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LvWWnTB/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71F8720857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qpiERZnqf/xOYg+t+kYQo3txYajEcR8MLo0j90nJQFk=; b=LvWWnTB/erEEC1
	lPRKPg49+EOsK8WLWexTgp+FY8ICxgIgiXBdv4AMQfp1bhZwsEN4YtD3lIMwY7xXfnH0ZU0JM9WEv
	DYW0K7EXMMOMa9rVsy7Z0Sa1IvMbGFkhYYs4nHy66buPdN9NUiWZU5jf+d5QG0i+pJVwwvrsV9bnY
	03ffppNFkaPisKsBd3HJpMhwGrfGwKAsA4PwN3GS0hr38uGS8P16Uc51C66J9hA93hIcuIy1lrbPD
	1UiOMgXLUabYCRrf9wy3/hTDcXF3GDcDcQf1klOrvIcQWifFqNGoDOm5TCw5buIXv4Aqj5av2YqOi
	EnBJtAostm325xCs4Isw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBHu8-0006zh-2n; Tue, 02 Apr 2019 11:48:36 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBHu5-0006zK-3Y
 for linux-i3c@lists.infradead.org; Tue, 02 Apr 2019 11:48:34 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2C4832817F8;
 Tue,  2 Apr 2019 12:48:31 +0100 (BST)
Date: Tue, 2 Apr 2019 13:48:28 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Przemyslaw Gaj <pgaj@cadence.com>
Subject: Re: [PATCH v4 1/6] i3c: add addr and lvr to i2c_dev_desc structure
Message-ID: <20190402134828.4e0daeca@collabora.com>
In-Reply-To: <20190330153618.48719ee5@collabora.com>
References: <20190310135843.21154-1-pgaj@cadence.com>
 <20190310135843.21154-2-pgaj@cadence.com>
 <20190330153618.48719ee5@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190402_044833_286470_EDBB0D54 
X-CRM114-Status: GOOD (  16.75  )
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
Cc: linux-i3c@lists.infradead.org, vitor.soares@synopsys.com,
 rafalc@cadence.com, agolec@cadence.com, bbrezillon@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Sat, 30 Mar 2019 15:36:18 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> On Sun, 10 Mar 2019 13:58:38 +0000
> Przemyslaw Gaj <pgaj@cadence.com> wrote:
> 
> > I need to store address and lvr value for I2C devices without static definition
> > in DT. This allows secondary master to transmit DEFSLVS command properly.
> > 
> > Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>
> > ---
> >  include/linux/i3c/master.h | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> > index eca8337..3c27d9f 100644
> > --- a/include/linux/i3c/master.h
> > +++ b/include/linux/i3c/master.h
> > @@ -71,6 +71,9 @@ struct i2c_dev_boardinfo {
> >   * @common: common part of the I2C device descriptor
> >   * @boardinfo: pointer to the boardinfo attached to this I2C device
> >   * @dev: I2C device object registered to the I2C framework
> > + * @addr: I2C device address
> > + * @lvr: LVR (Legacy Virtual Register) needed by the I3C core to know about
> > + *	 the I2C device limitations
> >   *
> >   * Each I2C device connected on the bus will have an i2c_dev_desc.
> >   * This object is created by the core and later attached to the controller
> > @@ -84,6 +87,8 @@ struct i2c_dev_desc {
> >  	struct i3c_i2c_dev_desc common;
> >  	const struct i2c_dev_boardinfo *boardinfo;
> >  	struct i2c_client *dev;
> > +	u16 addr;
> > +	u8 lvr;  
> 
> You also need to remove lvr from i2c_dev_boardinfo and adjust the code
> to use i2c_dev_desc->addr and i2c_dev_desc->lvr in this patch, not in
> patch 3.

Hm, looks like I was wrong, you must keep i2c_dev_boardinfo->lvr as
i2c_dev_desc instances and i2c_dev_boardinfo objects are created
separately.

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
