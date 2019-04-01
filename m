Return-Path: <SRS0=6/zw=SD=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D99CC43381
	for <linux-i3c@archiver.kernel.org>; Mon,  1 Apr 2019 18:31:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AFEE20896
	for <linux-i3c@archiver.kernel.org>; Mon,  1 Apr 2019 18:31:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rTUeXW3y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AFEE20896
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NBF6WGHSR0eY+PqVhaojYJGOjpiKHkLfJ7vY5Y5c+Q0=; b=rTUeXW3yw9F6D4
	Zjw79uvoKB+TUGIFqMofR6jNfQTV86D4VbfDM6LNHTzrvwIFepZb+yjB/QSqr0ext03PHohW2CPZS
	3rGK/IbDvGUe+xYPOqAaA5fQpeFwDCX2fwoTr/kSVW+v4pWHu+ARuQuHIlvLEhsEaNtO3YaC6Dsdn
	Bss2QC2ZOpiVVbGd6w99EG0QWW7+ybXCvYpp3nzaTiHu20uHgXWwM74d0bqyBRl3MUl8BJOymj+bX
	GDm5qwhyNS6ar7mY9EkpA9A0BlICPzS3xH944I40qRRNrijDuiWpqxklEzNxfpEIN0Oaig7C2qimq
	5NWAGEjl4oC9rRKSEWLw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hB1iv-0003tc-Gd; Mon, 01 Apr 2019 18:31:57 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hB1is-0003tI-OM
 for linux-i3c@lists.infradead.org; Mon, 01 Apr 2019 18:31:56 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 7BC7A28142C;
 Mon,  1 Apr 2019 19:31:52 +0100 (BST)
Date: Mon, 1 Apr 2019 20:31:48 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: vitor <vitor.soares@synopsys.com>
Subject: Re: [PATCH v4 1/6] i3c: add addr and lvr to i2c_dev_desc structure
Message-ID: <20190401203148.028cdf01@collabora.com>
In-Reply-To: <87ba262f-384e-711c-4673-103099cdb8ad@synopsys.com>
References: <20190310135843.21154-1-pgaj@cadence.com>
 <20190310135843.21154-2-pgaj@cadence.com>
 <20190330153618.48719ee5@collabora.com>
 <87ba262f-384e-711c-4673-103099cdb8ad@synopsys.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_113154_926290_927BF2A5 
X-CRM114-Status: GOOD (  19.28  )
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
Cc: Przemyslaw Gaj <pgaj@cadence.com>, agolec@cadence.com,
 linux-i3c@lists.infradead.org, rafalc@cadence.com, bbrezillon@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Mon, 1 Apr 2019 19:17:03 +0100
vitor <vitor.soares@synopsys.com> wrote:

> Hi,
> 
> On 30/03/19 14:36, Boris Brezillon wrote:
> > On Sun, 10 Mar 2019 13:58:38 +0000
> > Przemyslaw Gaj <pgaj@cadence.com> wrote:
> >  
> >> I need to store address and lvr value for I2C devices without static definition
> >> in DT. This allows secondary master to transmit DEFSLVS command properly.
> >>
> >> Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>
> >> ---
> >>  include/linux/i3c/master.h | 5 +++++
> >>  1 file changed, 5 insertions(+)
> >>
> >> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> >> index eca8337..3c27d9f 100644
> >> --- a/include/linux/i3c/master.h
> >> +++ b/include/linux/i3c/master.h
> >> @@ -71,6 +71,9 @@ struct i2c_dev_boardinfo {
> >>   * @common: common part of the I2C device descriptor
> >>   * @boardinfo: pointer to the boardinfo attached to this I2C device
> >>   * @dev: I2C device object registered to the I2C framework
> >> + * @addr: I2C device address
> >> + * @lvr: LVR (Legacy Virtual Register) needed by the I3C core to know about
> >> + *	 the I2C device limitations
> >>   *
> >>   * Each I2C device connected on the bus will have an i2c_dev_desc.
> >>   * This object is created by the core and later attached to the controller
> >> @@ -84,6 +87,8 @@ struct i2c_dev_desc {
> >>  	struct i3c_i2c_dev_desc common;
> >>  	const struct i2c_dev_boardinfo *boardinfo;
> >>  	struct i2c_client *dev;
> >> +	u16 addr;
> >> +	u8 lvr;  
> > You also need to remove lvr from i2c_dev_boardinfo and adjust the code
> > to use i2c_dev_desc->addr and i2c_dev_desc->lvr in this patch, not in
> > patch 3.
> >  
> 
> Why can't we keep the lvr and addr in i2c_dev_boardinfo and need this information on i2c_dev_desc?

Because i2c_dev_boardinfo is extracted from the DT and the secondary
slaves does not necessarily have this description. The idea is to keep
reserving the address slot for the I2C device even if we don't expose
it to the upper layers.

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
