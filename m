Return-Path: <SRS0=UjAo=VJ=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBF81C742D1
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Jul 2019 16:34:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B26BE20838
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Jul 2019 16:34:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bE2wOM7R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B26BE20838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lVYA/1ymnaFpbie8I7NT55bQqe7dT6md7JRZTqeLV3s=; b=bE2wOM7RlPA9sj
	q/SUzL2cuNO2P0o+wOHpcM2aLkf1GbOyd8rdPaitsJ22x0Zqht9TD5HQtaXCai3xOm639nYK81Non
	xFcFZvPmx6F8crUW6wVJKZ8LQA0xJSFK/4TywqeUMaFZOVXUkGgJZHXZXcKv3Bo1ozXCbtBDAxHl0
	DsAYjZESyT1Y5dLExMADiYyosc9BLPP1f9XKTaN9PKcWvM3J8xlJj+PnOkR/i85IteZF+2Puk3zAj
	+AuguZt4t3/mPYs8u4FELUYSGgKa1gA8SCN6e2TXVJ6jWP9YCu+byLeQniFmMWYhpFWNJ1G0ZYPSN
	LrtDL8/w2j0wY1H90QXQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hlyVQ-0004T9-FI; Fri, 12 Jul 2019 16:34:44 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hlyVN-0004Sh-Fu
 for linux-i3c@lists.infradead.org; Fri, 12 Jul 2019 16:34:42 +0000
Received: from pc-381.home
 (2a01cb0c80061e00e835b5cf688fec09.ipv6.abo.wanadoo.fr
 [IPv6:2a01:cb0c:8006:1e00:e835:b5cf:688f:ec09])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 04013274268;
 Fri, 12 Jul 2019 17:34:39 +0100 (BST)
Date: Fri, 12 Jul 2019 18:34:36 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: [PATCH v4 2/3] i3c: move i3c_device_match_id to device.c and
 export it
Message-ID: <20190712183436.1b3d3cf5@pc-381.home>
In-Reply-To: <SN6PR12MB265549866115B706616C2081AEF20@SN6PR12MB2655.namprd12.prod.outlook.com>
References: <cover.1562931742.git.vitor.soares@synopsys.com>
 <debadccffef84c541601a97162ac656cd7c58478.1562931742.git.vitor.soares@synopsys.com>
 <20190712180338.47b50e9f@linux.home>
 <SN6PR12MB265549866115B706616C2081AEF20@SN6PR12MB2655.namprd12.prod.outlook.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190712_093441_664256_5B59E168 
X-CRM114-Status: GOOD (  12.32  )
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
Cc: "Joao.Pinto@synopsys.com" <Joao.Pinto@synopsys.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "rafael@kernel.org" <rafael@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 "lorenzo@kernel.org" <lorenzo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Fri, 12 Jul 2019 16:21:49 +0000
Vitor Soares <Vitor.Soares@synopsys.com> wrote:

> > 
> > You're missing a kerneldoc here.  
> 
> I will do that. Can you clarify why we need that?
> 

So the function is properly documented here [1].

> >   
> > > +const struct i3c_device_id *
> > > +i3c_device_match_id(struct i3c_device *i3cdev,
> > > +		    const struct i3c_device_id *id_table)
> > > +{
> > > +	struct i3c_device_info devinfo;
> > > +	const struct i3c_device_id *id;
> > > +
> > > +	i3c_device_get_info(i3cdev, &devinfo);
> > > +
> > > +	/*
> > > +	 * The lower 32bits of the provisional ID is just filled with a random
> > > +	 * value, try to match using DCR info.
> > > +	 */
> > > +	if (!I3C_PID_RND_LOWER_32BITS(devinfo.pid)) {
> > > +		u16 manuf = I3C_PID_MANUF_ID(devinfo.pid);
> > > +		u16 part = I3C_PID_PART_ID(devinfo.pid);
> > > +		u16 ext_info = I3C_PID_EXTRA_INFO(devinfo.pid);
> > > +
> > > +		/* First try to match by manufacturer/part ID. */
> > > +		for (id = id_table; id->match_flags != 0; id++) {
> > > +			if ((id->match_flags & I3C_MATCH_MANUF_AND_PART) !=
> > > +			    I3C_MATCH_MANUF_AND_PART)
> > > +				continue;
> > > +
> > > +			if (manuf != id->manuf_id || part != id->part_id)
> > > +				continue;
> > > +
> > > +			if ((id->match_flags & I3C_MATCH_EXTRA_INFO) &&
> > > +			    ext_info != id->extra_info)
> > > +				continue;
> > > +
> > > +			return id;
> > > +		}
> > > +	}
> > > +
> > > +	/* Fallback to DCR match. */
> > > +	for (id = id_table; id->match_flags != 0; id++) {
> > > +		if ((id->match_flags & I3C_MATCH_DCR) &&
> > > +		    id->dcr == devinfo.dcr)
> > > +			return id;
> > > +	}
> > > +
> > > +	return NULL;
> > > +}
> > > +EXPORT_SYMBOL_GPL(i3c_device_match_id);
> > > +


[1]https://www.kernel.org/doc/html/latest/driver-api/i3c/device-driver-api.html

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
