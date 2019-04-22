Return-Path: <SRS0=YsXQ=SY=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5454C282CE
	for <linux-i3c@archiver.kernel.org>; Mon, 22 Apr 2019 16:07:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88AA820859
	for <linux-i3c@archiver.kernel.org>; Mon, 22 Apr 2019 16:07:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f1jcy5nj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88AA820859
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SDEgIyBI/HjpiIokDSqYjeK6NYaDZW/SpQ63rDnZEIo=; b=f1jcy5njFg7NXA
	t+oEM4KUh+/EAvCJYyhuOuzJDyg0n9frbZMJIbpeXg/4iYDKHqCDaFpuS3yxf/nrH1acAwNbM8lrd
	o+KBRXF26RcGbgUSoMIyPMp5qrLZ3ClcJj95J6m4WElgJNN80lXmU9/6W2ASN2sztmqLBk/aZXQOY
	GcWPNzyvWgH1drGHM/txfnpvOa7o6rNrze/VzLznisaB2j8HEi/hoPPIvPRFaUgTCskS3FbQr/x5C
	1mDOLFiwtLZiqBi//olWU+OiUIGLkTjhpNLPTvEYPcqsQyq3Ge9ToSRcx1WfoDQQvZtdqU0/pf2kJ
	mgvKXf389sUnmZo/2s7Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hIbTX-0003PL-2m; Mon, 22 Apr 2019 16:07:23 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hIbTU-0003Oh-19
 for linux-i3c@lists.infradead.org; Mon, 22 Apr 2019 16:07:21 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 6F132280AE6;
 Mon, 22 Apr 2019 17:07:18 +0100 (BST)
Date: Mon, 22 Apr 2019 18:07:15 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: [PATCH 1/3] i3c: fix i2c and i3c scl rate by bus mode
Message-ID: <20190422180715.40abe1b9@collabora.com>
In-Reply-To: <13D59CF9CEBAF94592A12E8AE55501350A61B3B4@DE02WEMBXB.internal.synopsys.com>
References: <cover.1555350118.git.vitor.soares@synopsys.com>
 <05fdeea79db83970e9ecb0d7045b4dd98f206f06.1555350118.git.vitor.soares@synopsys.com>
 <20190416075041.22f8e849@collabora.com>
 <13D59CF9CEBAF94592A12E8AE55501350A61596D@DE02WEMBXB.internal.synopsys.com>
 <20190416165250.0606e5a2@collabora.com>
 <13D59CF9CEBAF94592A12E8AE55501350A61B3B4@DE02WEMBXB.internal.synopsys.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190422_090720_338950_C99B1EB3 
X-CRM114-Status: GOOD (  16.65  )
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
Cc: "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 "joao.pinto@synopsys.com" <Joao.Pinto@synopsys.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Mon, 22 Apr 2019 15:54:33 +0000
Vitor Soares <Vitor.Soares@synopsys.com> wrote:


> > > >     
> > > > >  {
> > > > >  	i3cbus->mode = mode;
> > > > >  
> > > > > -	if (!i3cbus->scl_rate.i3c)
> > > > > -		i3cbus->scl_rate.i3c = I3C_BUS_TYP_I3C_SCL_RATE;
> > > > > -
> > > > > -	if (!i3cbus->scl_rate.i2c) {
> > > > > -		if (i3cbus->mode == I3C_BUS_MODE_MIXED_SLOW)
> > > > > -			i3cbus->scl_rate.i2c = I3C_BUS_I2C_FM_SCL_RATE;
> > > > > -		else
> > > > > -			i3cbus->scl_rate.i2c = I3C_BUS_I2C_FM_PLUS_SCL_RATE;
> > > > > +	switch (i3cbus->mode) {
> > > > > +	case I3C_BUS_MODE_PURE:
> > > > > +		if (!i3cbus->scl_rate.i3c)
> > > > > +			i3cbus->scl_rate.i3c = I3C_BUS_TYP_I3C_SCL_RATE;
> > > > > +		break;
> > > > > +	case I3C_BUS_MODE_MIXED_FAST:
> > > > > +		if (!i3cbus->scl_rate.i3c)
> > > > > +			i3cbus->scl_rate.i3c = I3C_BUS_TYP_I3C_SCL_RATE;
> > > > > +		if (!i3cbus->scl_rate.i2c)
> > > > > +			i3cbus->scl_rate.i2c = i2c_scl_rate;
> > > > > +		break;
> > > > > +	case I3C_BUS_MODE_MIXED_SLOW:
> > > > > +		if (!i3cbus->scl_rate.i2c)
> > > > > +			i3cbus->scl_rate.i2c = i2c_scl_rate;
> > > > > +		i3cbus->scl_rate.i3c = i3cbus->scl_rate.i2c;    
> > > > 
> > > > Maybe we should do
> > > > 
> > > > 		if (!i3cbus->scl_rate.i3c ||
> > > > 		    i3cbus->scl_rate.i3c > i3cbus->scl_rate.i2c)
> > > > 			i3cbus->scl_rate.i3c = i3cbus->scl_rate.i2c;
> > > > 					   
> > > > Just in case the I3C rate forced by the user is lower than the max I2C
> > > > rate.    
> > > 
> > > That was something that I considered but TBH it isn't a real use case.  
> > 
> > Add a WARN_ON() to at least catch such inconsistencies. And maybe we
> > should add a dev_warn() when the user-defined rates do not match
> > the mode/LVR constraints. It's easy to do a mistake when writing a dts.  
> 
> I think the WARN_ON() is too evasive on the screen and won't provide the 
> information we want.
> The dev_warn() should work perfectly here.
> 
> 		if (i3cbus->scl_rate.i3c < i3cbus->scl_rate.i2c)
> 			dev_warn(&i3cbus->cur_master->dev->dev,
> 				     "%s: i3c-scl-hz lower then i2c-scl-hz\n",  __func__);

Using dev_warn() sounds good, though I don't think you need the
__func__ here. Also, please print the i2c/i3c rates in the message, and
align the second line on the open parens.

> 		if (i3cbus->scl_rate.i2c != I3C_BUS_I2C_FM_SCL_RATE ||
> 		    i3cbus->scl_rate.i2c != I3C_BUS_I2C_FM_PLUS_SCL_RATE)
> 			dev_warn(&i3cbus->cur_master->dev->dev,
> 				     "%s: i2c-scl-hz not defined according MIPI I3C spec\n", 
> 				     __func__);

Is that really a problem? Having an i2c rate that is less than FM speed
sounds like a valid case to me.

> 
> Maybe it make more sense to do this check on of_populate_i3c_bus(), what 
> do you think?
> 

No, we really want to have this check here, because we might support
other HW description formats at some point (board-files, ACPI, ...).

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
